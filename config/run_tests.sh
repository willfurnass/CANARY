#!/bin/bash
ln -s -f ${WORKSPACE}/trunk/examples/sample_data ${WORKSPACE}/trunk/packages/sample_data
cd ${WORKSPACE}/trunk/packages/matlab/src
echo "addpath $WORKSPACE/trunk/packages/matlab/src" > startup.m
echo "addpath $WORKSPACE/trunk/tpl" >> startup.m
sed -e s/\#GlobalRev\#/${SVN_REVISION}-native/ canary.m > canary2.m
cp canary2.m canary.m
rm canary2.m
matlab -nodesktop -nosplash -nodisplay -r "add_drivers('/home/hudson/slave/drivers'); canary --self-test $WORKSPACE/trunk/packages/test results ''; quit();"
