import 'package:rxdart/rxdart.dart';
import '../model/account.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
class AccountBloc2 {

  int initialCount = 0; //if the data is not passed by paramether it initializes with 0
  BehaviorSubject _accountList;
  
  AccountBloc2({this.initialCount}){
    // List asdf = new List();
    // asdf.add([Account(name: "asdf",avatar: "https://avatars3.githubusercontent.com/u/14101776?v=4",star: 1,description: "asdf")]);
    // asdf.add([Account(name: "asdf",avatar: "https://avatars3.githubusercontent.com/u/14101776?v=4",star: 1,description: "asdf")]);
    _accountList = new BehaviorSubject.seeded([Account(name: "asdf",avatar: "https://avatars3.githubusercontent.com/u/14101776?v=4",star: 1,description: "asdf")]); //initializes the subject with element already
  }
  Observable get counterObservable => _accountList.stream; 

  getData(page) async{
    var url = "https://api.github.com/search/repositories?q=flutter&page=${page}&per_page=10";  
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body)['items'];
      print(jsonResponse.length);
      jsonResponse.forEach((i)=>{
        print('adsf : ${Account.fromJson(i)}'),
        
        _accountList.add(Account.fromJson(i))
      });
      print('!!!${_accountList}}');
      // _isLoading = false;
    } else {
      print("Request failed with status: ${response.statusCode}.");
      // _isLoading = false;
    }
  }
  getList() => _accountList;
  getLength() => _accountList.length;
  // void increment(){
  //   initialCount++;
  //   _subjectCounter.sink.add(initialCount);
  // }

  // void decrement(){
  //   initialCount--;
  //   _subjectCounter.sink.add(initialCount);
  // }

  void dispose(){
    _accountList.close();
  }
  
}