import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('home'),
        ),
        body:new ListView(
            children: [
               HomeCentent(),
               TitleSection(),
                ButtonSection(),
               TextSection(),
            ]
        )

    );
  }

}

class HomeCentent extends StatelessWidget{
    List imgList = [

      {"url":"images/1.png"},
      {"url":"images/3.png"},
    ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  /* var image =  new Image.asset(
      'images/1.png',
      width: 600.0,
      height: 240.0,
      fit: BoxFit.cover,
    );
*/




      return  Column(
        children: [
          /**
           * 必须要套Container，才能使用轮播图，否则会报错
           */
        Container(
          height: 150,
          child:AspectRatio(
            aspectRatio: 16/9,
            child:    Swiper(
              itemBuilder: (BuildContext context,int index){    //每次循环遍历时，将i赋值给index
                return new Image.asset(
                  imgList[index]['url'],
                  fit: BoxFit.fill,);
              },
              itemCount: imgList.length,
              pagination: new SwiperPagination(), //设置：分页器.
              loop: true,   //无限循环
              autoplay: true, //图片自动轮播
//                control: new SwiperControl(),   //设置：左右的箭头
            ),
          ),
        )


        ],



      );

  }
}


class TitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),
        ],
      ),
    );
    //...
  }
}

class TextSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //...

    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );
    ;
    return textSection;
  }

}


class ButtonSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //...

    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

        ],
      ),
    );
    return buttonSection;
  }
}