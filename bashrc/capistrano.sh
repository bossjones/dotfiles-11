#
# Update and deploy production branch.
alias deploy_prod="git pull;\
git push;\
git checkout production;\
git merge master;\
git push;\
git checkout master;\
cap production deploy"

alias push_staging="git checkout staging;\
git merge master;\
git push;\
git checkout master"
