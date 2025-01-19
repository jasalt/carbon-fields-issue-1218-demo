# Reproducing bug https://github.com/htmlburger/carbon-fields/issues/1218
```
git clone git@github.com:jasalt/carbon-fields-issue-1218-demo.git
sudo chmod -R 777 carbon-fields-issue-1218-demo # required on Linux to allow Composer to create vendor/ in mounted dir
cd carbon-fields-issue-1218-demo
docker compose up
```

Access http://localhost:8099/wp-admin/admin.php?page=crb_carbon_fields_container_my_theme_options.php

View does not load:
![Screenshot_20250119_103452](https://github.com/user-attachments/assets/15b960a8-41df-487e-ab0a-49fd9221c365)

404's given in container console:

```
wordpress-1  | 192.168.48.1 - - [19/Jan/2025:08:20:15 +0000] "GET /wp-admin/admin.php?page=crb_carbon_fields_container_my_theme_options.php HTTP/1.1" 200 24616
wordpress-1  | 192.168.48.1 - - [19/Jan/2025:08:20:15 +0000] "GET /build/classic/metaboxes.css?ver=3.6.5 HTTP/1.1" 404 73206
wordpress-1  | 192.168.48.1 - - [19/Jan/2025:08:20:15 +0000] "GET /core/Libraries/Sidebar_Manager/assets/css/app.css?ver=3.6.5 HTTP/1.1" 404 73206
wordpress-1  | 192.168.48.1 - - [19/Jan/2025:08:20:15 +0000] "GET /build/classic/core.css?ver=3.6.5 HTTP/1.1" 404 73206
wordpress-1  | 192.168.48.1 - - [19/Jan/2025:08:20:15 +0000] "GET /core/Libraries/Sidebar_Manager/assets/js/app.js?ver=3.6.5 HTTP/1.1" 404 73206
wordpress-1  | 192.168.48.1 - - [19/Jan/2025:08:20:15 +0000] "GET /build/classic/core.js?ver=3.6.5 HTTP/1.1" 404 73206
wordpress-1  | 192.168.48.1 - - [19/Jan/2025:08:20:15 +0000] "GET /build/classic/vendor.js?ver=3.6.5 HTTP/1.1" 404 73206
wordpress-1  | 192.168.48.1 - - [19/Jan/2025:08:20:15 +0000] "GET /build/classic/metaboxes.js?ver=3.6.5 HTTP/1.1" 404 73206
wordpress-1  | 192.168.48.1 - - [19/Jan/2025:08:20:15 +0000] "GET /build/classic/core.css?ver=3.6.5 HTTP/1.1" 404 73206
wordpress-1  | 192.168.48.1 - - [19/Jan/2025:08:20:15 +0000] "GET /build/classic/metaboxes.css?ver=3.6.5 HTTP/1.1" 404 73206
wordpress-1  | 192.168.48.1 - - [19/Jan/2025:08:20:15 +0000] "GET /build/classic/vendor.js?ver=3.6.5 HTTP/1.1" 404 73206
wordpress-1  | 192.168.48.1 - - [19/Jan/2025:08:20:16 +0000] "GET /build/classic/core.js?ver=3.6.5 HTTP/1.1" 404 73206
wordpress-1  | 192.168.48.1 - - [19/Jan/2025:08:20:16 +0000] "GET /build/classic/metaboxes.js?ver=3.6.5 HTTP/1.1" 404 73206
wordpress-1  | 192.168.48.1 - - [19/Jan/2025:08:20:16 +0000] "GET /favicon.ico HTTP/1.1" 302 -
wordpress-1  | 192.168.48.1 - - [19/Jan/2025:08:21:16 +0000] "POST /wp-admin/admin-ajax.php HTTP/1.1" 200 47

```
# Workaround
- Fix by uncommenting [line 29](https://github.com/jasalt/carbon-fields-issue-1218-demo/blob/main/my-cf-plugin.php#L29) in `my-cf-plugin.php` and reload page without cache (may take a moment).
- Re-create container if doesn't work otherwise `docker compose down -v && docker compose up`.
