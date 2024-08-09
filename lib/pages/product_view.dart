import 'package:eco_app/controllers/productcontroller.dart';
import 'package:eco_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ProductView extends StatelessWidget {
  ProductView({super.key, required this.product});

  Product product;


  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title:  Text(product.name),
        actions: [
          GestureDetector(onTap: () {}, child: const Icon(Icons.shopping_bag))
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: <Widget>[
            hero(),
            Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  product.description ?? "",
                  textAlign: TextAlign.justify,
                  style: const TextStyle(height: 1.5, color: Color(0xFF6F8398)),
                )),
            Property(),
            const SizedBox(
              height: 10,
            ),
            bottomButton(controller, product),
            const SizedBox(
              height: 25,
            ),
          ],
        )),
      ),
    );
  }

  Widget hero() {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.asset(
            product.url,
          ), //This
          // should be a paged
          // view.
          // Positioned(child: appBar(),top: 0,),
          Positioned(
            bottom: 0,
            right: 20,
            child: FloatingActionButton(
                elevation: 2,
                backgroundColor: Colors.white,
                onPressed: () {},
                child: const Icon(
                  Icons.favorite,
                  size: 30,
                )),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Property() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text("Color"),
              Row(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    width: 30,
                    height: 30,
                    margin: const EdgeInsets.all(5),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.green, shape: BoxShape.circle),
                    width: 30,
                    height: 30,
                    margin: const EdgeInsets.all(5),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.yellow, shape: BoxShape.circle),
                    width: 30,
                    height: 30,
                    margin: const EdgeInsets.all(5),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.pink, shape: BoxShape.circle),
                    width: 30,
                    height: 30,
                    margin: const EdgeInsets.all(5),
                  ),
                ],
              )
            ],
          ),
          const Column(
            children: <Widget>[
              Text("Size"),
              Text(
                "10.1",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2F2F3E)),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget bottomButton(ProductController c, Product p) {
    
    return Container(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () {
                //navigate to add to cart
                //then go back
                
                c.addOrder(p);
                
              },
              child: const Text(
                "Add to Cart +",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              )),
           Text("\$ ${product.price}",
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 28))
        ],
      ),
    );
  }
}
