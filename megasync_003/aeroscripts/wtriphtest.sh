source env.sh

dir=hmm12
phonems=triphones1_srtd
dict=cdict.txt
ftest=test.lst

rm -f words.net
cmd="$HTKTOOLS_DIR/HParse wgram_cont.txt cwords.net"
echo $cmd ; eval $cmd

outdir="../../wavs/results"
mkdir -p $outdir
rm -f recw.mlf
cmd="$HTKTOOLS_DIR/HVite  -l $outdir -y recw  -T 1  -w cwords.net -C configtrain.txt  -H $dir/hmmdefs \
 -o S -S ctest.lst $dict $phonems"
echo $cmd ; eval $cmd
cmd="$HTKTOOLS_DIR/HVite    -i recw.mlf -T 1  -w cwords.net -C configtrain.txt  -H $dir/hmmdefs \
 -o S -S ctest.lst $dict $phonems"
echo $cmd ; eval $cmd

 
