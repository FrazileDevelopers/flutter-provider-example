import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/counter.dart';
import '../model/name.dart';
import './second_sub.dart';
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<CounterModel>(context);
    final nameModel = Provider.of<NameModel>(context);
    String name;
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider & Bloc example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SecondSub(), //This is sub widget
            Text('Counter Value is: ${counterModel.getCounter()}'),   // Also, it is not necessary to separate like SecondSub()
            Text('Name is : ${nameModel.getName()}'),
            Container(
              margin: EdgeInsets.only(right: 50,left:50),
              child: TextField(
                textAlign: TextAlign.center,
                onChanged: (str){
                  name=str;
                },
                decoration: InputDecoration(
                  hintText: 'Put in your name'
                ),
              ),
            ),
            RaisedButton(
              child: Text('Save name'),
              onPressed: () => nameModel.setName(name),
            ),
            RaisedButton(
              child: Text('Next example(Third)'),
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
            ),
          ],
        ),
      ),
     
    );
  }
}
