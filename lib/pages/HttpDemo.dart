import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:dio/dio.dart';
class HttpDemo extends StatefulWidget {
  _HttpDemoState createState() => _HttpDemoState();
}


class _HttpDemoState extends State<HttpDemo> {

  List _list=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getData();
  }
  _getData() async{
    var apiUrl="http://a.itying.com/api/productlist";
    Response res = await Dio().get(apiUrl);
    var   result =  json.decode(res.data);
    if(result.statusCode==200){
      print(result.body);
      setState(() {
        this._list=json.decode(result.body)["result"];
      });
    }else{
      print("失败${result.statusCode}");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("请求数据Demo"),
        ),
        body: this._list.length>0?ListView(
          children: this._list.map((value){
            return ListTile(
              title: Text(value["title"]),
            );
          }).toList(),
        ):Text("加载中...")
    );
  }
}
