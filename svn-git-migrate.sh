if [ $# -lt 4 ]; then
	echo "Usage: $0 {svnRepoUrl} {remoteGitRepoUrl} {projectName} {authorsFile}"
	exit 1
fi

git svn clone $1 --authors-file=$4 --no-metadata -s $3
cd $3
git for-each-ref refs/remotes/tags | cut -d / -f 4- | grep -v @ | while read tagname; do git tag "$tagname" "tags/$tagname"; git branch -r -d "tags/$tagname"; done
git for-each-ref refs/remotes | cut -d / -f 3- | grep -v @ | while read branchname; do git branch "$branchname" "refs/remotes/$branchname"; git branch -r -d "$branchname"; done
git branch -d trunk
git remote add origin $2

git push origin --all
git push origin --tags

cd ..
rm -rf $3

git clone $2 $3

cd $3
echo "Currently in $3, where the git repo has just been migrated"