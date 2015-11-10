export PATH=/bin:$PATH
SVN_REVISION=`svn info | grep "Revision" | awk '{printf("%d",$2)}'`
sed -e s/\#GlobalRev\#/${SVN_REVISION}-b${BUILD_NUMBER}/ canary.m > canary2.m
