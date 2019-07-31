import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/counter.dart';
import '../model/name.dart';
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<CounterModel>(context);
    // final nameModel = Provider.of<NameModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Counter Value is: ${counterModel.getCounter()}'),
            // Text('Name is : ${nameModel.getName()}'),
            SizedBox(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'hi'
                ),
              ),
            ),
            
            RaisedButton(
              child: Text('Next example'),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
      ),
     
    );
  }
}
