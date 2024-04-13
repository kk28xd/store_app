import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/CustomCard.dart';
import '../services/all_products_service.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static bool heart = false;
  static String id = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'New Trend',
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.cartShopping,
                  color: Colors.black,
                ))
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
            child: FutureBuilder<List<ProductModel>>(
                future: GetAllProducts().getAllProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 50),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    List<ProductModel> pro = snapshot.data!;
                    return GridView.builder(
                      clipBehavior: Clip.none,
                      itemCount: pro.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.4,
                              mainAxisSpacing: 60),
                      itemBuilder: (context, index) => CustomCard(
                        pro: pro[index],
                        heart: heart,
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text('sorry there is an error'),
                    );
                  }
                })));
  }
}
