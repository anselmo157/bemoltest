import 'dart:convert';

import 'package:bemoltest/model/product_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController extends ChangeNotifier {
  final dio = Dio();

  List<ProductModel> products = [];
  List<ProductModel> productsFavorites = [];
  List<ProductModel> productsSearch = [];

  final nameSearch = TextEditingController(text: '');

  Future<void> getProducts() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final response = await dio.get('https://fakestoreapi.com/products');

    products.clear();
    productsFavorites.clear();

    for (int i = 0; i < response.data.length; i++) {
      products.add(ProductModel.fromMap(response.data[i], false));
    }

    final List<String>? favoritesJson =
        sharedPreferences.getStringList('favoritesJson');

    if (favoritesJson != null) {
      for (int i = 0; i < favoritesJson.length; i++) {
        var aux = jsonDecode(favoritesJson[i]);
        productsFavorites.add(ProductModel.fromMap(aux, true));
      }
      print(productsFavorites);
    }

    notifyListeners();
  }

  Future<void> changeFavoriteProducts(ProductModel product) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final List<String>? favoritesJson =
        sharedPreferences.getStringList('favoritesJson');

    if (favoritesJson != null) {
      if (!productsFavorites.contains(product)) {
        productsFavorites.add(product);
        favoritesJson.add(jsonEncode(product.toMap()));
        sharedPreferences.setStringList('favoritesJson', favoritesJson);
      } else {
        productsFavorites.remove(product);
        favoritesJson.remove(jsonEncode(product.toMap()));
        sharedPreferences.setStringList('favoritesJson', favoritesJson);
      }
    } else {
      productsFavorites.add(product);
      sharedPreferences.setStringList(
        'favoritesJson',
        [jsonEncode(product.toMap())],
      );
    }

    notifyListeners();
  }

  void search() {
    productsSearch.clear();
    for (int i = 0; i < products.length; i++) {
      if (products[i]
          .title
          .toLowerCase()
          .contains(nameSearch.text.toLowerCase())) {
        productsSearch.add(products[i]);
      }
    }
    notifyListeners();
  }
}
