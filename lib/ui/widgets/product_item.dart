import 'package:bemoltest/controllers/main_controller.dart';
import 'package:bemoltest/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final controller = context.read<MainController>();
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.225,
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.025),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            child: Image.network(
              product.image,
              width: size.width * 0.3,
              height: size.height * 0.17,
            ),
          ),
          SizedBox(
            width: size.width * 0.55,
            child: Column(
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
                        fontSize: 16.0),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                isFavoritePage == true
                    ? const SizedBox(
                        height: 8.0,
                      )
                    : Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                    isFavoritePage != true
                        ? IconButton(
                            onPressed: () {
                              controller.changeFavoriteProducts(product);
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: (controller.productsFavorites
                                      .contains(product))
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                            iconSize: 24,
                          )
                        : Container(),
                  ],
                ),
                isFavoritePage == true
                    ? const SizedBox(
                        height: 8.0,
                      )
                    : Container(),
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
          ),
        ],
      ),
    );
  }
}
