echo "Preparing development installation"

wp user create admin admin@local.test --role=administrator --user_pass=password --skip-plugins

wp rewrite structure '/%postname%/' --hard

wp option update blogname 'My dev site'

# Hide initial noise from admin dashboard
wp user meta add $(wp user get admin --field=ID) dismissed_no_secure_connection_notice 1

USELESS_DASHBOARD_WIDGETS='["wc_admin_dashboard_setup","dashboard_site_health","dashboard_right_now","dashboard_activity","dashboard_quick_press","dashboard_primary"]'
wp user meta add $(wp user get admin --field=ID) closedpostboxes_dashboard $USELESS_DASHBOARD_WIDGETS --format=json
wp user meta add $(wp user get admin --field=ID) metaboxhidden_dashboard $USELESS_DASHBOARD_WIDGETS --format=json


# Remove useless plugins (some from Bitnami)
# wp plugin uninstall
