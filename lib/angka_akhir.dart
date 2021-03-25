import 'package:flutter/foundation.dart';

//PROVIDER STATE MANAGEMENT
class AngkaAkhir with ChangeNotifier{
  int _angkaAkhir = 0;

  int get angkaAkhir => _angkaAkhir;
  set angkaAkhir(int value)
  {
    _angkaAkhir = value;
    notifyListeners();
  }
}