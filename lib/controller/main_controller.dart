import 'package:bemoltest/model/product_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MainController extends ChangeNotifier {
  final dio = Dio();

  List<ProductModel> products = [];
  List<ProductModel> productsFavorites = [];

  Future<void> getProducts() async {
    final response = await dio.get('https://fakestoreapi.com/products');

    for (int i = 0; i < response.data.length; i++) {
      products.add(ProductModel.fromMap(response.data[i]));
    }
  }

  void changeFavorite(ProductModel product) {
    if (!productsFavorites.contains(product)) {
      productsFavorites.add(product);
    }
    print(products.length);
  }
}
