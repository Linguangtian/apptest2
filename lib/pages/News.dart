import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

class News extends StatefulWidget{
  News({Key? key}) : super(key: key);   //动态渲染数据.super父类  StatefulWidget

  _News createState() => _News();
}

class _News extends State{
  List _list=[];
  int _page = 1;
  bool hasMore = true;
  ScrollController _scrollController = new ScrollController(); //滚动类实例化

  void initState(){
    super.initState();
    this._getData();


    //监听滚动事件
    _scrollController.addListener(() {
      print(_scrollController.position.pixels); //获取滚动条下拉的距离
      print(_scrollController.position.maxScrollExtent); //获取整个页面的高度

      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 40) {
        this._getData();
      }
    });

  }

  _getData() async{
    var apiUrl="http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=${_page}";
    Response response = await Dio().get(apiUrl);
    var res = json.decode(response.data)["result"];

    setState(() {
      this._list.addAll(res);
      this._page++;
    });


    //判断是否是最后一页
    if (res.length < 20) {
      setState(() {
        this.hasMore = false;
      });
    }
  }

  //下拉处理   下拉和滚动不是一起的   Future表示异步编程操作结果
  Future<void> _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 2000), () {
      print('请求数据完成');
      _getData();
    });
  }





  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('dio测试'),
      ),
      body: this._list.length>0
            ? RefreshIndicator(                 //实例化RefreshIndicator 刷新指示器
                child: ListView.builder(
                  controller: _scrollController, //对应的滚动触发实例化
                  itemCount: this._list.length, //20
                  itemBuilder: (context,index){
                    if (index == this._list.length-1){
                      //拉到底
                      return Column(
                        children: [
                          ListTile(
                            title: Text("${this._list[index]["title"]}",
                                maxLines: 1),
                          ),
                          Divider(),
                          _getMoreWidget()
                        ],
                      );

                    } else {
                      return Column(
                        children: <Widget>[
                          ListTile(
                            title: Text("${this._list[index]["title"]}",
                                maxLines: 1),
                            onTap: (){
                              Navigator.pushNamed(context, '/newscontent',arguments:{
                                "aid":this._list[index]["aid"]
                              });
                            },
                          ),
                          Divider()
                        ],
                      );
                     }
                  },

                ),
                onRefresh: _onRefresh  //下拉事件监听， _onRefresh触发事件
              )
            : _getMoreWidget()
            

    );
  }


//加载中的圈圈
  Widget _getMoreWidget() {

    if(hasMore){
      return Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '加载中...',
                style: TextStyle(fontSize: 16.0),
              ),
              CircularProgressIndicator(
                strokeWidth: 1.0,
              )
            ],
          ),
        ),
      );
    }else{
      return Center(
        child: Text("--我是有底线的--"),
      );
    }
  }





}






/*
ListView(
children:
this._list.map((value){
return ListTile(
title: Text(value['title']),
);
}).toList(),
)*/
