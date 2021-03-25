import 'package:flutter/foundation.dart';

//PROVIDER STATE MANAGEMENT
class AngkaAwal with ChangeNotifier{
  int _angkaAwal = 0;

  int get angkaAwal => _angkaAwal;
  set angkaAwal(int value)
  {
    _angkaAwal = value;
    notifyListeners();
  }
}