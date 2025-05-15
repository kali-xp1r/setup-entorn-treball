#!/bin/sh
if [ "$(id -u)" -ne 0 ]; then
    echo "Has d'executar aquest script com a root"
    exit 1 
fi

#sistema i git
LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y
apt update
apt upgrade -y
apt install bzip2 git -y
git config --global user.email catskills@cendrassos.net
git config --global user.name  skill17

#php
apt install php8.4 libapache2-mod-php8.4 -y
apt install php8.4-cli php8.4-mysql php8.4-pdo php8.4-sqlite3 php8.4-mbstring php8.4-zip php8.4-gd php8.4-mysqli openssl php8.4-bcmath php8.4-curl php8.4-tokenizer php8.4-xml  -y

# Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'.PHP_EOL; } else { echo 'Installer corrupt'.PHP_EOL; unlink('composer-setup.php'); exit(1); }"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer

# mariadb
apt install mariadb-server -y
apt install phpmyadmin -y
mysql < $(dirname "$0")/install.sql

# docker
apt install -y ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu   $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
usermod -aG docker user

#Node
apt install nodejs npm -y
npm cache clean -f
npm install -g n
n stable
npm install npm@latest -y

#mailpit
cp /home/user/Baixades/setup-entorn-treball/mailpit.sh /usr/bin/mailpit
chmod 755 /usr/bin/mailpit

#symfony
curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash
apt install symfony-cli -y

#laravel
#bash -c "$(curl -fsSL https://php.new/install/linux/8.4)"

#vscode
snap install code  --classic

#documentació
sudo apt install zeal
cd /home/user/.local/share
wget "https://drive.usercontent.google.com/download?id=1zZek3mcJwqtExNqE96RO-gxQPQptDE5V&export=download&authuser=0&confirm=t&uuid=512c63c5-0114-4a60-8145-a12c35be241e&at=APcmpow25rCJ5ut_EgBFiL_-EMrT%3A1744358315044" -O zeal.tgz
tar -xzf zeal.tgz


echo export PATH=\$PATH:\$HOME/.config/composer/vendor/bin >> /home/user/.bashrc
echo alias sail=\'sh \$\(\[ -f sail \] \&\& echo sail \|\| echo vendor/bin/sail\)\' >> /home/user/.bashrc
