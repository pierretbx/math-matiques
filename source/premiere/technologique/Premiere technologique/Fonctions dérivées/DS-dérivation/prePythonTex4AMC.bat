#! /bin/sh
SRC=$1
echo "***** JOBNAME=$AMC_JOBNAME"
echo "***** CMD=$AMC_CMD"
rm -rf ./pythontex-files-*
rm -f $AMC_JOBNAME.pytxcode
$AMC_CMD
echo "***** PYTHON"
python C:\Users\Pierre\AppData\Local\Programs\MiKTeX\tex\latex\pythontex\pythontex.py $AMC_JOBNAME.pytxcode
echo "***** END FILTER"