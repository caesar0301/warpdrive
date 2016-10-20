# install virtualenv
pip install -U virtualenv
pip install -U virtualenvwrapper

# add following lines to ~/.bashrc or ~/.bash_profile
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/workspace
source /usr/local/bin/virtualenvwrapper.sh

# then
source ~/.bash_profile

# list virtual envs
lsvirtualenv -b

# make a new virtual env
mkvirtualenv myenv

# eist myenv
deactivate

# enter a virtual env
workon myenv

# remove a virtual env
rmvirtualenv myenv
rmvirtualenv try
