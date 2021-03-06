# Java并发编程的“基石”——多线程概念初识

> https://www.imooc.com/learn/1186
>
> 简介：并发是程序员永恒的命题。并发易学难精，没有稳扎稳打的第一步，前路坎坷易弃坑。本课程邀请慕课广受好评的《Java并发核心知识体系精讲》课程的悟空老师带领小伙伴构建清晰的理论基石，涵盖线程、进程、多线程、并发、高并发、同步、异步、阻塞、非阻塞等，还有高频面试点拨。一句话：浓缩2小时的高质精品并发入门课，你绝对值得拥有~

## 第1章 踏上Java并发征途
> 理清本课程学习目的，构建知识脉络，纵览全局。

###  1-1 序-本课综述 (05:11)

并发编程的“基石”——多线程概念建立

晦涩难懂的概念：

- 线程、进程
- 串行、并行、并发
- 多线程、高并发
- 同步异步、阻塞非阻塞



问题：

1. 线程和进程的相同和不同？
2. 并行和并发有什么区别？
3. 多线程就是高并发么？相反，高并发就是多线程么？
4. 同步阻塞和异步非阻塞的关系？

###  1-2 从思维导图看并发脉络 (08:13)

https://naotu.baidu.com/file/b8a70ff9e7f3af1437594b2d0fb4ebfd



附：

- 并发编程的“基石”——多线程概念建立：

  http://naotu.baidu.com/file/b8a70ff9e7f3af1437594b2d0fb4ebfd

- 线程8大核心基础：

  http://naotu.baidu.com/file/07f437ff6bc3fa7939e171b00f133e17

- Java内存模型——底层原理：

  http://naotu.baidu.com/file/60a0bdcaca7c6b92fcc5f796fe6f6bc9

- 死锁——从产生到消除：

  http://naotu.baidu.com/file/ec7748c253f4fc9d88ac1cc1e47814f3 

- 二级大纲（复习用） 成体系的Java并发多线程核心+内存模型+死锁——从用法到原理，面试必考：

  http://naotu.baidu.com/file/29942292cd032adfae23c09783676004

- 并发工具类分类（本导图对应的课程正在录制中，20年上线）：

  http://naotu.baidu.com/file/3902a010470d7c1cf76fe719be124797

## 第2章 孪生兄弟：进程和线程
> 用比喻和实操彻底理解进程和线程的联系和不同，并讲解Java语言和多线程的渊源。

###  2-1 什么是进程？实操案例：用活动监视器看正在运行的各进程 (07:24)

操作系统、进程、线程的包含关系：

> 操作系统是包含多个进程的容器，而每个进程又都是容纳多个线程的容器

<img src="https://tva1.sinaimg.cn/large/006y8mN6gy1g8s3qksku6j313i0hqtbj.jpg" alt="操作系统、进程、线程的包含关系" style="zoom:30%;" />

Oracle文档的官方定义：

> https://docs.oracle.com/cd/E19455-01/806-5257/6je9h032b/index.html

| Term    | Definition                                                   |
| ------- | ------------------------------------------------------------ |
| Process | The UNIX environment (such as file descriptors, user ID, and so on) created with the `fork(2)` system call, which is set up to run a program. |
| Thread  | A sequence of instructions executed within the context of a process. |

- 进程：使用fork(2)系统调用创建的UNIX环境（例如文件描述符、用户ID等），它被设置为运行程序。
- 线程：在进程上下文中执行的一系列指令

什么是进程

- 进程的英文是Process，指的是程序的一次执行。在用户下达运行程序的命令后，就会产生进程

活动监视器演示

<img src="https://tva1.sinaimg.cn/large/006y8mN6gy1g8s3zh26atj313x0u0nc4.jpg" alt="活动监视器" style="zoom:40%;" />



**总结**：进程就是程序(代码)的真正运行实例，**是资源分配的基本单位**

###  2-2 什么是线程？实操案例：用代码演示线程数量的实时变化 (05:05)

什么是线程

