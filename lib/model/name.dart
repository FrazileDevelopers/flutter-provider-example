import 'package:flutter/material.dart';

class NameModel with ChangeNotifier {
  String _name = 'Tyson';

  getName() => _name;

  void setName(str){
    _name = str;
    notifyListeners();
  }

}
