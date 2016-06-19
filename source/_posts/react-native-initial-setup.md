title: react-native-initial-setup
date: 2016-06-20 02:57:49
tags:
    - react-native
    - setup
    - tern
    - editorconfig
    - eslint
    - flow

# React Native app initial setup

We need some initial setup for the React Native app after you run `react-native init AppName`. We'll setup `editorconfig`, `eslint` and `ternjs`.

## 1. Setting up `editorconfig`

### What is editorconfig, why we need it?

`editorconfig` is a tool of configuring editor behaviors such as file encoding, space/tab style, and others. 

It is editor and IDE agnostic, so that we can maintain a consistent coding style for developers with different preference of editor/IDE. 

It now supports almost all of the common editors/IDEs around, such as emacs, vim, sublime, atom, vscode and others. With this tool and its supporting plugin for your favorite eidtor/IDE, you can configure a consistent coding style by using a text formatted file named `.editorconfig`.

Here we are going to look through the configuration items in our project.

    # http://editorconfig.org
    root = true

    [*]
    charset = utf-8
    end_of_line = lf
    indent_size = 4
    indent_style = space
    insert_final_newline = true
    trim_trailing_whitespace = true

    [*.{js,jsx,rb,css,html}]
    indent_size = 2

* `root = true`, we'll set this file as the root configuration so that all sub folders will be affected.
* `[*]`, after this line we'll configure for all kinds of files.
* `charset = utf-8`, we'll prefer file charset of `utf-8`.
* `end_of_file = lf`, we'll prefer `lf` as end of line notation.
* `indent_size = 4`, we'll prefer indent size of 4 characters by default for all files.
* `indent_style = space`, we'll prefer `space` when we indent.
* `insert_final_newline = true`, we'll make sure a newline is at the end of file.
* `trim_trailing_whitespace = true`, we'll trim trailing whitespaces.
* `[*.{js,jsx,rb,css,html}]`, after this line, we'll configure for files with extensions of `js`, `jsx`, `rb`, `css` and `html`.
* `indent_size = 2`, we'll prefer indent size of 2 for these files.

## 2. Setting up eslint

### What is it?

`eslint` is tool for linting es6 and beyond files.

### Why we need it?

linters will help us stick to good practice of programming so that our project is easier to maintain and is more robust.

### How to set it up?

`eslint` is a flexible linting tool, since I am lazy, I choose to use default linting rules from a famous repo from AirBnb.

* run `npm install --save-dev eslint babel-eslint`, install `eslint` and `babel-eslint`.
* run `npm install --save-dev eslint-config-airbnb eslint-plugin-import eslint-plugin-react eslint-plugin-jsx-a11y`, install airbnb lint rules dependencies.
* edit `.eslintrc` and insert following contents to set up eslint.

        {
            "parser": "babel-eslint",
            "env": {
                "browser": true,
                "node": true
            },
            "extends": "airbnb"
        } 

## 3. Setting up `ternjs`

### What is it?

This is Tern. Tern is a stand-alone, editor-independent JavaScript analyzer that can be used to improve the JavaScript integration of existing editors.

### Why we need it?

* ternjs helps us to analyze our javascript code.
* ternjs helps us to integrate our favorite editors with goto function/class declaration and auto completion.

### How to set it up?

* [ternjs official site](http://ternjs.net/)
* [ternjs manual](http://ternjs.net/doc/manual.html)
* [editors](http://ternjs.net/#plugins)
* [reference configuration](https://gist.github.com/vmlinz/6fc6949cbd0e378e55c951cb2d87b1dd)

## 4. Setting up `flow` if you like

### What is it?

* Flow is a static type checker, designed to quickly find errors in JavaScript applications.
* Flow also lets you gradually opt-in to statically type checking your code.

### Why we need it?

* Flow helps static analyze javascript files.
* Flow helps programmers to annotate javascript types with little effort and the annotation is easy to be opt out so that we can gradually introduce Flow without too much change.

### How to set it up?

* [getting started](https://flowtype.org/docs/getting-started.html#_)

## References

* [eslint config from airbnb](https://github.com/airbnb/javascript/tree/master/packages/eslint-config-airbnb)
* [airbnb javascript lint rules](https://github.com/airbnb/javascript)
* [eslint user guide](http://eslint.org/docs/user-guide/configuring)
* [babel-eslint plugin](https://github.com/babel/babel-eslint)
* [flow](https://flowtype.org/)
* [tern for sublime](https://github.com/ternjs/tern\_for\_sublime)
* [sublime linter flow](https://github.com/SublimeLinter/SublimeLinter-flow)
* [sublime linter eslint](https://github.com/roadhump/SublimeLinter-eslint)
* [sublime editorconfig](https://github.com/sindresorhus/editorconfig-sublime)