- 线程是**CPU的基本调度单位**，每个线程执行的都是进程代码的某个片段

实例演示：利用活动监视器的CPU栏目查看Java进程的线程数量的变化

```java
/**
 * 创建100个线程，用活动监视器的CPU栏目查看Java进程的线程数量的变化，10秒后线程消失了
 */
public class Create100Threads {
    public static void main(String[] args) {
        for (int i = 0; i < 100; i++) {
            new Thread(new Runnable() {
                @Override
                public void run() {
                    try {
                        Thread.sleep(10 * 1000);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }).start();
        }
    }
}
```

用房子作比喻

###  2-3 线程和进程有哪6个不同？生活案例：房子与住户 (04:58)

1. 起源不同：先有进程，后有线程
2. 概念不同：进程是具有一定独立功能的程序关于某个数据集合上的一次运行活动，进程是系统进行资源分配和调度的一个独立单位；线程是CPU调度单位
3. 内存共享方式不同：默认情况下，内存无法与其他进程共享；线程共享由操作系统分配给其父进程的相同内存块
4. 拥有资源不同：进程拥有独立内存，而线程自己基本上不拥有系统资源，只拥有一点在运行中必不可少的资源(如程序计数器,一组寄存器和栈)，但是它可与同属一个进程的其他的线程共享进程所拥有的全部资源。
   - 线程共享的内容包括：
     1. **进程代码段**
     2. 进程的公有数据(利用这些共享的数据，线程很容易实现相互的通讯)
     3. 进程打开的文件描述符
     4. 信号的处理器
     5. 进程的当前目录
     6. 进程用户ID与进程组ID
   - 线程独有的内容包括：
     1. 线程ID
     2. 寄存器组的值
     3. **线程的堆栈**
     4. 错误返回码
     5. 线程的信号屏蔽码
5. 数量不同：一个程序至少有一个进程,一个进程至少有一个线程
6. 开销不同：
   1. 线程的创建、终止时间比进程短
   2. 同一进程内的线程切换时间比进程切换短
   3. 同一进程的各个线程间共享文件和文件资源，可以不通过内核进行通信
7. 相似点：生命周期（就绪、等待、运行等状态）

###  2-4 Java和多线程的渊源-代码演示JVM自启动线程，分析它们的作用 (05:42)

- Java天生支持多线程、语言排名高

- Java线程会一对一映射到操作系统

  <img src="https://tva1.sinaimg.cn/large/006y8mN6gy1g8tvvmls2pj31ai0lon38.jpg" alt="Java虚拟机与操作系统线程关系图" style="zoom:35%;" />

JVM自动启动线程：

> 即使代码中不显示创建线程，在运行main时，JVM也会自动启动其他的线程

<img src="https://tva1.sinaimg.cn/large/006y8mN6gy1g8s60yzc0rj30l80gkmzu.jpg" alt="JVM自动启动线程" style="zoom:50%;" />

- `Signal Dispatcher`：把操作系统发来的信号分发给适当的处理程序。连接操作系统和应用程序
- `Finalizer`：负责对象的~~finalize()~~方法
- `Reference Handler`：和GC、引用相关的线程
- `main`：主线程，用户程序的入口

## 第3章 多线程比线程复杂在哪里？

> 讲解什么是多线程，并讲解需要多线程的原因、局限。

###  3-1 什么是多线程？生活案例：“合租室友”和“吃火锅” (09:02)

多线程的概念

> 多线程是指在单个进程中运行多个线程。如果一个程序允许允许两个或以上的线程，那么它就是多线程程序。



比喻：

1. 老友记的比喻
   - 客厅：公共空间
   - 厕所：锁
   - 独立房间：线程独享空间
   - 花园浇花：线程合作
2. 火锅的比喻
   - 大火锅一个人吃：就是单进程单线程
   - 大火锅多人吃：就是单进程多线程
   - 分开吃小火锅：就是多进程多线程
   - 我吃火锅，别人吃火锅底料：那就是我拥有锁，别人拿不到锁



