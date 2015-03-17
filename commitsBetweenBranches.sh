MASTER=`git log --pretty=format:'%H' $1 | sort`
DEV=`git log --pretty=format:'%H' $2 | sort`
for i in `diff <(echo "${MASTER}") <(echo "${DEV}") | grep '^>' | sed 's/^> //'`; 
do 
    git --no-pager log -1 --oneline $i;
done
