title: setup-a-blog-with-hexojs-and-travis
date: 2015-12-31 23:46:12
tags:
---

# Introduction #

# Contents #

## Install hexojs ##

### Requirements ###

* [git](https://git-scm.com/downloads)
* [nodejs](https://nodejs.org/en/download/package-manager)

### Install from npm ###

    npm install -g hexo-cli

### Basic setup ###

Once you have hexo installed, you can use following commands to initialize the target folder

    hexo init BLOG_DIR
    cd BLOG_DIR
    npm install

### Customization ###

* [configuration](https://hexo.io/docs/configuration.html)
* [scaffolds](https://hexo.io/docs/writing.html#Scaffolds)
* [themes](https://hexo.io/docs/themes.html)
 * [appolo](https://github.com/pinggod/hexo-theme-apollo)
 * [next](https://github.com/iissnan/hexo-theme-next)

### Writing ###

new post
    hexo new \[layout\] TITLE

publish a draft
    hexo publish \[layout\] TITLE

## Deploy hexojs to github and gitcafe ##

### Document ###

[deployment](https://hexo.io/docs/deployment.html)

with these commands, you can deploy the web site to the server configured.

    hexo deploy

### Methods ###

* [hexo-deployer-git](https://github.com/hexojs/hexo-deployer-git)
* [hexo-deployer-heroku](https://github.com/hexojs/hexo-deployer-heroku)
* [hexo-deployer-rsync](https://github.com/hexojs/hexo-deployer-rsync)
* others

## Deploy hexojs auto builder with travis ci ##

* https://github.com/hexojs/site
* https://xuanwo.org/2015/02/07/Travis-CI-Hexo-Autodeploy/

## Configure github pages with custom domain name ##

https://help.github.com/articles/setting-up-a-custom-domain-with-github-pages/

# References #

* [official documentation](https://hexo.io/docs/)
