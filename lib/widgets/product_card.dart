import 'package:eco_app/widgets/customicon.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  int cardColor;
  String imgUrl;
  String title;
  String previousPrice;
  String price;

  ProductCard(
      this.cardColor, this.imgUrl, this.title, this.previousPrice, this.price, {super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: 320.0,
      decoration: BoxDecoration(
          color: Color(cardColor),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.grey.withOpacity(.3), width: .2)),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 8.0,
          ),
          Image.asset(imgUrl, width: 281.0, height: 191.0),
          Text(title, style: const TextStyle(fontSize: 25.0)),
          const SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(CustomIcons.favorite),
                  onPressed: () {},
                ),
                Column(
                  children: <Widget>[
                    Text(previousPrice,
                        style: const TextStyle(
                            color: Color(0xFFfeb0ba),
                            fontSize: 16.0,
                            fontFamily: "Helvetica")),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Text(price,
                        style:
                            const TextStyle(fontSize: 28.0, fontFamily: "Helvetica")),
                  ],
                ),
                IconButton(
                  icon: const Icon(CustomIcons.cart),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}