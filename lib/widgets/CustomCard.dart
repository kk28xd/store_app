import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import '../Pages/HomePage.dart';

class CustomCard extends StatefulWidget {
  CustomCard({super.key, required this.pro, required this.heart});

  final ProductModel pro;
  bool heart;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed('Update',arguments: widget.pro);
      },
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 50,
              color: Colors.grey.withOpacity(0.05),
            )
          ]),
          child: Card(
            elevation: 10,
            surfaceTintColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: SizedBox(
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.pro.title,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis),
                          ),
                          Text(
                            '\$${widget.pro.price}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          widget.heart = !widget.heart;
                        });
                      },
                      icon: widget.heart == false
                          ? const FaIcon(
                              FontAwesomeIcons.heart,
                            )
                          : const FaIcon(
                              FontAwesomeIcons.solidHeart,
                              color: Colors.red,
                            )),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 70,
            left: 60,
            child: Image.network(
              widget.pro.image,
              height: 90,
              width: 90,
            )),
      ]),
    );
  }
}
