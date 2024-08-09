import 'package:eco_app/models/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {

  List<Product> cart = <Product>[].obs;

  double get totaPrice => cart.fold(0.0, (sum, item) => sum + item.currrentPrice);

  double getCartTotalPrice(){
    return totaPrice;
  }

  void addItemInCart(Product p){
      cart.add(p);
      update();
  }
  void setPrice(Product p, double price){
    p.currrentPrice = price;
    update();
  }
}

