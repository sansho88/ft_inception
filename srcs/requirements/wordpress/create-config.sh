echo "NjIKMOUK"
if [ ! -f "/var/www/html/wp-config.php" ];
then
    while ! mysql -h mariadb --user=tgriffit --password=42School -e "SELECT schema_name FROM information_schema.schemata WHERE schema_name='dbName'";do
            echo "Database is creating..."
            sleep 8;
    done
    wp core download --allow-root
    wp config create --allow-root --dbname=dbName --dbuser=tgriffit --dbpass=42School --dbhost=maria --extra-php --force --skip-check
    echo "bonjour"
    wp core install --url=tgriffit.42.fr --title="My Awsome Wordpress Website" --admin_user=tgriffit --admin_password=42School --skip-email
    wp user create --allow-root tgriffit tgriffit@student.42lyon.fr --role=administrator --user_pass=42School
    wp user update 2 --allow-root --user_pass=42School
else
    echo "BYE"
fi

#php-fpmversion -F