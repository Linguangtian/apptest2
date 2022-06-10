import 'package:flutter/material.dart';
class Tabs extends StatefulWidget {

  @override
  _TabsState createState() => _TabsState();
}


class _TabsState extends State<Tabs> {
  int _currentIndex=0;
  List _pageList = [    //先将所有页面放到List集合内
    HomexPage(),
    CategoryPage(),
    SettingPage()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterDemo'),
      ),
      body: this._pageList[this._currentIndex],   //再根据下标获取对应页面设置到body 里
      bottomNavigationBar: BottomNavigationBar(     //自定义底部导航条
          currentIndex: this._currentIndex,   //配置对应的索引值选中
          onTap: (int index){
            setState(() {     //改变状态
              this._currentIndex=index;      //更改选中的Tab坐标
            });
          },
          iconSize: 45.0,   //Icon的大小，默认在20左右
          fixedColor: Colors.red, //选中的颜色，默认是蓝色
          type: BottomNavigationBarType.fixed,    //配置底部tabs可以有多个按钮，默认是只能至多只能放三个，三个以上时，需要加上这句代码
          items:[
            BottomNavigationBarItem(      //设置导航项
                icon:Icon(Icons.home),
                title: Text('首页')
            ),
            BottomNavigationBarItem(      //设置导航项
                icon:Icon(Icons.category),
                title: Text('分类')
            ),
            BottomNavigationBarItem(      //设置导航项
                icon:Icon(Icons.settings),
                title: Text('设置')
            ),
          ]
      ),
    );
  }
}





class HomexPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Text('我是首页组件');
  }
}

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('我是一个文本'),
        ),
        ListTile(
          title: Text('我是一个文本'),
        ),
        ListTile(
          title: Text('我是一个文本'),
        ),
        ListTile(
          title: Text('我是一个文本'),
        ),
        ListTile(
          title: Text('我是一个文本'),
        )
      ],
    );
  }
}
class CategoryPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Text('sss');
  }
}
