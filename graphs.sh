#!/ bin / bash

cd ~
cat GridExperiment/results/connect_stats.txt > GridExperiment/results/connect_stats.csv
sed -i -e 's/] /],/g' GridExperiment/results/connect_stats.csv
sed -i -e 's/               /,/g' GridExperiment/results/connect_stats.csv
sed -i -e 's/        /,/g' GridExperiment/results/connect_stats.csv
sed -i -e 's/       /,/g' GridExperiment/results/connect_stats.csv
sed -i -e 's/   /,/g' GridExperiment/results/connect_stats.csv
sed -i -e 's/ \/ /,/g' GridExperiment/results/connect_stats.csv
sed -i -e 's/, /,/g' GridExperiment/results/connect_stats.csv
sed -i -e 's/\[//g' GridExperiment/results/connect_stats.csv
sed -i -e 's/\]//g' GridExperiment/results/connect_stats.csv
sed -i -e 's/,,/,/g' GridExperiment/results/connect_stats.csv
sed -i -e 's/,,/,/g' GridExperiment/results/connect_stats.csv
sed -i -e 's/%//g' GridExperiment/results/connect_stats.csv
sed -i -e 's/ //g' GridExperiment/results/connect_stats.csv

rm -r GridExperiment/results/graphs
mkdir GridExperiment/results/graphs
cp GridExperiment/results/connect_stats.csv GridExperiment/results/graphs/connect_stats.csv

#Sort the coordinator info
mkdir GridExperiment/results/graphs/gridexperiment_gateway_1
grep gridexperiment_gateway_1 GridExperiment/results/graphs/connect_stats.csv > GridExperiment/results/graphs/gridexperiment_gateway_1/stats.csv
cat GridExperiment/results/graphs/gridexperiment_gateway_1/stats.csv | cut -d ',' -f1 > GridExperiment/results/graphs/gridexperiment_gateway_1/time.csv
cat GridExperiment/results/graphs/gridexperiment_gateway_1/stats.csv | cut -d ',' -f4 > GridExperiment/results/graphs/gridexperiment_gateway_1/cpu.csv
cat GridExperiment/results/graphs/gridexperiment_gateway_1/stats.csv | cut -d ',' -f7 > GridExperiment/results/graphs/gridexperiment_gateway_1/memory.csv
cat GridExperiment/results/graphs/gridexperiment_gateway_1/stats.csv | cut -d ',' -f8 > GridExperiment/results/graphs/gridexperiment_gateway_1/networkinput.csv
cat GridExperiment/results/graphs/gridexperiment_gateway_1/stats.csv | cut -d ',' -f9 > GridExperiment/results/graphs/gridexperiment_gateway_1/networkoutput.csv
cat GridExperiment/results/graphs/gridexperiment_gateway_1/stats.csv | cut -d ',' -f10 > GridExperiment/results/graphs/gridexperiment_gateway_1/blockinput.csv
cat GridExperiment/results/graphs/gridexperiment_gateway_1/stats.csv | cut -d ',' -f11 > GridExperiment/results/graphs/gridexperiment_gateway_1/blockoutput.csv

#Sort the coordinator info
mkdir GridExperiment/results/graphs/gridexperiment_bob_1
grep gridexperiment_bob_1 GridExperiment/results/graphs/connect_stats.csv > GridExperiment/results/graphs/gridexperiment_bob_1/stats.csv
cat GridExperiment/results/graphs/gridexperiment_bob_1/stats.csv | cut -d ',' -f1 > GridExperiment/results/graphs/gridexperiment_bob_1/time.csv
cat GridExperiment/results/graphs/gridexperiment_bob_1/stats.csv | cut -d ',' -f4 > GridExperiment/results/graphs/gridexperiment_bob_1/cpu.csv
cat GridExperiment/results/graphs/gridexperiment_bob_1/stats.csv | cut -d ',' -f7 > GridExperiment/results/graphs/gridexperiment_bob_1/memory.csv
cat GridExperiment/results/graphs/gridexperiment_bob_1/stats.csv | cut -d ',' -f8 > GridExperiment/results/graphs/gridexperiment_bob_1/networkinput.csv
cat GridExperiment/results/graphs/gridexperiment_bob_1/stats.csv | cut -d ',' -f9 > GridExperiment/results/graphs/gridexperiment_bob_1/networkoutput.csv
cat GridExperiment/results/graphs/gridexperiment_bob_1/stats.csv | cut -d ',' -f10 > GridExperiment/results/graphs/gridexperiment_bob_1/blockinput.csv
cat GridExperiment/results/graphs/gridexperiment_bob_1/stats.csv | cut -d ',' -f11 > GridExperiment/results/graphs/gridexperiment_bob_1/blockoutput.csv

