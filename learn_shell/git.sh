# Create a mirror of repo
git clone --mirror https://github.com/exampleuser/repository-to-mirror.git
cd repository-to-mirror.git
git remote set-url --push origin https://github.com/exampleuser/mirrored
git fetch -p origin
git push --mirror

# Merge branches in two projects**

\# Merge project-a to project-b
cd path/to/project-b
git remote add project-a path/to/project-a
git fetch project-a
git merge project-a/master
git remote remove project-a

# Temporarily switch to a different commit**

\# This will detach your HEAD, that is, leave you with no branch checked out:
git checkout 0d1d7fc32

\# Make a new branch back there
git checkout -b old-state 0d1d7fc32

# Hard delete unpublished commits**

\# This will destroy any local modifications.
\# Don't do it if you have uncommitted work you want to keep.
git reset --hard 0d1d7fc32

\# Alternatively, if there's work to keep:
git stash
git reset --hard 0d1d7fc32
git stash pop
\# This saves the modifications, then reapplies that patch after resetting.
\# You could get merge conflicts, if you've modified things which were
\# changed since the commit you reset to.

# Undo published commits with new commits**

\# This will create three separate revert commits:
git revert a867b4af 25eee4ca 0766c053

\# It also takes ranges. This will revert the last two commits:
git revert HEAD~2..HEAD

\#Similarly, you can revert a range of commits using commit hashes:
git revert a867b4af..0766c053

\# Reverting a merge commit
git revert -m 1 <merge_commit_sha>

\# To get just one, you could use `rebase -i` to squash them afterwards
\# Or, you could do it manually (be sure to do this at top level of the repo)
\# get your index and work tree into the desired state, without changing HEAD:
git checkout 0d1d7fc32 .

\# Then commit. Be sure and write a good message describing what you just did
git commit

