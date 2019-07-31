import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/counter.dart';
import 'model/name.dart';
import 'screen/first.dart';
import 'screen/second.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterModel>(builder: (_)=>CounterModel()),
        ChangeNotifierProvider<NameModel>(builder: (_)=>NameModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/':(context)=> FirstScreen(),
          '/second':(context)=>SecondScreen(),
        },
      ),
    );
  }
}
