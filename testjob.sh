#!/bin/bash
#MSUB -N test-git
#MSUB -l nodes=1:ppn=1:ib,walltime=00:00:05:00
#MSUB -l pmem=2gb
#MSUB -M wjakethompson@gmail.com
#MSUB -m a
#MSUB -j oe
#MSUB -o testgit.log
#MSUB -q sixhour

cd $PBS_O_WORKDIR

DATE=$(date '+%Y-%m-%d %H:%M:%S')

git pull
R --vanilla -f writetime.R
git commit -m "`echo 'update output:' $DATE`"
git push
