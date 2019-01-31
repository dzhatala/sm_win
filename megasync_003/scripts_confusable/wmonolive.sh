source env.sh

dir=hmm7
phonems=monophones1
dict=wdict.txt
ftest=test.lst

rm -f words.net
cmd="$HTKTOOLS_DIR/HParse wgram_isol.txt words.net"
echo $cmd ; eval $cmd

outdir="../../wavs/results"
mkdir -p $outdir
rm -f recw.mlf
cmd="$HTKTOOLS_DIR/HVite  -l $outdir -y recw  -T 1  -w words.net -C configtrain.txt  -H $dir/hmmdefs \
 -o S  $dict $phonems"
echo $cmd ; eval $cmd

 
