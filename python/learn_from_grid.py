import grid as gr
import syft as sy
import torch as th
import torch.nn as nn
import torch.optim as optim
import torch.nn.functional as F

#DEFINE MODEL

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
model.to(device)
optimizer = optim.SGD(model.parameters(), lr=0.01)
criterion = nn.CrossEntropyLoss()

#CONNECT TO GRID
GRID_ADDRESS = 'localhost'
GRID_PORT = '5000'
my_grid = gr.GridNetwork("http://" + GRID_ADDRESS + ":" + GRID_PORT)

#SEARCH A DATASET
data = my_grid.search("#X", "#mnist", "#dataset")
target = my_grid.search("#Y", "#mnist", "#dataset")
data

#TRAIN
def epoch_total_size(data):
    total = 0
    for i in range(len(data)):
        for j in range(len(data[i])):
            total += data[i][j].shape[0]

    return total

N_EPOCS = 3
SAVE_MODEL = True
SAVE_MODEL_PATH = '.'

def train(epoch):
    model.train()
    epoch_total = epoch_total_size(data)
    current_epoch_size = 0
    for i in range(len(data)):
        for j in range(len(data[i])):
            current_epoch_size += len(data[i][j])
            worker = data[i][j].location
            model.send(worker)
            optimizer.zero_grad()
            pred = model(data[i][j])
            loss = criterion(pred, target[i][j])
            loss.backward()
            optimizer.step()
            model.get()
            loss = loss.get()
            print('Train Epoch: {} | With {} data |: [{}/{} ({:.0f}%)]\tLoss: {:.6f}'.format(
                      epoch, worker.id, current_epoch_size, epoch_total,
                            100. *  current_epoch_size / epoch_total, loss.item()))

for epoch in range(N_EPOCS):
    train(epoch)

if(SAVE_MODEL):
    print("Saving model")
    th.save(model.state_dict(), SAVE_MODEL_PATH + "/fedmodel_mnist.pt")

my_grid.disconnect_nodes()
