import 'package:bemoltest/controllers/main_controller.dart';
import 'package:bemoltest/ui/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<MainController>();
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
                    controller: controller.nameSearch,
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
                    onChanged: (String text) {
                      controller.search();
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              (controller.nameSearch.text != '' &&
                      controller.productsSearch.isEmpty)
                  ? Center(
                      child: SizedBox(
                        width: size.width * 0.45,
                        height: size.height * 0.3,
                        child: Image.asset('assets/images/empty_list.png'),
                      ),
                    )
                  : Expanded(
                      child: SizedBox(
                        height: size.height * 0.225,
                        child: ListView.separated(
                          itemCount: controller.nameSearch.text != ''
                              ? controller.productsSearch.length
                              : controller.products.length,
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
                                product: controller.nameSearch.text != ''
                                    ? controller.productsSearch[index]
                                    : controller.products[index],
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
