// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../model/counter_stream.dart';
// class FourthScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     print('tq');
//     print(counterStreamModel);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Provider & Bloc example"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Counter Value is: ${counterStreamModel}',
//               style: Theme.of(context).textTheme.display1,
//             ),
//             // StreamProvider<CounterStreamModel>.value(
//             //   value: CounterStreamModel().cartStream,
//             //   child: Text('${counterStreamModel}'),
//             // )
            
//             // RaisedButton(
//             //   child: Text('Next example (second)'),
//             //   onPressed: () {
//             //     Navigator.pushNamed(context, '/second');
//             //   },
//             // ),
//           ],
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           FloatingActionButton(
//             heroTag: "btn1",
//             onPressed: () => print('fff'),
//             // onPressed: () => counterStreamModel.incrementCounter(),
//             tooltip: 'Increment',
//             child: Icon(Icons.add),
//           ),
//           SizedBox(width: 30),
//           FloatingActionButton(
//             heroTag: "btn2",
//             // onPressed: () => counterStreamModel.decrementCounter(),
//             onPressed: ()=>print('h'),
//             tooltip: 'Decrement',
//             child: Icon(Icons.remove),
//           ),
          
//         ],
//       ),
//     );
//   }
// }
