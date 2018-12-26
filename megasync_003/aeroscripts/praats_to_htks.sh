y1="./train.lst"
for mfcs in `cat $y1`
do
	#echo $mfcs ; read
	#this awk portion get the basename of file
	#  stripout .mfc ext and its parent dir 
	p1=`echo $mfcs | awk '{
			
			#print $0;
			i1 = index ($1,".mfc");
			prefix=substr($1,1,i1-1);
			islash = index (prefix,"/");
			 while (islash>0){
				islash++;
				prefix = substr (prefix,islash);
				islash = index (prefix,"/");
			}
			print prefix 
		}
	'`
	#this line must exist or awk print nothing
	echo $p1
	
	#praat_datas/isolated_0001_0_ph_short.TextGrid
	
	#echo $p1.mfc >> train.scp
	#echo $p1.wav $p1.mfc  >> codetr.scp
	
	#cmd="$anlist -h -O $sfs"
	#echo $cmd ; eval $cmd
done
