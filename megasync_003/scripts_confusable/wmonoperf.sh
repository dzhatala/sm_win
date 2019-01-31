source env.sh

cmd="$HTKTOOLS_DIR/HResults -L $wlabdir monophones1 recw.mlf"

echo $cmd ; eval $cmd
date