多线程实例：抢火车票

<img src="https://tva1.sinaimg.cn/large/006y8mN6ly1g8t0no9wyrj314q0k243y.jpg" alt="多线程实例：抢火车票" style="zoom:25%;" />

| 相互独立的任务                                               | 资源共享的任务                                               |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| <img src="https://tva1.sinaimg.cn/large/006y8mN6ly1g8t0p5x9wsj314q0p2gtl.jpg" alt="相互独立的任务" style="zoom:25%;" /> | <img src="https://tva1.sinaimg.cn/large/006y8mN6ly1g8t0qiwv02j30xe0tegv5.jpg" alt="资源共享的任务" style="zoom:25%;" /> |

###  3-2 为什么需要多线程？3大原因 (06:54)

1. 最主要的目的就是提高CPU利用率

   - 提高处理速度

   - 避免无效等待（IO的时候可以做别的事）

   - 提高用户体验：避免卡顿、缩短等待时间

     1. 并行处理，提高性能。通常是服务器领域（例如Tomcat），用多个线程去接收进来的HTTP请求，而不是排队等待单一的线程处理

     2. 在Android开发中，主线程的重要任务之一是绘制屏幕界面，该线程中不允许进行IO操作或网络请求，目的就是避免卡顿，影响用户的交互

2. 便于编程建模

   把这个大的任务A分解成几个小任务，任务B、任务C、任务D，分别建立程序模型，并通过多线程分别运行这几个任务，那就简单很多了。

3. 计算机性能定律：摩尔定律失效，阿姆达尔定律登上舞台

   - 摩尔定律

     > 当价格不变时，集成电路上可容纳的元器件的数目，约每隔18-24个月便会增加一倍，性能也将提升一倍。

   - 阿姆达尔定律

     > 一般情况下，处理器越多，程序执行的速度就会越快，但是会有一个上限，上限取决于程序中串行部分的比例，并行的比例越高，多处理器的效果越明显。

     <img src="https://tva1.sinaimg.cn/large/006y8mN6ly1g8t15hbqmqj310o0twtji.jpg" alt="阿姆达尔定律" style="zoom:40%;" />


###  3-3 什么场景需要多线程？有哪些局限？ (04:07)

什么场景中会用到多线程?

1. 什么时候需要新开线程

   通常在需要进行耗时任务的时候，例如执行磁盘IO读写，或者从网络获取信息的时候。

2. 为了同时做多件不同的事

   开网页同时听音乐

   后台线程：比如执行定时任务quartz

3. 为了提高工作效率、处理能力

   tomcat：每次有一个新的请求过来的时候，tomcat会把这个请求交给一个新的线程去处理，。

   多线程后台并行下载文件

   NIO和AIO

4. 需要同时有很大并发量的时候

   压测



多线程的局限

1. 性能问题：上下文切换带来的消耗

2. 异构化任务（任务结构不一样）很难高效并行

3. 带来线程安全问题

   数据安全问题。a++数据错误

   线程带来的活跃性问题。线程饥饿、死锁


## 第4章 并行和并发傻傻分不清楚？
> 讲解并行、串行、并发的含义，并说明操作系统、处理器、编程语言的发展使得并发“飞入寻常百姓家”。

###  4-1 并行和并发傻傻分不清楚？一图胜千言 (10:07)

串行和并行

> 串行是大家排队一个个来，并行是大家一起来

一图胜千言

- 线程的串行并行

  <img src="https://tva1.sinaimg.cn/large/006y8mN6ly1g8t1jyy0nej30z70u048c.jpg" alt="线程的串行并行" style="zoom:25%;" />

- 通讯的串行并行

  <img src="https://tva1.sinaimg.cn/large/006y8mN6ly1g8t1lt89b4j30se0w2n9q.jpg" alt="通讯的串行并行" style="zoom:25%;" />



并发和并行

一图胜千言

