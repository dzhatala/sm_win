
#gdb  -cd=../../neural_network_shmm/htk_35/HTKTools HInit
#cmd="../../neural_network_shmm/htk_35/HTKTools/HInit -C configtrain.txt -T 40 -m 1 -M hinitoutput VOI arctic_a0001.mfc"
#cmd="../../neural_network_shmm/htk_35/HTKTools/HInit -C configtrain.txt -T 40 -m 1 -M hinitoutput FULL_VOI arctic_a0001.mfc"

#T_OBP
#cmd="../../neural_network_shmm/htk_35/HTKTools/HInit -C configtrain.txt -T 400 -m 1 -M hinitoutput FULL_VOI arctic_a0001.mfc"
#T_ALL, all logg 511
source env.sh
#ls $datadir/*.mfc > train.lst && sync
mkdir -p hinitoutput
trace_flag="-T 511"
trace_flag="-T 1"
cmd="$HTKTOOLS_DIR/HInit   -C configtrain.txt $trace_flag -m 1 -M hinitoutput initial -S train.lst"
echo $cmd ; eval $cmd
echo initialized in 'hinitoutput/initial'
