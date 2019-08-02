import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/counter.dart';
import 'model/name.dart';
import 'model/account.dart';
import 'model/counter_stream.dart';
import 'screen/first.dart';
import 'screen/second.dart';
import 'screen/third.dart';
import 'screen/fourth.dart';
import 'dart:async';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterModel>(builder: (_)=>CounterModel()),
        ChangeNotifierProvider<NameModel>(builder: (_)=>NameModel()),
        ChangeNotifierProvider<AccountModel>(builder: (_)=>AccountModel()),
        StreamProvider<CounterStreamModel>(builder: (_)=>CounterStreamModel().stream)
      ],
      child: MaterialApp(
        title: 'Provider & Bloc example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/':(context)=> FirstScreen(),
          '/second':(context)=>SecondScreen(),
          '/third':(context)=>ThirdScreen(),
          '/fourth':(context)=>FourthScreen(),
        },
      ),
    );
  }
}
