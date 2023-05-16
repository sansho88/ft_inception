echo "NjIKMOUK"
if [ ! -f "/var/www/html/wp-config.php" ];
then
    while ! mysql -h mariadb --user=$USER --password=$PASS_USER -e "SELECT schema_name FROM information_schema.schemata WHERE schema_name='$DB_NAME'";do
            echo "Database is creating..."
            sleep 8;
    done
    wp core download --allow-root
    wp config create --allow-root --dbname=${DB_NAME} --dbuser=${USER} --dbpass=${PASS_USER} --dbhost=maria --extra-php --force --skip-check
    echo "bonjour"
    wp core install --url=$USER.42.fr --title="My Awsome Wordpress Website" --admin_user=$USER --admin_password=${PASS_USER} --skip-email
    wp user create --allow-root ${USER} ${USER}@student.42lyon.fr --role=administrator --user_pass=${PASS_USER}
    wp user update 2 --allow-root --user_pass=${PASS_USER}
else
    echo "BYE"
fi
#/bin/bash
/run/php/php-fpm8.1 -F