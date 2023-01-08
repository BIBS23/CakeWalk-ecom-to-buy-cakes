import 'package:flutter/material.dart';
import 'package:snapbut/Screens/cart.dart';

class CartProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  double _total = 0;
  double get total => _total;

  void cartSizeincr() {
    _count++;
    notifyListeners();
  }

  void cartSizedecr() {
    _count--;
    notifyListeners();
  }

  void totalpriceincr() {
    for (var i = 0; i < cartitemprice.length; i++) {
      _total = _total + double.parse(cartitemprice[i]);
      print('$_total');
    }
    notifyListeners();
  }

  void totalpricedecr() {
    for (var i = 0; i < cartitemprice.length; i++) {
      _total = _total - int.parse(cartitemprice[i]);
    }
    notifyListeners();
  }
}
