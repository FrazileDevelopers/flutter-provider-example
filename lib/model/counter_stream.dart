import 'package:flutter/material.dart';
import 'dart:async';
class CounterStreamModel with ChangeNotifier {
  StreamController<int> _streamController = StreamController<int>();

  Stream get stream => _streamController.stream;
  Sink get sink => _streamController.sink;
  
  StreamController get streamController => _streamController;


  CounterStreamModel() {
    sink.add(1);
  }

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }
}