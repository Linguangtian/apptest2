import '../pages/User.dart';
import '../pages/HttpDemo.dart';
import '../pages/HomePage.dart';
import '../pages/ListPage.dart';
import '../pages/CollectPage.dart';
import '../pages/Tabs.dart';
import '../pages/News.dart';
import '../pages/newscontent2.dart';
import '../pages/newscontent.dart';

import 'package:flutter/material.dart';


//配置路由
final  routes={                   //配置命名路由
  '/user':(context)=>UserPage(),
  '/home':(context)=>HomePage(),
  '/list':(context)=>ListPage(),
  '/collect':(context)=>CollectPage(),
  '/tabs':(context)=>Tabs(),
  '/':(context)=>News(),

   '/newscontent':(context,{arguments})=>NewsContent(arguments:arguments),
  '/httpdemo':(context)=>HttpDemo(),
};

//固定写法
var oonGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String? name = settings.name;
  final Function pageContentBuilder = routes[name] as Function;
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
      MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};