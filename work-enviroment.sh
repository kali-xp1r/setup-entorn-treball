#!/bin/sh
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd /home/user/Documents

git config --global user.email catskills@cendrassos.net
git config --global user.name  skill17

echo export PATH=\$PATH:\$HOME/.config/composer/vendor/bin >> ~/.bashrc
echo alias sail=\'sh \$\(\[ -f sail \] \&\& echo sail \|\| echo vendor/bin/sail\)\' >> ~/.bashrc

composer global require laravel/installer

laravel new --vue --pest --npm test-project-vue
cp $SCRIPT_DIR/bin/env-sample ./test-project-vue/.env
cd test-project-vue
php artisan key:generate
php artisan migrate
npm install
npm run build
cd ..


source .bashrc
laravel new --react --pest --npm test-project-react
cp $SCRIPT_DIR/bin/env-sample ./test-project-react/.env
cd test-project-react
php artisan key:generate
php artisan migrate
php artisan sail:install --with=mariadb,mailpit
sail build
npm install
npm run build
cd

cd ..

symfony new --webapp test-project-symfony
cd test-project-symfony
composer require --dev debug
composer require doctrine
composer require symfony/ux-react
npm install -D @babel/preset-react --force
composer require symfonycasts/tailwind-bundle
php bin/console tailwind:init
docker compose build
