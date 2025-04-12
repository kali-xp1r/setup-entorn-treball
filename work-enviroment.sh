#!/bin/sh
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd /home/user/Documents

git config --global user.email catskills@cendrassos.net
git config --global user.name  skill17

echo export PATH=\$PATH:\$HOME/.config/composer/vendor/bin >> ~/.bashrc
echo alias sail=\'sh \$\(\[ -f sail \] \&\& echo sail \|\| echo vendor/bin/sail\)\' >> ~/.bashrc
source ~/.bashrc

composer global require laravel/installer

laravel new --vue --pest --npm test-project-vue
cp $SCRIPT_DIR/bin/env-sample ./test-project-vue/.env
cd test-project-vue
php artisan key:generate
php artisan migrate
npm install
npm i --save @fortawesome/free-regular-svg-icons
npm run build
cd ..



laravel new --react --pest --npm test-project-react
cp $SCRIPT_DIR/bin/env-sample ./test-project-react/.env
cd test-project-react
php artisan key:generate
php artisan migrate
php artisan sail:install --with=mariadb,mailpit
./vendor/bin/sail build
npm install
npm i --save @fortawesome/free-regular-svg-icons
npm run build


cd ..

composer create-project symfony/skeleton:"7.2.x" test-project-symfony
cd test-project-symfony
composer config extra.symfony.docker true
composer require webapp -n
composer require logger -n
composer require --dev debug -n
composer require symfony/orm-pack -n
composer require --dev symfony/maker-bundle -n
composer require symfony/ux-react -n
npm install -D @babel/preset-react --force
npm i --save @fortawesome/free-regular-svg-icons
composer require symfonycasts/tailwind-bundle -n
php bin/console tailwind:init
docker compose build


mailpit start
mailpit down
