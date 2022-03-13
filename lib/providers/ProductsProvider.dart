import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../model/Products.dart';

class ProductsProvider extends ChangeNotifier{
  Products? _products;
  int _selectedIndex=0;

  Products? get products => _products;
  set products(Products? value) {
    _products = value;
    notifyListeners();
  }

  int get selectedIndex => _selectedIndex;
  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }


  loadProductsData(BuildContext context){
    DefaultAssetBundle.of(context).loadString("jsonfile/jsondata.json").then((value) {
        products = Products.fromJson(jsonDecode(value));
         products?.data?[0].isSelected = true;
    });
  }

}