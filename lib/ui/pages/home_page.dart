import 'package:bemoltest/controller/main_controller.dart';
import 'package:bemoltest/model/product_model.dart';
import 'package:bemoltest/ui/widgets/product_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final nameSearch = TextEditingController(text: '');

  final controller = MainController();

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
              Navigator.pushNamed(
                context,
                '/favorites',
                arguments: controller.productsFavorites,
              );
            },
            icon: const Icon(Icons.favorite_outline, color: Colors.black),
            iconSize: 24,
          ),
        ],
      ),
      body: FutureBuilder(
        future: controller.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(
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
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.65)),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
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
              const SizedBox(
                height: 8.0,
              ),
              Expanded(
                child: SizedBox(
                  height: size.height * 0.225,
                  child: ListView.separated(
                    itemCount: controller.products.length,
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
                          arguments: controller.products[index],
                        ),
                        child: ProductItem(
                          product: controller.products[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
