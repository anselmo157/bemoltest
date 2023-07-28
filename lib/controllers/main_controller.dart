import 'package:bemoltest/model/product_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController extends ChangeNotifier {
  final dio = Dio();

  List<ProductModel> products = [];
  List<ProductModel> productsFavorites = [];

  Future<void> getProducts() async {
    final response = await dio.get('https://fakestoreapi.com/products');

    products.clear();
    
    for (int i = 0; i < response.data.length; i++) {
      products.add(ProductModel.fromMap(response.data[i]));
    }
  }

  Future<void> changeFavoriteProducts(ProductModel product) async {
    if (!productsFavorites.contains(product)) {
      productsFavorites.add(product);
    } else {
      productsFavorites.remove(product);
    }
    notifyListeners();
  }
}
