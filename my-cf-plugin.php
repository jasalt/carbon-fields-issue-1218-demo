<?php
/*
 Plugin Name: carbon-fields-issue-1218-demo plugin
 Description: Adds CF Theme options page which fails to load Carbon Fields assets due to symlinked plugin path in container setup (https://github.com/htmlburger/carbon-fields/issues/1218)
 Version: 0.0.1
 Author: Jarkko Saltiola (jasalt)
*/

$projectRootDir = __DIR__ . '/';
require $projectRootDir . 'vendor/autoload.php';

use Carbon_Fields\Container;
use Carbon_Fields\Field;

add_action( 'carbon_fields_register_fields', 'crb_attach_theme_options' );
function crb_attach_theme_options() {
	$field_prefix = "foo";
    Container::make( 'theme_options', __( 'My Theme Options' ) )
        ->add_fields([
            Field::make( 'text', $field_prefix . '_username', 'Service Login (email)' ),
            Field::make( 'text', $field_prefix . '_password', 'Service API Key' ),
            Field::make( 'text', $field_prefix . '_url',      'Service URL (eg. https://example.com)' ),
        ]);
}

add_action( 'after_setup_theme', 'crb_load' );
function crb_load() {
	// Fix container setup 404 issue https://github.com/htmlburger/carbon-fields/issues/1218
	//define('Carbon_Fields\\URL', plugin_dir_url(__FILE__) . 'vendor/htmlburger/carbon-fields');  // uncomment

    \Carbon_Fields\Carbon_Fields::boot();
}