- 并发：同一时刻仅有一个线程

  <img src="https://tva1.sinaimg.cn/large/006y8mN6ly1g8t1ukp6jbj30ta0kqgun.jpg" alt="并发" style="zoom:25%;" />

  Concurrency：

  1. Single Processor
  2. Logically simultaneous processing

- 并行：同一时刻可以有多个线程

  <img src="https://tva1.sinaimg.cn/large/006y8mN6ly1g8t1w7tzf6j30t20iyq9i.jpg" alt="并行" style="zoom:25%;" />

  Parallelism：

  1. Multiprocessores,Multicore
  2. Physically simultaneous processing

- 实例：排队买咖啡

  1. 并发（Concurrent），一台咖啡机，两个等待队列

     <img src="https://tva1.sinaimg.cn/large/006y8mN6ly1g8t22yj3eaj312w08k0zm.jpg" alt="一台咖啡机，两个等待队列" style="zoom:40%;" />

  2. 并行（Parallel），两台咖啡机，两个等待队列

     <img src="https://tva1.sinaimg.cn/large/006y8mN6ly1g8t242hyojj310q08s45z.jpg" alt="两台咖啡机，两个等待队列" style="zoom:40%;" />

并行的概念：

> 在**同一时刻**，有多个任务同时执行

- 真正的“同时”运行——在**同一时刻**，有多个任务同时执行
- 例如，在多核处理器上，有两个线程同时执行一段代码
- 可见，单核处理器是无法实现并行的，因为单核处理器无法在同一时刻执行多个任务

并发的概念：

> 1. 两个或多个任务可以在重叠的**时间段内**启动、运行和完成
> 2. 对“并发性”的简称

1. 形容多个任务的执行状态

   - 两个或多个任务可以在重叠的**时间段内**启动、运行和完成

   - 并行(两个线程同时执行)一定是并发，并发不一定是并行

     <img src="https://tva1.sinaimg.cn/large/006y8mN6ly1g8t2gpqwa9j30pa0p2qa7.jpg" alt="并发并行的包含关系" style="zoom:25%;" />

   | Concurrency<br />（Single-Core CPU）                         | Concurrency+Parallelism<br />（Multi-Core CPU）              |
   | ------------------------------------------------------------ | ------------------------------------------------------------ |
   | <img src="https://tva1.sinaimg.cn/large/006y8mN6ly1g8t2iw85hij30y80dmq6a.jpg" alt="并发" style="zoom:35%;" /> | <img src="https://tva1.sinaimg.cn/large/006y8mN6ly1g8t2m40uzyj30zg0jiwgn.jpg" alt="并行且并发" style="zoom:35%;" /> |
   | <img src="https://tva1.sinaimg.cn/large/006y8mN6ly1g8t2ptq9fzj308w0ncmxv.jpg" alt="image-20191110173039490" style="zoom:30%;" /> | <img src="https://tva1.sinaimg.cn/large/006y8mN6ly1g8t2qusdalj308w0nq3zy.jpg" alt="image-20191110173138540" style="zoom:30%;" /> |

   <img src="https://tva1.sinaimg.cn/large/006y8mN6ly1g8t2wbimw3j319u0u0djb.jpg" alt="image-20191110173650360" style="zoom:30%;" />

2. 程序的不同部分具有可以同时执行的性质

   - “并发性”是一种程序的性质。如果一个程序具有并发性，说明这个程序的不同的部分可以无序或同时执行，且不影响最终的执行结果。
   - 在不同核心数的计算机上的不同表现。此时，并行和并发的概念不在同一维度上

   并发性是并发执行或并行执行的前提条件和必要条件

###  4-2 并发的第二种概念——生活场景举例：打游戏时女朋友来电话查岗 (06:56)

1. 打游戏时，女朋友来电话

   同时打游戏和接电话。并发

   关掉游戏，专心接电话。串行

2. 单核CPU

   程序具备并发性，但不并行执行。单核并发程序

   程序具备并发性，且并行执行：多核并发程序

   既不并行执行，也不具备并发性：单核串行程序

   并行执行，但程序不具备并发性：不可能

###  4-3 是什么让并发和并行成为了可能？ (03:48)

