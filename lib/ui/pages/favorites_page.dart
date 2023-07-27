import 'package:bemoltest/model/product_model.dart';
import 'package:bemoltest/ui/widgets/product_item.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({super.key});

  var map = {
    "id": 1,
    "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
    "price": 109.95,
    "description":
        "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your every…",
    "category": "men's clothing",
    "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    "rate": 3.9,
    "count": 120,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Favorites',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
          iconSize: 24.0,
          color: Theme.of(context).primaryColor,
        ),
      ),
      body: Column(
        children: [
          ProductItem(
            product: ProductModel.fromMap(map),
            isFavoritePage: true,
          ),
        ],
      ),
    );
  }
}
