import 'package:bemoltest/model/product_model.dart';
import 'package:bemoltest/ui/pages/details_page.dart';
import 'package:bemoltest/ui/pages/favorites_page.dart';
import 'package:bemoltest/ui/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF37474F),
        fontFamily: 'Poppins',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/details': (context) {
          final args = ModalRoute.of(context)?.settings.arguments as ProductModel;
          return DetailsPage(product: args);
        },
        '/favorites': (context) => FavoritesPage(),
      },
    );
  }
}
