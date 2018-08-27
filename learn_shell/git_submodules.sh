## Add submodule

git submodule add https://github.com/chaconinc/DbConnector
git diff --cached --submodule
git commit -am 'added DbConnector module'
git push origin master

## Clone as submodule
git clone https://github.com/chaconinc/MainProject
cd DbConnector/
git submodule init
git clone --recurse-submodules https://github.com/chaconinc/MainProject

## Update submodules
cd DbConnector
git fetch
git merge origin/master

git diff --submodule
# git config --global diff.submodule log
# git diff
git submodule update --remote
git submodule update --remote DbConnector

git config -f .gitmodules submodule.DbConnector.branch stable
git submodule update --remote

git config status.submodulesummary 1
git status
git log -p --submodule

## Work on submodule
git submodule update --remote --merge
cd DbConnector
vim src/db.c
git commit -am 'unicode support'
git submodule update --remote --rebase
git submodule update --remote
git submodule update --remote --merge
