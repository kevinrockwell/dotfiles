FILES=".bash_aliases .bash_completion .bash_functions .bash_profile .bashrc .config .gitconfig .gitignore"

for file in $FILES; do
  if [[ -r ~/$file ]] ; then
    cp -rT ~/$file "${file:1}"
  else
    echo "$file does not exist"
  fi
done
git add -A
git commit
git push origin master

