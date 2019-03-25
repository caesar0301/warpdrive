# Install Homebrew:
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";

# Homebrew cask
brew tap caskroom/cask
brew cask install java
brew install maven scala sbt
brew cask install intellij-idea

# Brew paths
/usr/local/Cellar/
/usr/local/opt/
/usr/local/bin/

# Brew linking
brew install scala
brew install scala@2.11
brew unlink scala
brew link scala@2.11 —force
scala -version
