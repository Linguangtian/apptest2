# mytest

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


1.Flutter 两种设计风格: Material 风格、Cupertino风格。

2.使用http包 需要先引起依赖
依赖包管理文件：pubspec.yaml
dev_dependencies:
http: ^0.11.0

3.添加 --no-sound-null-safety     https://www.jianshu.com/p/bd0e37164a9d

4. 引入本地图片也需要配置pubspec.yaml

5.  布局机制的核心就是 widget。  例如行（row）、列（column）以及用来排列、约束和对齐这些可见 widget 的网格（grid）

    将可见 widget 添加到布局 widget。 所有布局 widget 都有一个 child 属性（例如 Center 或 Container ）

    ListView (可以下拉)     ListTile 通常用于在 Flutter 中填充 ListView



    行布局： Row 
    列布局：Column   ->            body: new Center(  child: new Column(
						 children: []	
			）)
    弹性布局 ：Flex	 children: [    new Expanded() ,   new Expanded( flex: 2, )   ]

Expanded包含的组件可以占据剩余的空间。


GridView   Row  Column   ListView  都有 children属性【 】

标准 widgets
Container添加 padding, margins, borders, background color, 或将其他装饰添加到widget.  不是布局
GridView将 widgets 排列为可滚动的网格.
ListView将widget排列为可滚动列表
Stack将widget重叠在另一个widget之上.


