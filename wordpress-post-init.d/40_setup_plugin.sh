PLUGIN_DIR="/bitnami/my-cf-plugin"

ln -s $PLUGIN_DIR /bitnami/wordpress/wp-content/plugins/

cd "$PLUGIN_DIR" || { echo "Failed to navigate to $PLUGIN_DIR. Exiting."; exit 1; }

composer install --no-cache

wp plugin activate my-cf-plugin

# Set default option values for the test environment
# wp option set '_foo_username' 'test@test.test'
# wp option set '_foo_password' 'password'
# wp option set '_foo_url' 'http://service:8070'
