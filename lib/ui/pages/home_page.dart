import 'package:bemoltest/ui/widgets/product_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final nameSearch = TextEditingController(text: '');

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
            onPressed: () {},
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
          const ProductItem(),
        ],
      ),
    );
  }
}
