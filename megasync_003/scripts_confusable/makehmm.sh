sync
source env.sh
HVITE=$HTKTOOLS_DIR/HVite
mkdir -p hmm0
cp hinitoutput/initial hmm0/
echo "ubuntu listing phonems from $labdir "
awk '{
	print $3
	
}' $labdir/*.lab | sort | uniq > phonems.lst

echo "ENTER " ; read
cp /dev/null hmm0/hmmdefs

for x in `cat phonems.lst`
do
	echo creating hmm $x from 'initial'
	cat hmm0/initial | sed s/initial/$x/ >> hmm0/hmmdefs
done

#head -3 hmm0/proto > hmm0/macros ; head -3 hmm0/vFloors >> hmm0/macros ; read


mkdir -p hmm1
echo creating hmms in hmm1 ... 
cmd="$HTKTOOLS_DIR/HERest -T 7 -L $labdir -C configtrain.txt  -t 250.0 150.0 1000.0 \
-S train.lst  -H hmm0/hmmdefs -M hmm1 phonems.lst"
echo $cmd ; eval $cmd

echo [ENTER!]
read 

mkdir -p hmm2
echo creating hmms in hmm2 ...
$cmd="$HTKTOOLS_DIR/HERest -T 1 -L $labdir -C configtrain.txt  -t 250.0 150.0 1000.0 \
-S train.lst  -H hmm1/hmmdefs -M hmm2 phonems.lst"
echo $cmd ; eval $cmd

mkdir -p hmm3
echo creating hmms in hmm3 ...
cmd="$HTKTOOLS_DIR/HERest -T 1 -L $labdir -C configtrain.txt  -t 250.0 150.0 1000.0 \
-S train.lst  -H hmm2/hmmdefs -M hmm3 phonems.lst"
echo $cmd ; eval $cmd

mkdir -p hmm4
cp -r hmm3/* hmm4
cat master_sp.txt >> hmm4/hmmdefs
echo "Please fix sp.state2 using sil.state3 on hmm4/hmmdefs <ENTER>! "
read
mkdir -p hmm5
echo "Creating monophones1.tmp from phones.lst "
cat phonems.lst > monophones1.tmp
echo sp >> monophones1.tmp
sort monophones1.tmp | uniq | sort > monophones1

cmd="$HTKTOOLS_DIR/HHEd -T 1  -H hmm4/hmmdefs -M hmm5 sil.hed monophones1"
echo $cmd ; eval $cmd

read

mkdir -p hmm6
echo creating hmms in hmm6 ...
cmd="$HTKTOOLS_DIR/HERest -T 1 -L $labdir -C configtrain.txt  -t 250.0 150.0 1000.0 \
-S train.lst  -H hmm5/hmmdefs -M hmm6 monophones1"
echo $cmd ; eval $cmd

read 
mkdir -p hmm7
echo creating hmms in hmm7 ...
cmd="$HTKTOOLS_DIR/HERest -T 1 -L $labdir -C configtrain.txt  -t 250.0 150.0 1000.0 \
-S train.lst  -H hmm6/hmmdefs -M hmm7 monophones1"
echo $cmd ; eval $cmd


