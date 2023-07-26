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
      height: size.height * 0.2,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            child: Image.network(
              product.image,
              width: size.width * 0.3,
              height: size.height * 0.16,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 232,
                child: Text(
                  product.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xFFFFD700),
                      ),
                      Text(
                        '${product.rate} (${product.count} reviews)',
                        style: TextStyle(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.65),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon:
                        const Icon(Icons.favorite_outline, color: Colors.black),
                    iconSize: 24,
                  ),
                ],
              ),
              Text(
                '\$${product.price}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xFFF37A20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
