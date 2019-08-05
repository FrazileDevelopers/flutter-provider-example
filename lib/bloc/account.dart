import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
class AccountBloc with ChangeNotifier {
  var _accountList = [];
  var _isLoading = false;
  var _page = 1;

  getLoading() => _isLoading;
  getList() => _accountList;
  getPage() => _page;

  AccountBloc(){
    getResponse(_page);
  }

  getResponse(page) async{
    var url = "https://api.github.com/search/repositories?q=flutter&page=${page}&per_page=20";  
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body)['items'];
      jsonResponse.map((i)=>_accountList.add(Account.fromJson(i))).toList();
      _isLoading = false;
    } else {
      print("Request failed with status: ${response.statusCode}.");
      _isLoading = false;
    }
    notifyListeners();
  }
  void setLoading(){
    _isLoading = true;
    notifyListeners();
  }
  void setPage(page) {
    _page = page;
    notifyListeners();
  }
}

class Account{
  final String name, description, avatar;
  final int star;
  Account({
    this.name,
    this.description,
    this.star,
    this.avatar
  });

  factory Account.fromJson(Map<String, dynamic> json){
    return new Account(
      name: json['name'],
      description: json['description'],
      star : json['stargazers_count'],
      avatar: json['owner']['avatar_url']
    );
  }
}
