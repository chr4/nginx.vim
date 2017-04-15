# nginx.vim

## Description
[Vim](http://www.vim.org/) plugin for [Nginx](http://www.nginx.org)

## Features
The plugin is based on the recent vim-plugin distributed with `nginx-1.12.0` and additionally features the following syntax improvements:

- Highlight IPv4 and IPv6 addresses
- Mark insecure `ssl_protocols` as errors
- Inline template syntax highlight for **ERB** and **Jinja**
- Inline syntax highlight for **LUA**
- Improve integer matching
- Syntax highlighting for `proxy_next_upstream` options
- Syntax highlighting for `sticky` options
- Syntax highlighting for `upstream` `server` options
- More to come!

Furthermore:

- Remove annoying delimiters, resulting in strange word-boundaries

## Screenshots

A `server` block with highlighting of insecure `ssl_protocol` options:
![nginx server block with SSL configuration](https://chr4.org/images/nginx_ssl.png)

An `upstream` block with highlighted options:
![nginx upstream configuration](https://chr4.org/images/nginx_upstream.png)

Embedded highlighting for ERB and Jinja templates:
![Embedded highlighting for ERB and Jinja templates](https://chr4.org/images/nginx_templating.png)

Embedded LUA syntax highlighting:
![Embedded LUA syntax highlighting](https://chr4.org/images/nginx_lua.png)


## Snippets
The plugin comes with useful snippets which can be accessed using e.g. [vim-snipmate](https://github.com/garbas/vim-snipmate).

Select a decent cipher for your requirements (all of them can provide [SSLLabs A+ ratings](https://www.ssllabs.com/ssltest/analyze.html))

- `ciphers-high<tab>`: High-security ciphers (elliptic curves), not compatible with IE < 11, OpenSSL-0.9.8, Safari < 7, Android < 4.4
- `ciphers-medium<tab>`: Medium-security ciphers with good compatibility (No IE6, IE8) but TLSv1 and SHA required
- `ciphers-low<tab>`: Low-security ciphers (using weak 3DES cipher and TLSv1), but compatible with everything but IE6 and Java6
- `ssl-options<tab>`: Bootstrap secure SSL options

Example:
```nginx
ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
ssl_ciphers 'ECDH+AESGCM:DH+AESGCM:ECDH+AES256:DH+AES256:ECDH+AES128:DH+AES:ECDH+3DES:DH+3DES:RSA+AESGCM:RSA+AES:RSA+3DES:!aNULL:!MD5:!DSS';
```

Or add a robots.txt file with `robots.txt<tab>`:
```nginx
# Tell bots to not index this site
location /robots.txt {
    default_type text/plain;
    return 200 'User-agent: *\nDisallow: /\n';
}
```

It also has auto-completion for location and server blocks with `location<tab>` resp. `server<tab>`, and [many more](https://github.com/chr4/nginx.vim/blob/master/snippets/nginx.snippets)!

- Add useful [snippets](https://github.com/chr4/nginx.vim/blob/master/snippets/nginx.snippets)

## References
- Based on the original `nginx-1.12.0/contrib/vim`
- IPv4 and IPv6 address highlighting, based on expressions found in [this forum post](http://vim.1045645.n5.nabble.com/IPv6-support-for-quot-dns-quot-zonefile-syntax-highlighting-td1197292.html)
- [Blog post](https://chr4.org/blog/2017/04/14/better-syntax-highlighting-and-snippets-for-nginx-in-vim/) introducing this plugin including some more examples

## Installation

### NeoBundle:

```vim
NeoBundle 'chr4/nginx.vim'

" Optionally, if you like Jinja template syntax highlighting
NeoBundle 'lepture/vim-jinja'
```

### Vundle:

```vim
Plugin 'chr4/nginx.vim'

" Optionally, if you like Jinja template syntax highlighting
Plugin 'lepture/vim-jinja'
```

### Pathogen:

```shell
git clone https://github.com/chr4/nginx.vim.git bundle/nginx.vim

# Optionally, if you like Jinja template syntax highlighting
git clone https://github.com/lepture/vim-jinja.git bundle/vim-jinja
```

## License
Copyright (c) Chris Aumann. Distributed under the same terms as Vim itself. See :help license.
