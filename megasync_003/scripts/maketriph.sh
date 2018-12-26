source env.sh
sync
echo using datadir=$datadir ; read

#echo aligning...?
#echo fix words.mlf ! [ENTER] ; read
#@TODO uatomatically create words.mlf
#  ../htk/HTKTools/HVite -T 1 -l '*' -I words.mlf -o SW -C config -a -H hmm7/macros \
# -H hmm7/hmmdefs  -i aligned.mlf -L $datadir -y lab \
#  -S train.scp phone1.dic monophones1

echo Press key  !;  read

echo mktri

 
echo "hmm9"
mkdir -p hmm9
 
cp hmm7/* hmm9/

#creating hmm list for triphones1 will be used in mktri.hed ...
#echo "creating triphones1 ..."
#cmd="./mktrilab.sh"
#echo $cmd ; eval $cmd
#echo Press key  !;  read
#cat triphones1 > triphones1.delay.txt
#ping localhost > /dev/null ; sync  
#cut -f 3 -d " " ../trilab/*lab | sort | uniq > triphones1 ; 
#ping localhost > /dev/null ; sync  

 
echo "hmm10..."
mkdir -p hmm10
cmd="$HTKTOOLS_DIR/HHEd   -H hmm9/hmmdefs -M hmm10 mktri.hed monophones1"
echo $cmd ; eval $cmd
 
echo "hmm11..."
mkdir -p hmm11


cp train.lst mfc_triph.scp

cmd="$HTKTOOLS_DIR/HERest  -T 1 -C configtrain.txt -L $trilab -t 250.0 150.0 1000.0 -s stats \
-S mfc_triph.scp  -H hmm10/hmmdefs -M hmm11 triphones1"
echo $cmd ; eval $cmd
echo Press key  !;  read

echo "hmm12..."
mkdir -p hmm12
cmd="$HTKTOOLS_DIR/HERest  -T 1 -C configtrain.txt -L $trilab -t 250.0 150.0 1000.0 -s stats \
-S mfc_triph.scp  -H hmm11/hmmdefs -M hmm12 triphones1"
echo $cmd ; eval $cmd

echo "Adding sp"
cat master_sp_share_sil.txt >> hmm12/hmmdefs

#./makenet.sh
