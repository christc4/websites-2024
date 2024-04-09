# Enable SSI to handle .shtml

`
server {
        server_name avsbq.org ;
        root /var/www/avsbq.org ;
        index index.shtml ;
        location / {
        if ($request_url ~ ^/(.*)\.shtml(\?|$)) {
        return 302 /$1;
        }
                try_files $uri $uri.shtml $uri/ =404 ;
                ssi on ;
        }
`
