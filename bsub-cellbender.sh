#! /bin/bash

set -euo pipefail

SCRIPT=$1
ARG=$2
QUE="gpu-basement"
WDIR=`pwd`

bsub -G cellgeni -o $WDIR/$ARG-%J-output.log -e $WDIR/ARG-%J-output.err -q $QUE -n 4 -M20000 -R"select[mem>20000] rusage[mem=20000] span[hosts=1]" -gpu"mode=shared:j_exclusive=no:gmem=6000:num=1" $WDIR/$SCRIPT $ARG