- 操作系统

- 多核CPU

- 编程语言

## 第5章 高并发只是并发的升级版吗？
> 用业界场景说明高并发不仅仅是并发的升级版，也不能简单地理解为就是多线程。高并发和多线程相互成就

###  5-1 什么是高并发？企业案例：双11、春晚 (04:21)

高并发

> 同时有很多个请求发送给服务器系统，因此服务器就会并行处理

- 双11天猫

- 春晚微信摇一摇

###  5-2 高并发和多线程的关系？相互成就 (04:47)

多线程和高并发是什么：解决方案、状态

多线程和高并发的关系：多线程是对应高并发场景的一种解决方案。为了解决高并发带来的问题，如数据错乱、程序访问慢、服务器死机，从而使用多线程编程提高硬件利用率，获取到更多资源。

高并发并不意味着是多线程：Redis缓存层

###  5-3 高并发有哪些重要指标？ (03:58)

- QPS（Queries Per Second）：每秒请求数
- 带宽：峰值流量和页面的平均大小
- PV（Page View）：24小时的页面浏览量
- UV（Unique Visitor）：独立用户访问量
- 吞吐率（Requests per second）
- 并发连接数（The number of concurrent connections）：某个时刻服务器接受请求的数目
- 服务器平均请求等待时间（Time per request: across all concurrent requests）：服务器处理一个请求需要花费的时间



IP和UV的区别

- UV是用户cookies数量
- IP与UV数量关系不确定

## 第6章 你真的懂同步与异步？阻塞与非阻塞？
> 把同步异步、阻塞和非阻塞用烧水壶和买书的例子讲解清楚

###  6-1 一图胜千言：同步、异步是什么含义？ (08:47)

- 同步与异步：被调用者，调用结束后是否主动返回结果
- 阻塞和非阻塞：调用者，调用后是否可以去做别的事



一图胜千言

