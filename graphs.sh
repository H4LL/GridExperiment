#!/ bin / bash

cd ~/PyGrid/GridExperiment
cat results/connect_stats.txt results/train_stats.txt > results/connect_stats.csv
sed -i -e 's/] /],/g' results/connect_stats.csv
sed -i -e 's/               /,/g' results/connect_stats.csv
sed -i -e 's/        /,/g' results/connect_stats.csv
sed -i -e 's/       /,/g' results/connect_stats.csv
sed -i -e 's/   /,/g' results/connect_stats.csv
sed -i -e 's/ \/ /,/g' results/connect_stats.csv
sed -i -e 's/, /,/g' results/connect_stats.csv
sed -i -e 's/\[//g' results/connect_stats.csv
sed -i -e 's/\]//g' results/connect_stats.csv
sed -i -e 's/,,/,/g' results/connect_stats.csv
sed -i -e 's/,,/,/g' results/connect_stats.csv
sed -i -e 's/%//g' results/connect_stats.csv
sed -i -e 's/ //g' results/connect_stats.csv



mkdir results/graphs
cp results/connect_stats.csv results/graphs/connect_stats.csv

#Sort the coordinator info
mkdir results/graphs/pygrid_gateway_1
grep pygrid_gateway_1 results/graphs/connect_stats.csv > results/graphs/pygrid_gateway_1/stats.csv
cat results/graphs/pygrid_gateway_1/stats.csv | cut -d ',' -f1 > results/graphs/pygrid_gateway_1/time.csv
cat results/graphs/pygrid_gateway_1/stats.csv | cut -d ',' -f4 > results/graphs/pygrid_gateway_1/cpu.csv
cat results/graphs/pygrid_gateway_1/stats.csv | cut -d ',' -f7 > results/graphs/pygrid_gateway_1/memory.csv
cat results/graphs/pygrid_gateway_1/stats.csv | cut -d ',' -f8 > results/graphs/pygrid_gateway_1/networkinput.csv
cat results/graphs/pygrid_gateway_1/stats.csv | cut -d ',' -f9 > results/graphs/pygrid_gateway_1/networkoutput.csv
cat results/graphs/pygrid_gateway_1/stats.csv | cut -d ',' -f10 > results/graphs/pygrid_gateway_1/blockinput.csv
cat results/graphs/pygrid_gateway_1/stats.csv | cut -d ',' -f11 > results/graphs/pygrid_gateway_1/blockoutput.csv

#Sort the coordinator info
mkdir results/graphs/pygrid_bob_1
grep pygrid_bob_1 results/graphs/connect_stats.csv > results/graphs/pygrid_bob_1/stats.csv
cat results/graphs/pygrid_bob_1/stats.csv | cut -d ',' -f1 > results/graphs/pygrid_bob_1/time.csv
cat results/graphs/pygrid_bob_1/stats.csv | cut -d ',' -f4 > results/graphs/pygrid_bob_1/cpu.csv
cat results/graphs/pygrid_bob_1/stats.csv | cut -d ',' -f7 > results/graphs/pygrid_bob_1/memory.csv
cat results/graphs/pygrid_bob_1/stats.csv | cut -d ',' -f8 > results/graphs/pygrid_bob_1/networkinput.csv
cat results/graphs/pygrid_bob_1/stats.csv | cut -d ',' -f9 > results/graphs/pygrid_bob_1/networkoutput.csv
cat results/graphs/pygrid_bob_1/stats.csv | cut -d ',' -f10 > results/graphs/pygrid_bob_1/blockinput.csv
cat results/graphs/pygrid_bob_1/stats.csv | cut -d ',' -f11 > results/graphs/pygrid_bob_1/blockoutput.csv

#Sort the coordinator info
mkdir results/graphs/pygrid_alice_1
grep pygrid_alice_1 results/graphs/connect_stats.csv > results/graphs/pygrid_alice_1/stats.csv
cat results/graphs/pygrid_alice_1/stats.csv | cut -d ',' -f1 > results/graphs/pygrid_alice_1/time.csv
cat results/graphs/pygrid_alice_1/stats.csv | cut -d ',' -f4 > results/graphs/pygrid_alice_1/cpu.csv
cat results/graphs/pygrid_alice_1/stats.csv | cut -d ',' -f7 > results/graphs/pygrid_alice_1/memory.csv
cat results/graphs/pygrid_alice_1/stats.csv | cut -d ',' -f8 > results/graphs/pygrid_alice_1/networkinput.csv
cat results/graphs/pygrid_alice_1/stats.csv | cut -d ',' -f9 > results/graphs/pygrid_alice_1/networkoutput.csv
cat results/graphs/pygrid_alice_1/stats.csv | cut -d ',' -f10 > results/graphs/pygrid_alice_1/blockinput.csv
cat results/graphs/pygrid_alice_1/stats.csv | cut -d ',' -f11 > results/graphs/pygrid_alice_1/blockoutput.csv

#Sort the coordinator info
mkdir results/graphs/pygrid_bill_1
grep pygrid_bill_1 results/graphs/connect_stats.csv > results/graphs/pygrid_bill_1/stats.csv
cat results/graphs/pygrid_bill_1/stats.csv | cut -d ',' -f1 > results/graphs/pygrid_bill_1/time.csv
cat results/graphs/pygrid_bill_1/stats.csv | cut -d ',' -f4 > results/graphs/pygrid_bill_1/cpu.csv
cat results/graphs/pygrid_bill_1/stats.csv | cut -d ',' -f7 > results/graphs/pygrid_bill_1/memory.csv
cat results/graphs/pygrid_bill_1/stats.csv | cut -d ',' -f8 > results/graphs/pygrid_bill_1/networkinput.csv
cat results/graphs/pygrid_bill_1/stats.csv | cut -d ',' -f9 > results/graphs/pygrid_bill_1/networkoutput.csv
cat results/graphs/pygrid_bill_1/stats.csv | cut -d ',' -f10 > results/graphs/pygrid_bill_1/blockinput.csv
cat results/graphs/pygrid_bill_1/stats.csv | cut -d ',' -f11 > results/graphs/pygrid_bill_1/blockoutput.csv

#Sort the coordinator info
mkdir results/graphs/pygrid_james_1
grep pygrid_james_1 results/graphs/connect_stats.csv > results/graphs/pygrid_james_1/stats.csv
cat results/graphs/pygrid_james_1/stats.csv | cut -d ',' -f1 > results/graphs/pygrid_james_1/time.csv
cat results/graphs/pygrid_james_1/stats.csv | cut -d ',' -f4 > results/graphs/pygrid_james_1/cpu.csv
cat results/graphs/pygrid_james_1/stats.csv | cut -d ',' -f7 > results/graphs/pygrid_james_1/memory.csv
cat results/graphs/pygrid_james_1/stats.csv | cut -d ',' -f8 > results/graphs/pygrid_james_1/networkinput.csv
cat results/graphs/pygrid_james_1/stats.csv | cut -d ',' -f9 > results/graphs/pygrid_james_1/networkoutput.csv
cat results/graphs/pygrid_james_1/stats.csv | cut -d ',' -f10 > results/graphs/pygrid_james_1/blockinput.csv
cat results/graphs/pygrid_james_1/stats.csv | cut -d ',' -f11 > results/graphs/pygrid_james_1/blockoutput.csv


python python/plot-cpu.py
python python/plot-mem.py
python python/plot-blockO.py
python python/plot-blockI.py
python python/plot-netO.py
python python/plot-netI.py
