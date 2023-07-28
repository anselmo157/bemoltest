import 'package:bemoltest/controller/main_controller.dart';
import 'package:bemoltest/model/product_model.dart';
import 'package:bemoltest/ui/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    MainController controller = Provider.of<MainController>(context);

    print(controller.products);

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
          // children: [
          //   ProductItem(
          //     product: controller.products[0],
          //     isFavoritePage: true,
          //   ),
          // ],
          ),
    );
  }
}
