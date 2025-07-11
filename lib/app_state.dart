import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  double _fontSize = 16.0;
  double get fontSize => _fontSize;
  set fontSize(double value) {
    _fontSize = value;
  }

  bool _refreshTasksList = false;
  bool get refreshTasksList => _refreshTasksList;
  set refreshTasksList(bool value) {
    _refreshTasksList = value;
  }
}
