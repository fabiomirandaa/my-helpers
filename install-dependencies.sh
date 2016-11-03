#Atualizar o sistema
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y software-properties-common 
sudo apt-get install -y python-software-properties build-essential libssl-dev

#Java
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java8-installer
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get install -y oracle-java8-set-default

# nginx
sudo apt-get install -y nginx

#git
sudo apt-get install -y git

#postgresql
sudo apt-get install -y postgresql postgresql-contrib postgis
sudo apt-get update

#mongo
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org

# Redis
if ! [ -d /etc/redis ]; then
  sudo apt-get install -y tcl8.5
  wget http://download.redis.io/releases/redis-stable.tar.gz
  tar xzf redis-stable.tar.gz
  cd redis-stable
  make
  make test
  sudo make install
  sudo ./utils/install_server.sh
  sudo update-rc.d redis_6379 defaults
  cd ../
  rm -rf redis-stable redis-stable.tar.gz
else
  echo "Redis já está instalado"
fi

#Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get install -y google-chrome-stable

#Atom
sudo add-apt-repository ppa:webupd8team/atom -y
sudo apt-get update
sudo apt-get install atom -y

#Sublime 3
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3;
sudo apt-get update;
sudo apt-get install -y sublime-text-installer;

#VIM
sudo apt-get install -y vim
#NVM
# sudo apt-get install python-software-properties;
# curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -;
# sudo apt-get install nodejs;
# wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash;

# NVM
if [ -d $HOME/.nvm ]
then
  echo "NVM Already installed"
else
  if ! [ -e $HOME/.zshrc ] && ! [ -e $HOME/.bashrc ]; then
    touch $HOME/.bashrc
  fi

  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

fi

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
nvm install v6.9.1
nvm use default

# NodeJS Tools: Bower, Gulp, ncu, webpack
sudo npm install -g bower
sudo npm install -g gulp
sudo npm install -g npm-check-updates
sudo npm install -g webpack webpack-dev-server

#Cordova + Ionic
sudo npm install -g -y cordova ionic

#Virtual Box Deps
sudo apt-get install -y dkms
sudo sh -c 'echo "deb http://cz.archive.ubuntu.com/ubuntu vivid main " >> /etc/apt/sources.list'
sudo apt-get update 
sudo apt-get install -y libvpx1

#Virtual Box
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian vivid contrib" >> /etc/apt/sources.list'
sudo apt-get update
sudo apt-get install -y virtualbox-5.0

#Vagrant
sudo apt-get install -y vagrant

#Android SDK
wget http://dl.google.com/android/android-sdk_r23.0.2-linux.tgz
tar vxzf android-sdk_r23.0.2-linux.tgz
sudo mv android-sdk-linux /opt/

#Android Studio
sudo apt-add-repository ppa:paolorotolo/android-studio
sudo apt-get update
sudo apt-get install -y android-studio
