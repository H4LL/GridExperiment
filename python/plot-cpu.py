import pandas as pd
import matplotlib.pyplot as plt

# load cpu data
gridexperiment_james_1 = pd.read_csv('results/graphs/gridexperiment_james_1/cpu.csv', delimiter=' ', names=['val'])
gridexperiment_bill_1 = pd.read_csv('results/graphs/gridexperiment_bill_1/cpu.csv', delimiter=' ', names=['val'])
gridexperiment_alice_1 = pd.read_csv('results/graphs/gridexperiment_alice_1/cpu.csv', delimiter=' ', names=['val'])
gridexperiment_bob_1 = pd.read_csv('results/graphs/gridexperiment_bob_1/cpu.csv', delimiter=' ', names=['val'])
gridexperiment_gateway_1 = pd.read_csv('results/graphs/gridexperiment_gateway_1/cpu.csv', delimiter=' ', names=['val'])

# Create seconds labels
x = []
i = 1
while (i < (len(gridexperiment_james_1)+1)):
    x.append(i*3)
    i+=1

# plot
plt.plot(x, gridexperiment_james_1['val'], label='gridexperiment_james_1')
plt.plot(x, gridexperiment_bill_1['val'], label='gridexperiment_bill_1')
plt.plot(x, gridexperiment_alice_1['val'], label='gridexperiment_alice_1')
plt.plot(x, gridexperiment_bob_1['val'], label='gridexperiment_bob_1')
plt.plot(x, gridexperiment_gateway_1['val'], label='gridexperiment_gateway_1')
plt.legend()
plt.legend(loc='center left', bbox_to_anchor=(1, 0.5))
plt.xlabel("Time (seconds)")
plt.ylabel("CPU Usage (%)")
plt.savefig('results/graphs/CPU_usage.png', dpi=800, bbox_inches='tight')
