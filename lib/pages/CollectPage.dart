import 'package:flutter/material.dart';


class CollectPage extends StatelessWidget{
    @override
    Widget build(BuildContext context){
   return MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: Text('网格布局'),
              ),

              body: TextCentent3()
            )
          );
    }
}


class TextCentent extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
   return GridView.count(  //网格组件
       crossAxisCount: 3,//控制网格列数
        children: [
          Text('这是一个文本'), //孩子元素
          Text('这是一个文本'),
          Text('这是一个文本'),
          Text('这是一个文本'),
          Text('这是一个文本'),
          Text('这是一个文本'),
        ],
   );
  }
  
}



class TextCentent2 extends StatelessWidget{
  List<Widget> _getlistData(){
    List<Widget> list = [];

    for(var i=0;i<20;i++){
      list.add(Container(
        alignment: Alignment.center,
        child: Text(
          '这是第$i条数据',
          style: TextStyle(color: Colors.white,fontSize: 20),
        ),
        color: Colors.blue,
//        height: 400,    //设置高度没有反应,
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(    //网格组件

        crossAxisSpacing: 20.0, //水平子Widget 之间的间距

        mainAxisSpacing: 20.0,  //垂直子Widget 之间的间距

        padding: EdgeInsets.all(10),  //与View上下左右间隔10

        crossAxisCount: 2,    //控制网格列数

        childAspectRatio: 0.7,    //宽度和高度的比例

        children: this._getlistData() //返回的是Widget
    );

  }

}

class TextCentent3 extends StatelessWidget{
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

  List<Widget> _getlistData(){

    var tempList = listData.map((value){
      return Container(
        child: Column(            //注意，这里也可以用ListView来获取数据，但是ListView的不足在它会自适应宽度，也就是平铺整个宽度
          children: <Widget>[     //但是，Column不会，他只会显示元素多大就是多大，而且是自动垂直排列
            Image.network(value['imageUrl']),
            SizedBox(height: 10,),    //让Text与Image有10的间距
            Text(value['title'],
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15
              ),
            )
          ],
        ),
        decoration: BoxDecoration(    //边框类
            border: Border.all(         //设置边框样式
                color: Color.fromRGBO(233, 233, 233, 0.9),  //颜色
                width: 1    //边框宽度
            )
        ),
      );
    });
    return tempList.toList();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(    //网格组件    —   列表布局

        crossAxisSpacing: 20.0, //水平子Widget 之间的间距

        mainAxisSpacing: 20.0,  //垂直子Widget 之间的间距

        padding: EdgeInsets.all(10),  //与View上下左右间隔10

        crossAxisCount: 2,    //控制网格列数

//        childAspectRatio: 0.7,    //宽度和高度的比例

        children: this._getlistData() //返回的是Widget
    );
  }

}



