import 'package:flutter/material.dart';
class ListPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Hello flutter'),
          ),
          body: HomeContent3(),
        ),


      );
  }
}


class HomeContent extends StatelessWidget{
   @override
  Widget build(BuildContext context){
     return ListView(
          children: [
           ListTile(
              leading: Icon(Icons.settings,color: Colors.yellow),
              title: Text('xxxaassadfgajn,amdsmdsma.lkdslamdamasdma.m'),
              subtitle: Text('asdjasjal;amslds,da'
                  'saklsadlsksa;dk'),
            ),
            ListTile(
              leading: Icon(Icons.home,size:30),
              title: Text("ssssssasadcccccccccc"),
              subtitle: Text('xxxxxasdkjasldhkshdsagsmhdgsmhgd'),
              trailing: Icon(Icons.settings),
            ),
             ListTile(     //每个item一般都是写在ListTile里，这是规范
             leading: Image.network("https://www.itying.com/images/flutter/1.png"),
             title: Text('床前明月光，按数据库里大家都刻录机按时考虑到就开始拉到就'),  //标题
             subtitle: Text('阿斯利康大神解答控件阿斯科利大家酷啦四大皆空拉丝机的酷啦数据库了多久啊上课了多久啊上课了经典款了'), //内容
             ),

          ],

     );
   }

}



class HomeContent2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    return ListView(
      scrollDirection: Axis.vertical,     //垂直列表
      padding: EdgeInsets.all(10),
      children: <Widget>[
        Image.network('https://www.itying.com/images/flutter/1.png'),
        Container(
          child: Text('我是一个标题',
            textAlign: TextAlign.center,  //居中
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          height: 60,
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        ),
        Image.network('https://www.itying.com/images/flutter/2.png'),
        Container(
          child: Text('我是一个标题',
            textAlign: TextAlign.center,  //居中
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          height: 60,
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        ),
        Image.network('https://www.itying.com/images/flutter/3.png'),
        Container(
          child: Text('我是一个标题',
            textAlign: TextAlign.center,  //居中
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          height: 60,
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        ),
        Image.network('https://www.itying.com/images/flutter/4.png'),
        Container(
          child: Text('我是一个标题',
            textAlign: TextAlign.center,  //居中
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          height: 60,
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        ),
        Image.network('https://www.itying.com/images/flutter/5.png'),
        Container(
          child: Text('我是一个标题',
            textAlign: TextAlign.center,  //居中
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          height: 60,
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        ),
        Image.network('https://www.itying.com/images/flutter/6.png'),
        Container(
          child: Text('我是一个标题',
            textAlign: TextAlign.center,  //居中
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          height: 60,
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        ),
        Image.network('https://www.itying.com/images/flutter/2.png'),
        Image.network('https://www.itying.com/images/flutter/3.png'),
        Image.network('https://www.itying.com/images/flutter/4.png'),
        Image.network('https://www.itying.com/images/flutter/1.png'),
        Image.network('https://www.itying.com/images/flutter/2.png'),
        Image.network('https://www.itying.com/images/flutter/3.png'),
        Image.network('https://www.itying.com/images/flutter/1.png'),
        Image.network('https://www.itying.com/images/flutter/2.png'),
        Image.network('https://www.itying.com/images/flutter/3.png'),
      ],
    );
  }

}

class HomeContent3 extends StatelessWidget{
  List <Widget>  _getData(){

    List <Widget>  list = [];
    for(var i=0; i<20;i++ ){
        list.add(ListTile(
          title:Text("我是列表$i"),
        ));
     }

    return list;
  }

  @override
  Widget build(BuildContext context){

    return ListView(
      children: this._getData(),
    );
  }

}


class HomeContent4 extends StatelessWidget{
  List listData=[
    {
      "title":'Candy Shop',
      "author":'Mohamed Chahin',
      "imageUrl":'https://www.itying.com/images/flutter/1.png',
    },
    {
      "title":'Childhood in a picture',
      "author":'Google',
      "imageUrl":'https://www.itying.com/images/flutter/2.png',
    },
    {
      "title":'Alibaba Shop',
      "author":'Alibaba',
      "imageUrl":'https://www.itying.com/images/flutter/3.png',
    },
    {
      "title":'Candy Shop',
      "author":'Mohamed Chahin',
      "imageUrl":'https://www.itying.com/images/flutter/4.png',
    },
    {
      "title":'Tornado',
      "author":'Mohamed Chahin',
      "imageUrl":'https://www.itying.com/images/flutter/5.png',
    }
  ];

  List<Widget> _getData(){

    var tempList = listData.map((value){      //首先我要说明一下，因为它返回的是一个map类型的值，所以我们就用var让它自动判断来接收值
      return ListTile(                  //其次再来分析这个return，这里它的作用是，每次返回改变后的值赋给tempList
        leading: Image.network(value["imageUrl"]),
        title: Text(value["title"]),
        subtitle: Text(value["author"]),
      );
    });

    return tempList.toList();       //最后再返回这个值，但是要记住，他不是一个集合数组，所以我们要让它转换下类型，通过toList
  }

  @override
  Widget build(BuildContext context){

    return ListView(
      children: this._getData(),
    );
  }

}