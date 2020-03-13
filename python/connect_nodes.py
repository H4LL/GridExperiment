import syft as sy
from syft.workers.node_client import NodeClient
import torch
import pickle
import time
import torchvision
from torchvision import datasets, transforms
import tqdm

import torch as th
import torch.nn as nn
import torch.optim as optim
import torch.nn.functional as F

hook = sy.TorchHook(torch)

# Connect directly to grid nodes
nodes = ["ws://localhost:3000/",
         "ws://localhost:3001/"]

compute_nodes = []
for node in nodes:
    compute_nodes.append( NodeClient(hook, node) )

N_SAMPLES = 10000
MNIST_PATH = './dataset'

transform = transforms.Compose([
                              transforms.ToTensor(),
                              transforms.Normalize((0.1307,), (0.3081,)),
                              ])

trainset = datasets.MNIST(MNIST_PATH, download=True, train=True, transform=transform)
trainloader = torch.utils.data.DataLoader(trainset, batch_size=N_SAMPLES, shuffle=False)

dataiter = iter(trainloader)

images_train_mnist, labels_train_mnist = dataiter.next()

datasets_mnist = torch.split(images_train_mnist, int(len(images_train_mnist) / len(compute_nodes)), dim=0 ) #tuple of chunks (dataset / number of nodes)
labels_mnist = torch.split(labels_train_mnist, int(len(labels_train_mnist) / len(compute_nodes)), dim=0 )  #tuple of chunks (labels / number of nodes)


data = []
label = []

for i in range(len(compute_nodes)):
    data.append(datasets_mnist[i].send(compute_nodes[i]))
    label.append(labels_mnist[i].send(compute_nodes[i]))

print("X tensor pointers: ", data)
print("Y tensor pointers: ", label)

hook = sy.TorchHook(th)
class Net(nn.Module):
    def __init__(self):
        super(Net, self).__init__()
        self.conv1 = nn.Conv2d(1, 20, 5, 1)
        self.conv2 = nn.Conv2d(20, 50, 5, 1)
        self.fc1 = nn.Linear(4*4*50, 500)
        self.fc2 = nn.Linear(500, 10)

    def forward(self, x):
        x = F.relu(self.conv1(x))
        x = F.max_pool2d(x, 2, 2)
        x = F.relu(self.conv2(x))
        x = F.max_pool2d(x, 2, 2)
        x = x.view(-1, 4*4*50)
        x = F.relu(self.fc1(x))
        x = self.fc2(x)
        return F.log_softmax(x, dim=1)


device = th.device("cuda:0" if th.cuda.is_available() else "cpu")

if(th.cuda.is_available()):
    th.set_default_tensor_type(th.cuda.FloatTensor)

model = Net()
optimizer = optim.SGD(model.parameters(), lr=0.01)
criterion = nn.CrossEntropyLoss()


def train(x, target, model, opt):

    #1) Zero our grads
    model.zero_grad()

    #2) Make a prediction
    pred = model(x)

    #3) Figure out how much we missed by
    criterion = nn.NLLLoss()
    loss = criterion(pred, target)

    #4) Backprop the loss on the end layer
    loss.backward()

    #6) Change the weights
    opt.step()

    return loss

epochs = 5

for j in range(epochs):
    for i in range(2):
        model.send(compute_nodes[i])
        loss = train(data[i], label[i], model, optimizer).get()
        model.get()
    print("Epoch: ",j,"       Loss: ",loss)
