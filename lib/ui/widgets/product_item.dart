import 'package:bemoltest/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  final bool? isFavoritePage;

  const ProductItem({
    required this.product,
    this.isFavoritePage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.225,
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
              const SizedBox(
                height: 8.0,
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
                  isFavoritePage != true
                      ? IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_outline,
                              color: Colors.black),
                          iconSize: 24,
                        )
                      : Container(),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                '\$${product.price}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xFFF37A20),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
