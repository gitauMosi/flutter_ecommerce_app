import 'package:eco_app/controllers/cart_controller.dart';
import 'package:eco_app/controllers/productcontroller.dart';
import 'package:eco_app/models/data.dart';
import 'package:eco_app/models/product.dart';
import 'package:eco_app/pages/product_view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextStyle priceTextStyle = const TextStyle(
  color: Colors.blue,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.put(ProductController());
    CartController cartController = Get.put(CartController());
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Text(
            "Categories",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Container(
          width: double.infinity,
          height: 150,
          margin: const EdgeInsets.only(top: 5),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return _categorayList(
                  context, categories[index].name, categories[index].url);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
          child: Text(
            "Featured Product",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        // const SizedBox(
        //   height: 10,
        // ),
        Container(
          width: double.infinity,
          height: 150,
          margin: const EdgeInsets.only(top: 5),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: featureditems.length,
            itemBuilder: (BuildContext context, int index) {
              return _featuredProduct(context, featureditems[index]);
            },
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.grey.shade300,
          height: 60.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              children: <Widget>[
                Text(
                  "Recent products",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: const Text("View all >", style: TextStyle(color: Colors.lightBlue),),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 4.0,
        ),
        // ...[1,2,3,4,5].map(
        //   (product) => ProductListItem(
        //     onPressed: (){},
        //   ),
        // ),

        Column(
          children: [
            ProductListItem(
              product: products[1],
            ),
            ProductListItem(
                product: products[2],),
            ProductListItem(
                product: products[3],),
            ProductListItem(
                product: products[3],
                ),
          ],
        ),

        const SizedBox(
          height: 10.0,
        )
      ],
    );
  }

  Widget _featuredProduct(BuildContext context, Product item) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductView(product: item));
      },
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
              image: DecorationImage(
                image: AssetImage(item.url),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 150,
            height: 150,
          ),
          Positioned(
            bottom: 0,
            left: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              color: Colors.black87.withOpacity(0.5),
              child: Text(
                item.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget _categorayList(BuildContext context, String name, String url) {
    return InkWell(
      onTap: () {
        //navigateto view products of that category
      },
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12,
                image:
                    DecorationImage(image: AssetImage(url), fit: BoxFit.cover)),
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 100,
            height: 100,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(name)
        ],
      ),
    );
  }
}

class ProductListItem extends StatelessWidget {
  const ProductListItem(
      {super.key,
      required this.product,
    
      });

  final Product product;
 


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: MaterialButton(
        onPressed: () {
          Get.to(()=>ProductView(product: product));
        },
        padding: const EdgeInsets.all(0),
        elevation: 0.5,
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          children: <Widget>[
            Ink(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                    image: AssetImage(product.url),
                    fit: BoxFit.cover,
                    alignment: Alignment.center),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(product.name),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "\$ ${product.price}",
                          style: priceTextStyle,
                        )
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        //add to cart
                      },
                      icon: const Icon(Icons.shopping_cart))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
