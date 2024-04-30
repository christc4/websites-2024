# Enable SSI to handle .shtml

### For nginx

<pre>
<code>
server {
        server_name avsbq.org ;
        root /var/www/avsbq.org ;
        index index.html index.shtml ;
        location / {
        if ($request_url ~ ^/(.*)\.shtml(\?|$)) {
        return 302 /$1;
        }
                try_files $uri $uri.shtml $uri/ =404 ;
                ssi on ;
        }
</code>
</pre>

<pre>
<code>
&lt;!--#include file="/head" --&gt;
</code>
</pre>

.shtml has been largely superseded by other mechanisms, this site used to be 100% powered by it.

# It doesn't work&#8253;

You may need to enable .shtml extensions in your .htaccess file

<pre><code>
AddType text/html .shtml
AddHandler server-parsed .shtml
</code>
</pre>

