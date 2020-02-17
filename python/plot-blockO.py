import pandas as pd
import matplotlib.pyplot as plt

# Create seconds labels
x = []
i = 1
while (i < 237):
    x.append(i*3)
    i+=1

# load cpu data
pygrid_james_1 = pd.read_csv('results/graphs/pygrid_james_1/blockoutput.csv', delimiter=' ', names=['val'])
pygrid_bill_1 = pd.read_csv('results/graphs/pygrid_bill_1/blockoutput.csv', delimiter=' ', names=['val'])
pygrid_alice_1 = pd.read_csv('results/graphs/pygrid_alice_1/blockoutput.csv', delimiter=' ', names=['val'])
pygrid_bob_1 = pd.read_csv('results/graphs/pygrid_bob_1/blockoutput.csv', delimiter=' ', names=['val'])
pygrid_gateway_1 = pd.read_csv('results/graphs/pygrid_gateway_1/blockoutput.csv', delimiter=' ', names=['val'])

# plot
plt.plot(x, pygrid_james_1['val'], label='pygrid_james_1')
plt.plot(x, pygrid_bill_1['val'], label='pygrid_bill_1')
plt.plot(x, pygrid_alice_1['val'], label='pygrid_alice_1')
plt.plot(x, pygrid_bob_1['val'], label='pygrid_bob_1')
plt.plot(x, pygrid_gateway_1['val'], label='pygrid_gateway_1')
plt.legend()
plt.legend(loc='center left', bbox_to_anchor=(1, 0.5))
plt.xlabel("Time (seconds)")
plt.ylabel("CPU Usage (%)")
plt.savefig('results/graphs/BlockO_usage.png', dpi=800, bbox_inches='tight')