import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/account.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var accountModel = Provider.of<AccountModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider & Bloc example"),
      ),
      body: Stack(
        children: <Widget>[
          Scrollbar(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                  if (!accountModel.getLoading()) {
                    accountModel.setPage(accountModel.getPage() + 1);
                    accountModel.setLoading();
                    accountModel.getResponse(accountModel.getPage());
                    return true;
                  }
                }
                return false;
              },
              child: ListView.builder(
                itemCount: accountModel.getList().length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                        leading:
                            Image.network(accountModel.getList()[index].avatar),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child:
                                  Text('${accountModel.getList()[index].name}'),
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.star),
                                Text('${accountModel.getList()[index].star}'),
                              ],
                            )
                          ],
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                  '${accountModel.getList()[index].description}'),
                            )
                          ],
                        )),
                  );
                },
              ),
            ),
          ),
          _loader(context,accountModel),
          
        ],
      ),
    );
  }

  Widget _loader(BuildContext context,accountModel) {
    return accountModel.getLoading()
        ? Align(
            child: Container(
              width: 200.0,
              height: 150.0,
              child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(child: CircularProgressIndicator())),
            ),
            alignment: FractionalOffset.bottomCenter,
          )
        : SizedBox(
            width: 0.0,
            height: 0.0,
          );
  }
}
