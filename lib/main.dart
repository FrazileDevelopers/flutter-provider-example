import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/counter.dart';
import 'screen/first.dart';
import 'screen/second.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=> ChangeNotifierProvider<CounterModel>(
          builder: (_)=> CounterModel(),
          child: FirstScreen(),
        ),
        // '/':(context)=>FirstScreen(),
        '/second': (context) => SecondScreen(),
      },
      
    );
  }
}
