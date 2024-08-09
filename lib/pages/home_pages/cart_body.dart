import 'package:eco_app/controllers/productcontroller.dart';
import 'package:eco_app/models/order_item.dart';
import 'package:eco_app/models/product.dart';
import 'package:eco_app/pages/confirm_orderpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';

final priceTextStyle = TextStyle(
    color: Colors.grey.shade600, fontSize: 15.0, fontWeight: FontWeight.bold);

// ignore: must_be_immutable
class CartBody extends StatelessWidget {
  CartBody({super.key});

  //final CartController cartController = Get.find();
  CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.find();
     double getTotal(){
      Future.delayed(Duration.zero, () async {});
      return Get.find<CartController>().getCartTotalPrice();
     }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0),
        children: [
          const Text(
            "My Orders",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Container(
            width: double.infinity,
            height: 300.0,
            color: Colors.transparent,
            child: ListView.builder(
                itemCount: controller.orders.length,
                itemBuilder: (BuildContext context, int index) {
                  return customOrders(
                      controller.orders[index].name,
                      controller.orders[index].qty,
                      controller.orders[index].price,
                      controller.orders[index].url,
                      controller,
                      controller.orders[index]);
                }),
          ),
          const SizedBox(
            height: 20.0,
          ),
          _buildDivider(),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Text(
                "VAT (5%)",
                style: priceTextStyle,
              ),
              const Spacer(),
              Text(
                "\$0",
                style: priceTextStyle,
              ),
              const SizedBox(
                width: 20.0,
              )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          _buildDivider(),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20.0,
              ),
              Text(
                "Total",
                style: priceTextStyle.copyWith(color: Colors.black),
              ),
              const Spacer(),
              
                 Text(
                  "\$ ${getTotal()}",
                  style: priceTextStyle.copyWith(color: Colors.indigo),
                ),
              
              const SizedBox(
                width: 20.0,
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                backgroundColor: Colors.yellow.shade700,
              ),
              child: const Text(
                "Next",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              onPressed: () {
                Get.to(() => const ConfirmOrderPage());
              },
            ),
          )
        ],
      ),
    );
  }

  Widget customOrders(String name, int qty, double price, String url,
      ProductController controller, Product product) {
    return Column(
      children: [
        OrderListItem(
          item: OrderItem(
            title: name,
            qty: qty,
            price: price,
            bgColor: Colors.deepOrange,
            image: url,
          ),
          controller: controller,
          p: product,
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }

  Container _buildDivider() {
    return Container(
      height: 2.0,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}

class OrderListItem extends StatelessWidget {
  OrderListItem(
      {super.key, this.item, required this.controller, required this.p});
  final OrderItem? item;
  final ProductController controller;
  final Product p;
  final CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    double getTotalproductItem(Product p) {
      double t = p.price * p.qty;
      cartController.setPrice(p, t);
      return t;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: item!.image != null
                ? Image.asset(
                    item!.image!,
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                item!.title!,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0)),
                height: 35.0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        iconSize: 18.0,
                        padding: const EdgeInsets.all(2.0),
                        onPressed: () {
                          controller.minusQty(p);
                        },
                        icon: const Icon(Icons.remove)),
                    GetBuilder<ProductController>(builder: (_) {
                      return Text(
                        "${controller.getQty(p)}", //item!.qty
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      );
                    }),
                    IconButton(
                        iconSize: 18.0,
                        padding: const EdgeInsets.all(2.0),
                        onPressed: () {
                          controller.addQty(p);
                        },
                        icon: const Icon(Icons.add)),
                  ],
                ),
              )
            ],
          )),
          const SizedBox(
            width: 5.0,
          ),
          GetBuilder<ProductController>(builder: (_) {
            return Text(
              "\$${getTotalproductItem(p)}",
              style: priceTextStyle,
            );
          })
        ],
      ),
    );
  }
}
