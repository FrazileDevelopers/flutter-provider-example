import 'package:rxdart/rxdart.dart';
import '../model/account.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
class AccountBloc2 {
  
  BehaviorSubject<List<Account>> _accountList;
  BehaviorSubject<bool> _loading;
  List<Account> tmpList = new List();
  int page;

  Observable get accountObservable => _accountList.stream; 
  Observable get loadingObservable => _loading.stream;

  AccountBloc2({this.page}){
    _accountList = new BehaviorSubject.seeded(List<Account>.generate(0, (int index){
      return null;
    }));
    _loading = new BehaviorSubject.seeded(false);
    getData(this.page);
  }

  getData(page) async{
    var url = "https://api.github.com/search/repositories?q=flutter&page=${page}&per_page=20";  
    var response = await http.get(url);
    _loading.sink.add(true);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body)['items'];
      jsonResponse.forEach((i)=>tmpList.add(Account.fromJson(i)));
      _accountList.sink.add(tmpList);
      
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
    _loading.sink.add(false);
  }

  getLength() => _accountList.value.length;
  setPage() => page++;
  
  void dispose(){
    print('dispose!?');
    _accountList.close();
  }

  
  // void increment(){
  //   initialCount++;
  //   _subjectCounter.sink.add(initialCount);
  // }

  // void decrement(){
  //   initialCount--;
  //   _subjectCounter.sink.add(initialCount);
  // }

}