title: Hexo blog with custom domain and cloudflare
date: 2016-01-02 21:25:39
tags:
  - hexo
  - cloudflare
  - ssl
---

# Introduction #

The [previous blog](https://zaicheng.me/2015/12/31/setup-a-blog-with-hexojs-and-travis/) shows you how to setup a blog with hexo and github pages. Here we are going to make it further.

* Setup custom domain name for your blog
* Setup cloudflare for content caching and https support
* Setup apex domain name and a `www` sub domain
* Setup cloudflare dns records with flattening CNAME record
* Configure cloudflare
  * ipv6
  * hsts
  * flexible/full ssl

# Contents #

## Requirements ##

* Your deployed github pages. I setup my page at *vmlinz.github.io* with instructions from my previous blog post.
* Your custom domain name from a domain name vendor. I bought a domain name from name.com: *zaicheng.me*.
* A cloudflare account, free or paid. I created an account for cloudflare.

## Target ##

* Use my custom apex domain name *zaicheng.me* to point to my github blog.
* Redirect *www.zaicheng.me* to *zaicheng.me*
* Redirect *vmlinz.github.io* to *zaicheng.me*
* Use cloudflare to cache contents from *zaicheng.me* using the tricks of cloudflare
* Turn on hsts to make sure any insecure link will be redirected to the ssl secured one

## Instructions ##

### Setup github pages CNAME record ###

* new a file named CNAME under hexo source dir, and put *zaicheng.me* into it. Then if you have both dns record of *zaicheng.me* and *www.zaicheng.me*, github will redirect *www.zaicheng.me* to *zaicheng.me*

### Add dns records to the name.com dns records ###

* add a CNAME record of `zaicheng.me, vmlinz.github.io`, NOTE: this is not an effective CNAME record by the dns spec, but cloudflare recognize it.

### Set up cloudflare ###
Let's set up cloudflare to cache the content and turn on hsts for the site.

* Follow the guide to scan the original dns records.
* Migrate the dns servers from the domain name register panel to the cloudflare ones to get it work.
* Set up dns to add a record of flattening CNAME, which means to point *zaicheng.me* to *vmlinz.github.io*. NOTE: this is a cloudflare specific dns function which breaks the limits of dns spec.
* Setup the crypto to turn on full ssl
* Turn on HSTS under crypto, turn on `include subdomains` and `No-sniff`
* Turn on ipv6 compatibility

### NOTE ###

* cloudflare will provision your ssl cert after about 24 hours
* flattening CNAME for apex domain is not supported by all the dns servers
* full ssl will only work when I use flattening CNAME, if I add a dns A record of `zaicheng.me` pointing to the github ips(192.30.252.153,192.30.252.154), then I cannot use full ssl.

# References #

* [configure a cname record with your dns provider](https://help.github.com/articles/tips-for-configuring-a-cname-record-with-your-dns-provider/)
* [configuring cloudflare universal ssl](https://www.benburwell.com/posts/configuring-cloudflare-universal-ssl/)
* [custom domains for github pages](https://help.github.com/articles/about-custom-domains-for-github-pages-sites/)
* [github pages jekyll cloudflare](https://stirling.co/blog/github-pages-jekyll-cloudflare/)
* [free ssl hosting](http://blog.differential.com/free-ssl-hosting)
* [apex domains](https://devcenter.heroku.com/articles/apex-domains)

