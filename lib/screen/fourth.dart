import 'package:flutter/material.dart';
import '../bloc/account2.dart';
class FourthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AccountBloc2 _accountBloc = new AccountBloc2(initialCount: 0);

    return Scaffold(
      appBar: AppBar(
        title: Text("Provider & Bloc example"),
      ),
      body: Stack(
        children: <Widget>[
          StreamBuilder(
            stream : _accountBloc.counterObservable,
            builder: (context, AsyncSnapshot snapshot){
              print('length : ${snapshot.data.length}');
              return Text('aa');
              // return ListView.builder(
              //   itemCount: 10,
              //   itemBuilder: (BuildContext context, int index) {
              //     return Card(
              //       child: ListTile(
              //           leading:
              //             Image.network(snapshot.data[index].avatar),
              //           title: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: <Widget>[
              //               Expanded(
              //                 child:
              //                     Text('${snapshot.data[index].name}'),
              //               ),
              //               Row(
              //                 children: <Widget>[
              //                   Icon(Icons.star),
              //                   Text('${snapshot.data[index].star}'),
              //                 ],
              //               )
              //             ],
              //           ),
              //           subtitle: Row(
              //             children: <Widget>[
              //               Expanded(
              //                 child: Text(
              //                     '${snapshot.data[index].description}'),
              //               )
              //             ],
              //           )),
              //     );
              //   },
              // );
              // return new Text('${snapshot.data[0].name}', style: Theme.of(context).textTheme.display1);
            },
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () => _accountBloc.getData(1),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 30),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () => {
              print('hi'),
              print(_accountBloc.getLength()),
            } ,
            
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          
        ],
      ),
    );
  }

}
