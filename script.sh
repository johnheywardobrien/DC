files="
foo.txt
bar.txt
"
 
for file in $files; do
  dir=""; commit=""; date="";
  dir=$(dirname $(find -name $file))
  commit=$(git --no-pager log -1 --pretty=%H -- path "$dir/$file")
  date="$(stat -c %y $dir/$file)"
  if [ -z "$commit" ] || [ -z "$date" ]; then
    echo "ERROR: required var \$commit or \$date is empty"
  else
    echo "INFO: resetting authorship date of commit '$commit' for file '$dir/$file' to '$date'"
    git filter-branch --env-filter \
      "if test \$GIT_COMMIT = '$commit'; then
         export GIT_AUTHOR_DATE
         GIT_AUTHOR_DATE='$date'
       fi" &&
    rm -fr "$(git rev-parse --git-dir)/refs/original/"
  fi
  echo
done
