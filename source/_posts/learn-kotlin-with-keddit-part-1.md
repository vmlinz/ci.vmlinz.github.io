title: learn-kotlin-with-keddit-part-1
date: 2016-05-17 00:10:36
tags:
    - Android
    - Keddit
    - Kotlin
    - Tutorial
---

> 原文链接：
> >https://medium.com/@juanchosaravia/learn-kotlin-while-developing-an-android-app-part-1-e0f51fc1a8b3
> 
> 原文作者：[Juancho Saravia](https://twitter.com/juanchosaravia)
> 授权译者：[Nick Qi](https://twitter.com/vmlinz)

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


# 第1篇: 配置Android Studio，使它支持Kotlin

这个部分，我们要配置Android Studio，让它支持Kotlin同时为下一篇开始从头开发Keddit应用和学习Kotlin概念做好准备。

如果你已经忘记第一篇文章的内容，你可以回到内容部分大概看看，了解我们将要开发个什么样的应用、我们将要涉及哪些Kotlin的主题以及使用哪些库。

## 创建工程

我们将重头开发，现在打开Android Studio然后创建一个工程。我把工程命名为“KedditBySteps”，把这个工程和最终完成的工程分开，也方便你随时签出我们正在开发的代码分支。

选择API级别16，选择“Blank Activity“并使用默认名字。

![kotlin-part1-01-new-project](/images/kotlin-part1-01-new-project.png)
![kotlin-part1-02-target-devices](/images/kotlin-part1-02-target-devices.png)
![kotlin-part1-03-add-activity](/images/kotlin-part1-03-add-activity.png)
![kotlin-part1-04-customize-activity](/images/kotlin-part1-04-customize-activity.png)

## Kotlin插件

不错，我们已经创建了一个新工程，接下来让我们安装Kotlin需要的插件吧。

>从Android Studio Preference到Plugins到Browse Repositories再搜索”Kotlin“。

只安装名叫”Kotlin“的插件然后重启Android Studio。

![kotlin-part1-05-install-plugin](/images/kotlin-part1-05-install-plugin.png)

插件库里面有其他Kotlin插件，但是我们只需要这一个，”Kotlin Extensions“插件已经和”Kotlin“插件合并了，所以只需要”Kotlin“插件就够了。

注意：现在你可以使用随Android Studio 2.0一起发布的Kotlin插件了，但是记住关闭”Instant Run“，不然不能正常工作。

## 配置工程到Kotlin之初试

如果你之前已经了解了一些如何配置Kotlin的资料，想必你早就忍不住要执行“Configure Kotlin in Project”了吧，这个选项位于Tools->Kotlin，你也可以通过Find Actions这个全能搜索找到它，搜索的过程如图：

![kotlin-part1-06-configure-kotlin-project](/images/kotlin-part1-06-configure-kotlin-project.png)
![kotlin-part1-07-configure-kotlin-ok](/images/kotlin-part1-07-configure-kotlin-ok.png)

上图：显示搜索对话框的快捷键 | 下图：配置好之后的信息

如果你这样做，你会发现啥都没有发生。你能看见的所有信息就是“All modules with Kotlin files were configured"。

发生这种事情的原因是我们工程里面并没有任何Kotlin文件，所以这个插件没有配置我们的项目。那就让我们创建一个Kotlin文件再配置一次吧。

## 转换Java文件到Kotlin文件

要让工程里面有一个Kotlin文件，我们就干脆把之前创建的MainActivity.java这个文件转换成Kotlin文件。打开MainActivity.java，然后打开Find Action搜索“Convert java to...”

![kotlin-part1-08-convert-java-kotlin](/images/kotlin-part1-08-convert-java-kotlin.png)

一个消息会弹出，它警告我们转换可能不准确，可能会需要手工改动，不过现在没关系。

你会看见像这样的东西：

![kotlin-part1-09-mainactivity-in-kotlin](/images/kotlin-part1-09-mainactivity-in-kotlin.png)

现在我们不去细看这个文件的内容（下一篇会做这个），所以我们就继续配置吧。你应该注意到新的Kotlin文件扩展名是“kt”。

## 配置工程到Kotlin之最后一步

现在我们已经准备好，可以配置了。重新运行“Configure Project with Kotlin“这个命令：

![kotlin-part1-09-mainactivity-in-kotlin](/images/kotlin-part1-09-mainactivity-in-kotlin.png)
![kotlin-part1-10-reconfigure-kotlin-project](/images/kotlin-part1-10-reconfigure-kotlin-project.png)

选择最新的Kotlin版本，同时确保Android Studio安装了最新的插件。

接下来会弹出一个消息，让我们可以选择想要转换的模块以及Kotlin插件的版本（这里选择最新的）。

你会发现模块中的build.gradle被更新了。文件会包含一些类似下面的新配置：

    apply plugin: 'kotlin-android'
    sourceSets {
        main.java.srcDirs += 'src/main/kotlin'
    }
    dependencies {
        compile "org.jetbrains.kotlin:kotlin-stdlib:$kotlin_version"
    }
    buildscript {
        ext.kotlin_version = '1.0.0-XYZ'
        repositories {
            mavenCentral()
        }
        dependencies {
            classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
        }
    }

At the beginning you had to do this manually but now with the Plugin this is really easy.

## 运行吧，兄弟！！！

现在一切就绪，我们可以用MainActivity.kt这个文件来运行应用了。

![kotlin-part1-11-reconfigure-kotlin-version](/images/kotlin-part1-11-reconfigure-kotlin-version.png)

## 代码仓库

下面是这篇文章里面开发的代码，它被打了”v0.1"标签用来对应这个系列入门文章的第1篇（记住我们是从第0篇开始的，哈哈）。

https://github.com/juanchosaravia/KedditBySteps/tree/v0.1

# 总结

就像你刚刚看到的，要配置Android Studio到Kotlin非常简单，我们仅仅需要模块里有一个Kotlin文件就可以配置插件。

有了这个工程，我们就可以开始开发Keddit应用了，不过最重要的还是学习一点Kotlin的概念。

如果你发现有可以改进的地方或者有任何建议，请不要犹豫，直接联系我吧。我会尽力回答问题，改善这个系列的入门文章。

下一篇再见。

# 接下来:

[2：MainActivity.kt：语法，Null安全及其他](https://medium.com/@juanchosaravia/learn-kotlin-while-developing-an-android-app-part-2-e53317ffcbe9)

Twitter: [Juancho Saravia](https://twitter.com/juanchosaravia)
