import 'package:bemoltest/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;

  const ProductItem({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.red,
      height: size.height * 0.2,
      width: size.width,
      child: const Text('Teste'),
    );
  }
}
