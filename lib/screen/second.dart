import 'package:flutter/material.dart';
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Counter Value is: ',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
     
    );
  }
}
