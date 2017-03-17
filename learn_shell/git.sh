# Create a mirror of repo
git clone --mirror https://github.com/exampleuser/repository-to-mirror.git
cd repository-to-mirror.git
git remote set-url --push origin https://github.com/exampleuser/mirrored
git fetch -p origin
git push --mirror
