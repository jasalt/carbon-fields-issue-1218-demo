# Having trouble with WORDPRESS_EXTRA_WP_CONFIG_CONTENT env var, set config variables using wp-cli here
chmod 777 /bitnami/wordpress/wp-config.php
wp config --allow-root set WP_DEBUG True
wp config --allow-root set WP_DEBUG_LOG True
wp config --allow-root set WP_DEBUG_DISPLAY True
wp config --allow-root set SCRIPT_DEBUG True
wp config --allow-root set WP_DISABLE_FATAL_ERROR_HANDLER True