#Sort the coordinator info
mkdir GridExperiment/results/graphs/gridexperiment_alice_1
grep gridexperiment_alice_1 GridExperiment/results/graphs/connect_stats.csv > GridExperiment/results/graphs/gridexperiment_alice_1/stats.csv
cat GridExperiment/results/graphs/gridexperiment_alice_1/stats.csv | cut -d ',' -f1 > GridExperiment/results/graphs/gridexperiment_alice_1/time.csv
cat GridExperiment/results/graphs/gridexperiment_alice_1/stats.csv | cut -d ',' -f4 > GridExperiment/results/graphs/gridexperiment_alice_1/cpu.csv
cat GridExperiment/results/graphs/gridexperiment_alice_1/stats.csv | cut -d ',' -f7 > GridExperiment/results/graphs/gridexperiment_alice_1/memory.csv
cat GridExperiment/results/graphs/gridexperiment_alice_1/stats.csv | cut -d ',' -f8 > GridExperiment/results/graphs/gridexperiment_alice_1/networkinput.csv
cat GridExperiment/results/graphs/gridexperiment_alice_1/stats.csv | cut -d ',' -f9 > GridExperiment/results/graphs/gridexperiment_alice_1/networkoutput.csv
cat GridExperiment/results/graphs/gridexperiment_alice_1/stats.csv | cut -d ',' -f10 > GridExperiment/results/graphs/gridexperiment_alice_1/blockinput.csv
cat GridExperiment/results/graphs/gridexperiment_alice_1/stats.csv | cut -d ',' -f11 > GridExperiment/results/graphs/gridexperiment_alice_1/blockoutput.csv

#Sort the coordinator info
mkdir GridExperiment/results/graphs/gridexperiment_bill_1
grep gridexperiment_bill_1 GridExperiment/results/graphs/connect_stats.csv > GridExperiment/results/graphs/gridexperiment_bill_1/stats.csv
cat GridExperiment/results/graphs/gridexperiment_bill_1/stats.csv | cut -d ',' -f1 > GridExperiment/results/graphs/gridexperiment_bill_1/time.csv
cat GridExperiment/results/graphs/gridexperiment_bill_1/stats.csv | cut -d ',' -f4 > GridExperiment/results/graphs/gridexperiment_bill_1/cpu.csv
cat GridExperiment/results/graphs/gridexperiment_bill_1/stats.csv | cut -d ',' -f7 > GridExperiment/results/graphs/gridexperiment_bill_1/memory.csv
cat GridExperiment/results/graphs/gridexperiment_bill_1/stats.csv | cut -d ',' -f8 > GridExperiment/results/graphs/gridexperiment_bill_1/networkinput.csv
cat GridExperiment/results/graphs/gridexperiment_bill_1/stats.csv | cut -d ',' -f9 > GridExperiment/results/graphs/gridexperiment_bill_1/networkoutput.csv
cat GridExperiment/results/graphs/gridexperiment_bill_1/stats.csv | cut -d ',' -f10 > GridExperiment/results/graphs/gridexperiment_bill_1/blockinput.csv
cat GridExperiment/results/graphs/gridexperiment_bill_1/stats.csv | cut -d ',' -f11 > GridExperiment/results/graphs/gridexperiment_bill_1/blockoutput.csv

#Sort the coordinator info
mkdir GridExperiment/results/graphs/gridexperiment_james_1
grep gridexperiment_james_1 GridExperiment/results/graphs/connect_stats.csv > GridExperiment/results/graphs/gridexperiment_james_1/stats.csv
cat GridExperiment/results/graphs/gridexperiment_james_1/stats.csv | cut -d ',' -f1 > GridExperiment/results/graphs/gridexperiment_james_1/time.csv
cat GridExperiment/results/graphs/gridexperiment_james_1/stats.csv | cut -d ',' -f4 > GridExperiment/results/graphs/gridexperiment_james_1/cpu.csv
cat GridExperiment/results/graphs/gridexperiment_james_1/stats.csv | cut -d ',' -f7 > GridExperiment/results/graphs/gridexperiment_james_1/memory.csv
cat GridExperiment/results/graphs/gridexperiment_james_1/stats.csv | cut -d ',' -f8 > GridExperiment/results/graphs/gridexperiment_james_1/networkinput.csv
cat GridExperiment/results/graphs/gridexperiment_james_1/stats.csv | cut -d ',' -f9 > GridExperiment/results/graphs/gridexperiment_james_1/networkoutput.csv
cat GridExperiment/results/graphs/gridexperiment_james_1/stats.csv | cut -d ',' -f10 > GridExperiment/results/graphs/gridexperiment_james_1/blockinput.csv
cat GridExperiment/results/graphs/gridexperiment_james_1/stats.csv | cut -d ',' -f11 > GridExperiment/results/graphs/gridexperiment_james_1/blockoutput.csv

cd GridExperiment
python python/plot-cpu.py
python python/plot-mem.py
python python/plot-blockO.py
python python/plot-blockI.py
python python/plot-netO.py
python python/plot-netI.py
