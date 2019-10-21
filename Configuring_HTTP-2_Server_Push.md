## Configuring HTTP/2 Server Push

Nginx introduced HTTP/2 Server Push with NGINX 1.13.9. To upgrade Nginx to the latest version, 1.14.0, just run

    ee stack upgrade --nginx
You can check the version using

    nginx -v
    nginx version: nginx/1.12.2

#####Configuration

To configure HTTP/2 Server Push, you will have to use TLS(SSL). Almost all modern browsers will only support HTTP/2 over TLS.

You need to add the http2 parameter to the listen directive.

    listen 443 ssl http2;
Then you will have to add the http2_push_preload directive with the proxy_pass or fastcgi directive, on EasyEngine installation, this will be in the file /etc/nginx/common/php7.conf

    fastcgi_pass php7;
    http2_push_preload on;
Then reload Nginx using – nginx -t && nginx -s reload

#####Verification
For WordPress site, you can install this plugin – HTTP/2 Server Push. To verify the setup, you need the nghttp tool. On Ubuntu, the package containing this tool is nghttp2
Run the command

    nghttp -ans https://example.com
Following is the output of the command for some domain (Truncated for brevity). If you see the asterisk (*) in the requestStart column, you know the server push is working.

sorted by 'complete'

    id  responseEnd requestStart  process code size request path
     13      +1.31s        +66us    1.31s  200  15K /
      2      +1.32s *     +1.23s  87.81ms  200   4K /wp-includes/js/wp-emoji-release.min.js
      6      +1.38s *     +1.23s 151.90ms  200  27K /wp-includes/css/dashicons.min.css
      8      +1.39s *     +1.23s 158.18ms  200   4K /wp-content/uploads/bb-plugin/cache/39791-layout.css
You can read the post mentioned at the start of this article for more details on HTTP/2 Server Push