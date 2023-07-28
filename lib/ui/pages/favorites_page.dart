import 'package:bemoltest/model/product_model.dart';
import 'package:bemoltest/ui/widgets/product_item.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  final List<ProductModel> productsFavorites;

  const FavoritesPage({
    required this.productsFavorites,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
          const SizedBox(
            height: 8.0,
          ),
          Expanded(
            child: SizedBox(
              height: size.height * 0.225,
              child: ListView.separated(
                itemCount: productsFavorites.length,
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 2,
                    thickness: 1,
                    color: Color(0xFFF0F0F0),
                  );
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/details',
                      arguments: productsFavorites[index],
                    ),
                    child: ProductItem(
                      product: productsFavorites[index],
                      isFavoritePage: true,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
