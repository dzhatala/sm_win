source env.sh
echo "using datadir=$datadir [ENTER]"; read

if [ "remove"  == "remove" ]; then
	rm -f $datadir/*.mfc
else 
	echo "WARNING:  $0 NOT cleaning old mfcs in $datadir "
fi
#read
cmd="$HTKTOOLS_DIR/HCopy -T 7 -C configcopy.txt -S wav2mfcc.lst"
echo $cmd ; eval $cmd
