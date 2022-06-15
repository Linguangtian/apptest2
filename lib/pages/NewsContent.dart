import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_html/flutter_html.dart';

class  NewsContent extends StatefulWidget{
  Map arguments;
  NewsContent({Key ? key,required this.arguments}):super(key: key);
  _NewsContentState createState() => _NewsContentState(this.arguments);
}

class _NewsContentState extends State{
  Map arguments;
  List _list=[];
  _NewsContentState(this.arguments);

  void initState(){
    super.initState();
    print(this.arguments);
    this._getData();

  }

  _getData() async{
    var  apiUrl =  "http://www.phonegap100.com/appapi.php?a=getPortalArticle&aid=${this.arguments["aid"]}";
    var response = await Dio().get(apiUrl);
    setState(() {
        this._list = json.decode(response.data)["result"];
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(title: Text("新闻详情页"),),
            body: ListView(
              children:  <Widget>[
                Html(
                    data:  """${this._list.length>0? this._list[0]["content"] : ''} """,

                )
              ],
            ),
    );
  }

}