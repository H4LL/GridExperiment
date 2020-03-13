# GridExperiment

Open a fresh ubuntu instance;

```
git clone https://github.com/H4LL/GridExperiment.git
source GridExperiment/run_entire_experiment.sh
```

This should work for any training scenario. Just put your data distribution and training logic into the 'python/connect_nodes.py'. Then run the master script on your fresh host and it will run the experiment and report back with graphs of how it went. For now we are using the logic from [the mnist tutorials on the PyGrid repo](https://github.com/OpenMined/PyGrid/tree/dev/examples/experimental/mnist_federated_example).

## Example Graphs

# CPU Usage
![CPU Usage](results/graphs/CPU_usage.png)

# Memory Usage
![memory Usage](results/graphs/memory_usage.png)

# Block Output
![BlockO Usage](results/graphs/BlockO_usage.png)

# Block Input
![BlockI Usage](results/graphs/BlockIN.png)

# Network Input
![Bandwith Out](results/graphs/NetI_usage.png)

# Network Output
![Bandwidth Input](results/graphs/NetO_usage.png)

### TODO

- Maybe a Byte metric would be better than the percentage metric for memory
