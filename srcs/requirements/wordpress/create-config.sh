#!/bin/sh
echo "==> Preparing Wordpress..."
if [ ! -f "/var/www/html/wp-config.php" ];
then
    echo "==> ${DB_NAME} is created ! "
    wp core download --allow-root
    wp config create --allow-root --dbname=${DB_NAME} --dbuser=${USER} --dbpass=${PASS_USER} --dbhost=mariadb --extra-php --force --skip-check
    echo "==> Wordpress config file created"
    sudo -u tgriffit -i -- wp user create --path=${WP_PATH} ${USER} ${USER}@student.42lyon.fr --role=author --user_pass=${PASS_USER}
fi
if ! wp core --allow-root is-installed --path=${WP_PATH}; then
    wp core install --path=${WP_PATH} --allow-root  --skip-email --url=${URL} --title="My Awesome Wordpress Website" --admin_user=${ADMIN_USER} --admin_password=${PASS_ROOT} --admin_email=${ADMIN_USER}@student.42lyon.fr
    chmod -R +rwx ${WP_PATH}
elif [ -f "/var/www/html/wp-config.php" ];
    then echo "==> Database ${DB_NAME} found"
fi

echo "==> Wordpress is started up."
mkdir -p /run/php/
echo "==> Test of php-fpm:"
php-fpm7.3 -t
echo "==> You can have access to the https://$URL website! "
php-fpm7.3 -F