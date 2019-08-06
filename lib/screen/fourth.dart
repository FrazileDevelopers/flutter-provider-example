import 'package:flutter/material.dart';
import '../bloc/account2.dart';
class FourthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AccountBloc2 _accountBloc = new AccountBloc2(page:1);

    return Scaffold(
      appBar: AppBar(
        title: Text("Provider & Bloc example"),
      ),
      body: Stack(
        children: <Widget>[
          StreamBuilder(
            stream : _accountBloc.accountObservable,
            builder: (context, AsyncSnapshot snapshot){
              print('snapshot data : ${snapshot.data}');
              return Scrollbar(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    return false;
                  },
                  child: ListView.builder(
                    itemCount: _accountBloc.getLength(),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          leading:
                            Image.network(snapshot.data[index].avatar),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(child:Text('${snapshot.data[index].name}')),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.star),
                                  Text('${snapshot.data[index].star}'),
                                ],
                              )
                            ],
                          ),
                          subtitle: Row(
                            children: <Widget>[Expanded(child: Text('${snapshot.data[index].description}'))],
                          )
                        ),
                      );
                    },
                  ),
                )
              );
            },
          ),
          StreamBuilder(
            stream: _accountBloc.loadingObservable,
            builder: (context, AsyncSnapshot snapshot){
              print(snapshot.data);
              if(snapshot.data==true){
                return Align(
                  child: Container(
                    width: 200.0,
                    height: 150.0,
                    child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(child: CircularProgressIndicator())),
                  ),
                  alignment: FractionalOffset.bottomCenter,
                );
              }else {
                return SizedBox(
                  width: 0.0,
                  height: 0.0,
                );
              }
            }
          ),
           
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () => _accountBloc.getData(1),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
      
        ],
      )
    );
  }
}




          