source env.sh

cmd="$HTKTOOLS_DIR/HResults -L $labdir monophones1 recph.mlf"

echo $cmd ; eval $cmd
date
