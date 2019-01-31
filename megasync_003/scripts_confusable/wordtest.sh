source env.sh
echo dotest:datadir=$datadir 

dir=hmm7
phonems=monophones1
dict=phone1.dic


cp /dev/null $dict ;sync

awk '{
	if (index($0,"sp")>0){
		#print "sil\tsp"
	}else
	print $1,"\t",$1 
	
}' $phonems > $dict

sync
#echo "test" ; read

$HTKTOOLS_DIR/HBuild $dict phone.net
outdir="-l ../results"
outdir=""
cmd="$HTKTOOLS_DIR/HVite $outdir  -y recph	 -i recph.mlf -T 1 -w phone.net -C configtrain.txt  -H $dir/hmmdefs \
 -o S -S $datadir/test.lst $dict $phonems"
echo $cmd ; eval $cmd

#cp ../wavs/*.wav ../results
#cmd="$HTKTOOLS_DIR/HResults -S train.lst phonems.lst recph.mlf"

#echo $cmd ; eval $cmd

