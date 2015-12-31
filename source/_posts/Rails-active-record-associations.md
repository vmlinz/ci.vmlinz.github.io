title: Rails active record associations
date: 2015-12-24 23:48:24
tags:
---

最近在学习"APIs on Rails"这本书，这是学习第八章"Placing Orders"的学习笔记。


## 内容 ##

* 理解Rails中的模型关联(Model Association)
* 知道模型关联的基本知识和几种常见模式
* 使用joint table来建立多对多的模型

<!--more-->

### Rails Model Associations ###

通过railscasts和rails guide学习模型关联

#### 为什么需要模型关联 ####

通过模型关联，rails可以在model层产生一些有用的函数，帮助开发者描述问题。

#### 关联的类型 ####

Rails里面关联是两个Model的连接。关联的实现是通过在相关Model里面调用一些宏函数，这些宏函数会自动实现相关的功能。

NOTE: 在下面解释中，源是指调用关系函数的一方，目标是指作为关系函数参数的一方

##### belongs_to #####

这个关系是用来描述一对一的从属关系，在migration里面的体现是在源表里面增加外键来指向目标表

![belongs_to](/images/belongs_to.png)

    migration:
    class CreateOrders < ActiveRecord::Migration
      def change
        create_table :customers do |t|
          t.string :name
          t.timestamps null: false
        end

        create_table :orders do |t|
          t.belongs_to :customer, index: true
          t.datetime :order_date
          t.timestamps null: false
        end
      end
    end

##### has_one #####

这个描述的也是一种一对一的关系，简单来说就是用不同的视角描述和`belongs_to`相同的关系，会在目标表里面增加一项外键引用到源表。

![has_one](/images/has_one.png)

    migration:
    class CreateSuppliers < ActiveRecord::Migration
      def change
        create_table :suppliers do |t|
          t.string :name
          t.timestamps null: false
        end

        create_table :accounts do |t|
          t.belongs_to :supplier, index: true
          t.string :account_number
          t.timestamps null: false
        end
      end
    end

##### has_many #####

这种描述的是一对多的关系，有多个目标对象和源对象关联

![has_many](/images/has_many.png)

    migration:
    class CreateCustomers < ActiveRecord::Migration
      def change
        create_table :customers do |t|
          t.string :name
          t.timestamps null: false
        end

        create_table :orders do |t|
          t.belongs_to :customer, index:true
          t.datetime :order_date
          t.timestamps null: false
        end
      end
    end

##### has_many :through #####

这种描述的是多对多的关系，有多个目标对象和多个源对象关联，但关系的建立是通过一个中间表来完成

![has_many :through](/images/has_many_through.png)

    migration:
    class CreateAppointments < ActiveRecord::Migration
      def change
        create_table :physicians do |t|
          t.string :name
          t.timestamps null: false
        end

        create_table :patients do |t|
          t.string :name
          t.timestamps null: false
        end

        create_table :appointments do |t|
          t.belongs_to :physician, index: true
          t.belongs_to :patient, index: true
          t.datetime :appointment_date
          t.timestamps null: false
        end
      end
    end

##### has_one :through #####

这个用来描述一对一的关系，通过中间表讲第一方和第三方关联起来

![has_one :through](/images/has_one_through.png)

    migration:
    class CreateAccountHistories < ActiveRecord::Migration
      def change
        create_table :suppliers do |t|
          t.string :name
          t.timestamps null: false
        end

        create_table :accounts do |t|
          t.belongs_to :supplier, index: true
          t.string :account_number
          t.timestamps null: false
        end

        create_table :account_histories do |t|
          t.belongs_to :account, index: true
          t.integer :credit_rating
          t.timestamps null: false
        end
      end
    end

##### has\_and\_belongs\_to\_many #####

这个和`has_many :through`描述的是一样的多对多关系，不过在代码中看不到中间表的存在

NOTE: 可以从migration中看到，实际上有一个自动生成的中间表存在

![has\_and\_belongs\_to\_many](/images/habtm.png)

    migration:
    class CreateAssembliesAndParts < ActiveRecord::Migration
      def change
        create_table :assemblies do |t|
          t.string :name
          t.timestamps null: false
        end

        create_table :parts do |t|
          t.string :part_number
          t.timestamps null: false
        end

        create_table :assemblies_parts, id: false do |t|
          t.belongs_to :assembly, index: true
          t.belongs_to :part, index: true
        end
      end
    end

## 参考 ##

* http://railscasts.com/episodes/3-find-through-association
* http://guides.rubyonrails.org/association_basics.html
* http://railscasts.com/episodes/47-two-many-to-many
* http://railscasts.com/episodes/154-polymorphic-association
* [understand the inverse_of for active model](https://viget.com/extend/exploring-the-inverse-of-option-on-rails-model-associations)
* [APIs on Rails](http://apionrails.icalialabs.com/)