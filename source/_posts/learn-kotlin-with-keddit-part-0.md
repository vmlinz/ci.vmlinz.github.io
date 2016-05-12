title: learn-kotlin-with-keddit-part-0
date: 2016-05-12 22:09:03
tags: 
	- Java
	- Kotlin
	- Android
    - Reddit
---

> 原文链接：
> https://medium.com/@juanchosaravia/learn-kotlin-while-developing-an-android-app-introduction-567e21ff9664#.m0rvylv5z
> 原文作者：[Juancho Saravia](https://twitter.com/juanchosaravia)
> 授权译者：[Nick Qi](https://zaicheng.me)

# 内容

* [导言：关于这个系列文章的一点点](https://medium.com/@juanchosaravia/learn-kotlin-while-developing-an-android-app-introduction-567e21ff9664)
* [1：给Android Studio配置Kotlin](https://medium.com/@juanchosaravia/learn-kotlin-while-developing-an-android-app-part-1-e0f51fc1a8b3)
* [2：MainActivity.kt：语法，Null安全及其他](https://medium.com/@juanchosaravia/learn-kotlin-while-developing-an-android-app-part-2-e53317ffcbe9)
* [3：NewsFragment.kt：扩展方法，Android扩展等等](https://medium.com/@juanchosaravia/keddit-part-3-extension-functions-android-extensions-and-more-faa7d232f232)
* [4：RecyclerView--委托适配器和数据类配合Kotlin](https://medium.com/@juanchosaravia/keddit-part-4-recyclerview-delegate-adapters-data-classes-with-kotlin-9248f44327f7)
* [5：Kotlin, RxJava & RxAndroid](https://medium.com/@juanchosaravia/keddit-part-5-kotlin-rxjava-rxandroid-105f95bfcd22)
* [6：API — Retrofit & Kotlin](https://medium.com/@juanchosaravia/keddit-part-6-api-retrofit-kotlin-d309074af0)
* [7：无限滚动：高阶函数以及Lambdas](https://medium.com/@juanchosaravia/keddit-part-7-infinite-scroll-higher-order-functions-lambdas-3a11fbd5090e)
* [8：方向改变（Parcelable和数据类）](https://medium.com/@juanchosaravia/keddit-part-8-orientation-change-with-kotlin-parcelable-data-classes-f28136e8a6a8)
* 9：单元测试和集成测试

## 简介

很高兴你能看到这一系列文章，我们将在开发Android应用的同时学习一个JVM上的新语言，Kotlin。希望这些文章能帮助你在Android环境下学习这个非常棒的语言。这些文章分成多个部分。在内容这一节里面有这些不同的文章以及相应的主题，每篇都会包含不同的Kotlin特性。

我的目地不是创建最好的应用（哥做不到，哈哈），但我会在开发这个应用的同时讲解Kotlin。

>我们将要学习Kotlin，涉及到的内容主要包括__字段和属性，数据类，Null安全，扩展方法，Lambda表达式，委托，高阶函数__等优良特性。我们也会接触到Android开发者经常需要处理的一些情景：方向改变（Parcelables），从服务器请求数据显示到UI，绑定和操作视图等等。同时我将假设你了解Java而且有一些Android开发经验。

----------

## 我们将要开发的应用：Keddit

我们将要开发的应用是一个简单的Reddit客户端。它会展示来自Reddit的最近新闻，支持通过下拉无限滚动显示更多新闻，支持显示标题、图片、评论数量、发布事件以及新闻的作者。

### 我们将会使用的第三方库:

* __Retrofit 2.0__: 处理RedditAPI。
* __RxJava__: 我们将使用Observables来解耦UI线程和后台线程。我们调用API然后返回数据给UI。
* __Picasso__: 从Reddit加载图片。
* __RecyclerView__: 我们使用RecyclerView来展示信息同时提供无限滚动的行为。
* __Kotlin Android Extensions__: 绑定UI（视图）和代码

### 代码仓库

在这里你可以拿到我们接下来的一系列文章中要创建和回顾的代码。

https://github.com/juanchosaravia/Keddit

下一篇文章中我们将配置Android Studio，让它为开发Kotlin应用做好准备。但是如果现在你就很好奇，你完全可以直接开始查看仓库中的代码。

如果你有任何问题，请通过这些社交网络联系我。我将尽我所能回答，如果不行，我们就一起学习吧：）

Twitter: https://twitter.com/juanchosaravia

LinkedIn: https://www.linkedin.com/in/juansaravia

## 下一篇:

*  [1：给Android Studio配置Kotlin](https://medium.com/@juanchosaravia/learn-kotlin-while-developing-an-android-app-part-1-e0f51fc1a8b3)
