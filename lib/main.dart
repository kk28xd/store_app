import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/Pages/Update_Product_Page.dart';

import 'Pages/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home.id,
      routes: {
        Home.id: (context) => const Home(),
        UpdateProduct.id: (context) => const UpdateProduct()
      },
    );
  }
}
