# nginx.vim

## Description
[Vim](http://www.vim.org/) plugin for [Nginx](http://www.nginx.org)

## Features
The plugin is based on the recent vim-plugin distributed with `nginx-1.12.0` and additionally features the following syntax improvements:

- Highlight IPv4 and IPv6 addresses
- Mark insecure `ssl_protocols` as errors
- Improve integer matching
- Syntax highlighting for `proxy_next_upstream` options
- Syntax highlighting for `sticky` options
- Syntax highlighting for `upstream` `server` options
- More to come!

Furthermore:

- Remove annoying delimiters, resulting in strange word-boundaries

## Screenshots

An `upstream` block with highlighted options
<div style="width:665px">
  <img src="https://chr4.org/images/nginx_upstream.png" alt="nginx upstream configuration">
</div>

A `server` block with highlighting of insecure `ssl_protocol` options
<div style="width:460px">
  <img src="https://chr4.org/images/nginx_server.png" alt="nginx server block with ssl configuration">
</div>


## Snippets
I've added useful snippets which can be accessed using e.g. [vim-snipmate](https://github.com/garbas/vim-snipmate).

Like selecting decent cipher suites using
```nginx
ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
ssl_ciphers 'ECDH+AESGCM:DH+AESGCM:ECDH+AES256:DH+AES256:ECDH+AES128:DH+AES:ECDH+3DES:DH+3DES:RSA+AESGCM:RSA+AES:RSA+3DES:!aNULL:!MD5:!DSS';

ssl_prefer_server_ciphers on;
ssl_stapling off;
ssl_stapling_verify off;
ssl_session_tickets on;
ssl_session_cache 'shared:SSL:10m';
```

Or adding a `robots.txt` file:
```nginx
# Tell bots to not index this site
location /robots.txt {
    default_type text/plain;
    return 200 'User-agent: *\nDisallow: /\n';
}
```

Auto-completion for location and server blocks using `location<tab>` resp. `server<tab>`, and [many more](https://github.com/chr4/nginx.vim/blob/master/snippets/nginx.snippets)!

- Add useful [snippets](https://github.com/chr4/nginx.vim/blob/master/snippets/nginx.snippets)

## References
- Based on the original `nginx-1.12.0/contrib/vim`
- IPv4 and IPv6 address highlighting, based on expressions found in [this forum post](http://vim.1045645.n5.nabble.com/IPv6-support-for-quot-dns-quot-zonefile-syntax-highlighting-td1197292.html)
- [Blog post](https://chr4.org/blog/2017/04/14/better-syntax-highlighting-and-snippets-for-nginx-in-vim/) introducing this plugin

## Installation

### NeoBundle:

```vim
NeoBundle 'chr4/nginx.vim'
```

### Vundle:

```vim
Plugin 'chr4/nginx.vim'
```

### Pathogen:

```shell
git clone https://github.com/chr4/nginx.vim.git bundle/nginx.vim
```

## License
Copyright (c) Chris Aumann. Distributed under the same terms as Vim itself. See :help license.
