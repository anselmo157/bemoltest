import 'package:bemoltest/ui/widgets/product_item.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final nameSearch = TextEditingController(text: '');

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

  final dio = Dio();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Products',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final response =
                  await dio.get('https://fakestoreapi.com/products');
              print(response);
            },
            icon: const Icon(Icons.favorite_outline, color: Colors.black),
            iconSize: 24,
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF0F1F2),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              width: size.width * 0.9,
              child: TextFormField(
                controller: nameSearch,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'Search Anything',
                  hintStyle: TextStyle(
                      color: Theme.of(context).primaryColor.withOpacity(0.65)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    size: 24,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                onChanged: (String text) {},
              ),
            ),
          ),
          // const ProductItem(),
        ],
      ),
    );
  }
}
