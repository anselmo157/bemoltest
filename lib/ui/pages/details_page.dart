import 'package:bemoltest/controllers/main_controller.dart';
import 'package:bemoltest/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  final ProductModel product;

  const DetailsPage({
    required this.product,
    super.key,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final controller = context.read<MainController>();
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
            onPressed: () async {
              setState(() {
                controller.changeFavoriteProducts(widget.product);
              });
            },
            icon: Icon(
              Icons.favorite,
              color: (controller.productsFavorites.contains(widget.product))
                  ? Colors.red
                  : Colors.grey,
            ),
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
                      widget.product.image,
                      height: size.height * 0.41,
                      width: size.width * 0.8,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(
                    widget.product.title,
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
                            ' ${widget.product.rate} (${widget.product.count} reviews)',
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
                        '\$${widget.product.price}',
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
                          widget.product.category,
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
                    widget.product.description,
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
