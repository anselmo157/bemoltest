import 'package:bemoltest/model/product_model.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final ProductModel product;

  const DetailsPage({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Product Details',
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
        actions: [
          IconButton(
            onPressed: () async {},
            icon: const Icon(Icons.favorite_outline, color: Colors.black),
            iconSize: 24,
          ),
        ],
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ClipRRect(
                    child: Image.network(
                      product.image,
                      height: size.height * 0.41,
                      width: size.width * 0.8,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(
                    product.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color(0xFFFFD700),
                          ),
                          Text(
                            ' ${product.rate} (${product.count} reviews)',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.65),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '\$${product.price}',
                        style: const TextStyle(
                          fontSize: 29,
                          color: Color(0xFF5EC401),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 26.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.sort,
                        size: 24,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          product.category,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF3E3E3E),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 26.0),
                  child: Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF3E3E3E),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
