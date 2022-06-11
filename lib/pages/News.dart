import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

class News extends StatefulWidget{
  News({Key? key}) : super(key: key);   //动态渲染数据.super父类

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
    var apiUrl="http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=1";
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

  //下拉处理   下拉和滚动不是一起的
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
            ? RefreshIndicator(
                child: ListView.builder(
                  controller: _scrollController, //对应的滚动触发实例化
                  itemCount: this._list.length, //20


                ),
                onRefresh: _onRefresh  //下拉事件监听， _onRefresh触发事件
              )
            :Text('加载中..........')
            

    );
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
