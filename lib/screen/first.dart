import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/counter.dart';
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<CounterModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Counter Value is: ${counterModel.getCounter()}',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
              child: Text('Next example'),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () => counterModel.incrementCounter(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 30),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () => counterModel.decrementCounter(),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          
        ],
      ),
    );
  }
}
