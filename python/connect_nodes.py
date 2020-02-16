import grid as gr
import syft as sy
import torch
import pickle
import time
import torchvision
from torchvision import datasets, transforms
import tqdm

hook = sy.TorchHook(torch)


#CONNECT TO NODES
# Connect directly to grid nodes
nodes = ["ws://localhost:3000/",
         "ws://localhost:3001/"]

compute_nodes = []
for node in nodes:
    compute_nodes.append( gr.WebsocketGridClient(hook, node) )


#LOAD DATASET
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

#SPLIT DATASET
datasets_mnist = torch.split(images_train_mnist, int(len(images_train_mnist) / len(compute_nodes)), dim=0 ) #tuple of chunks (dataset / number of nodes)
labels_mnist = torch.split(labels_train_mnist, int(len(labels_train_mnist) / len(compute_nodes)), dim=0 )  #tuple of chunks (labels / number of nodes)


#TAGGING TENSORS
tag_img = []
tag_label = []

for i in range(len(compute_nodes)):
    tag_img.append(datasets_mnist[i].tag("#X", "#mnist", "#dataset").describe("The input datapoints to the MNIST dataset."))
    tag_label.append(labels_mnist[i].tag("#Y", "#mnist", "#dataset").describe("The input labels to the MNIST dataset."))


#SEND OUT DATA
# NOTE: For some reason, there is strange behavior when trying to send within a loop.
# Ex : tag_x[i].send(compute_nodes[i])
# When resolved, this should be updated.

shared_x1 = tag_img[0].send(compute_nodes[0], garbage_collect_data=False) # First chunk of dataset to Bob
shared_x2 = tag_img[1].send(compute_nodes[1], garbage_collect_data=False) # Second chunk of dataset to Alice

shared_y1 = tag_label[0].send(compute_nodes[0], garbage_collect_data=False) # First chunk of labels to Bob
shared_y2 = tag_label[1].send(compute_nodes[1], garbage_collect_data=False) # Second chunk of labels to Alice

print("X tensor pointers: ", shared_x1, shared_x2)
print("Y tensor pointers: ", shared_y1, shared_y2)

#LOAD DATASET

N_SAMPLES = 500
MNIST_PATH = './data'

transform = transforms.Compose([
                              transforms.ToTensor(),
                              transforms.Normalize((0.1307,), (0.3081,)),
                              ])

trainset = datasets.MNIST(MNIST_PATH, download=True, train=True, transform=transform)
trainloader = torch.utils.data.DataLoader(trainset, batch_size=N_SAMPLES, shuffle=False)

dataiter = iter(trainloader)
n_workers = len(compute_nodes)
device = torch.device("cuda:0" if torch.cuda.is_available() else "cpu")

for i, data in enumerate(dataiter):
    images_train_mnist, labels_train_mnist = data[0].to(device), data[1].to(device)
    images_train_mnist.tag("#X", "#mnist", "#dataset").describe("The input datapoints to the MNIST dataset.")
    labels_train_mnist.tag("#Y", "#mnist", "#dataset").describe("The input labels to the MNIST dataset.")
    images_train_mnist.send(compute_nodes[i % n_workers], garbage_collect_data=False)
    labels_train_mnist.send(compute_nodes[i % n_workers], garbage_collect_data=False)
    print("Sending data to:", compute_nodes[i % n_workers])

for i in range(len(compute_nodes)):
    compute_nodes[i].close()