| Synchronous Execution                                        | Asynchronous Execution                                       |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| <img src="https://tva1.sinaimg.cn/large/006y8mN6gy1g8ttuwc30pj313s0lyn67.jpg" alt="同步" style="zoom:40%;" /> | <img src="https://tva1.sinaimg.cn/large/006y8mN6gy1g8ttwcrqrvj313o0n6dpx.jpg" alt="异步" style="zoom:40%;" /> |
| <img src="https://tva1.sinaimg.cn/large/006y8mN6gy1g8tu00xrw8j30py0v4n0w.jpg" alt="同步" style="zoom: 30%;" /> | <img src="https://tva1.sinaimg.cn/large/006y8mN6gy1g8tu1xfumij30q00v2gqh.jpg" alt="异步" style="zoom:30%;" /> |
| <img src="https://tva1.sinaimg.cn/large/006y8mN6gy1g8tu3zcjy1j30ic0o6418.jpg" alt="同步" style="zoom:40%;" /> | <img src="https://tva1.sinaimg.cn/large/006y8mN6gy1g8tu6enri2j30iw0o40vx.jpg" alt="异步" style="zoom: 50%;" />![image-20191111092210343](https://tva1.sinaimg.cn/large/006y8mN6gy1g8tu7z769oj30m80nw0xl.jpg) |
| <img src="https://tva1.sinaimg.cn/large/006y8mN6gy1g8tu7z769oj30m80nw0xl.jpg" alt="同步" style="zoom:40%;" /> | <img src="https://tva1.sinaimg.cn/large/006y8mN6gy1g8tu92dappj30lm0na797.jpg" alt="异步" style="zoom:40%;" /> |



同步

- 同步指的是，客户端发出一个请求后，在没有得到结果之前，服务端就不返回任何结果。但是一旦服务端返回，那返回的就是客户端想要的结果（而不是告诉客户端再等等之类的内容）。

- 被调用者主动告诉调用者结果

- 被调用者（也就是服务器）的行为，而不是请求方的行为。

异步

- 不实时处理

- 调用在发出之后，服务端会立刻返回，告诉调用方“我收到你的请求了，我会处理的”

- 调用发出后，等服务端计算完毕后，服务端会通过发消息等途径来通知调用者，或通过回调函数处理这个调用。

同步与异步的例子

- 烧水壶

  同步：盯着水壶

  异步：声音提醒

- 买书，打电话问书店老板

  同步：现场查询

  异步：后续回电



阻塞和非阻塞

- 我是调用者，我调用一个东西的后，结果返回前，是否还能做别的事

- 站在**线程状态**的角度

- 站在**线程发出请求**(通常是HTTP请求)的角度


阻塞非阻塞的例子

- 烧水壶

  阻塞：坐在水壶面前不能动

  非阻塞：等的时候去客厅看电视

- 打电话问书店老板

  阻塞式调用：你会一直把自己“挂起”，直到得到这本书有没有的结果；

  非阻塞式调用：你不管老板有没有告诉你，你自己先一边去玩了， 当然你也要偶尔过几分钟check一下老板有没有返回结果。

  在这里**阻塞与非阻塞与是否同步异步无关**。**跟老板通过什么方式回答你无关**。

###  6-2 4种组合：同步阻塞、同步非阻塞、异步阻塞、异步非阻塞 (05:38)

同步异步、阻塞非阻塞的综合例子

- 同步阻塞：坐在普通水壶前
- 同步非阻塞：水烧开之前我们先去客厅看电视了，但是水壶不会主动通知我们，需要我们时不时的去厨房看一下水有没有烧开
- 异步阻塞：带有提醒功能的水壶烧水，我们坐着等
- 异步非阻塞：带有提醒功能的水壶烧水。在水烧发出提醒之前我们先去客厅看电视了，等水壶发出声音提醒我们。

## 第7章 面试问题检验学习成果
> 面试常见问题，用和本课息息相关的8个常见面试问题来检验同学们的学习收获。

###  7-1 常见面试问题 (04:33)

1. 进程和线程的相同和不同？

   起源不同、概念不同（进程是具有一定独立功能的程序关于某个数据集合上的一次运行活动，进程是系统进行资源分配和调度的一个独立单位；线程是CPU调度单位）、内存共享方式不同、拥有资源不同、数量不同、开销不同

   生命周期（就绪、等待、运行等状态）相似

2. 并行和并发的异同？

   并发：同一时刻仅有一个线程；

   并行：同一时刻可以有多个线程

   并行(两个线程同时执行)一定是并发，并发不一定是并行

3. 高并发是不是就意味着多线程？有什么反例？

   多线程是对应高并发场景的一种解决方案。为了解决高并发带来的问题，如数据错乱、程序访问慢、服务器死机，从而使用多线程编程提高硬件利用率，获取到更多资源，迅速化解高并发带来的压力

   解决高并发不仅只有多线程，比如系统整体架构、Redis缓存层、MQ

4. 多线程可以提高程序执行效率，你知不知道有有哪些弊端？

   - 上下文切换带来的消耗

   - 异构化任务（任务结构不一样）很难高效并行

   - 带来线程安全问题

     数据安全问题。a++数据错误

     线程带来的活跃性问题。线程饥饿、死锁

5. 什么是同步，什么是异步，什么是阻塞，什么是非阻塞？

   同步与异步：被调用者，调用结束后是否主动返回结果

   阻塞和非阻塞：调用者，调用后是否可以去做别的事

6. 在单核CPU上运行多线程程序有意义吗？

   有意义。单CPU多线程，是尽力在压榨CPU的使用率，如果有IO操作，很多线程会休息，如果单线程，那么CPU就休息。如果CPU已经被挤满，那么并不是说在单核CPU上运行多线程程序没有意义，而是说，线程的数量设置不合理，应该减少线程的数量。


## 第8章 全程回顾
> 用思维导图进行全课总结，温故知新，更上一层。

###  8-1 思维导图总结、实战课展望 (16:11)

https://naotu.baidu.com/file/b8a70ff9e7f3af1437594b2d0fb4ebfd