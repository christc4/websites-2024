# Httpd

<pre><code>
server "avsbq.org" {

	# see https://man.openbsd.org/httpd.conf to enable ssl/tls

	listen on * port 80
	listen on * tls port 443
	connection request timeout 4

	location "/pub/*" {
		root "/werc"
	}

	location found "/*" {
		root "/werc/sites/avsbq.org"
	}
	  tls {
	    certificate "/etc/ssl/www.avsbq.org.pem"
	    key "/etc/ssl/private/www.avsbq.org.key"
	  }
	 location "/.well-known/acme-challenge/*" {
	    root "/acme"
	    request strip 2
	  }

	location not found "/*" {
		root "/"
		fastcgi {
			param PLAN9 "/usr/local/plan9"
			param DOCUMENT_ROOT "/werc/bin"
			param SCRIPT_FILENAME "/werc/bin/werc.rc"
			socket "/run/slowcgi.sock"
		}
	}
}

types {
	include "/usr/share/misc/mime.types"
}
</code></pre>

<pre><code>
authority letsencrypt {
  api url "https://acme-v02.api.letsencrypt.org/directory"
  account key "/etc/ssl/private/letsencrypt.key"
}

domain www.avsbq.org {
  alternative names { avsbq.org archive.avsbq.org mal.avsbq.org language.avsbq.org link.avsbq.org iconography.avsbq.org project.avsbq.org tutorial.avsbq.org profile.avsbq.org }
  domain key "/etc/ssl/private/www.avsbq.org.key"
  domain certificate "/etc/ssl/www.avsbq.org.crt"
  domain full chain certificate "/etc/ssl/www.avsbq.org.pem"
  sign with letsencrypt
}
</code></pre>
