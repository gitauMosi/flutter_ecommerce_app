import 'package:eco_app/controllers/cart_controller.dart';
import 'package:eco_app/models/product.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  List<Product> _orders = <Product>[].obs;
  List<Product> get orders => _orders;

  

  CartController cartController = Get.find();

  //double get totaPrice => _orders.fold(0.0, (sum, item) => sum + item.price);

  // double getTotal() {
  //   return totaPrice;
  // }

  int getQty(Product p) {
    return p.qty;
  }

  void addQty(Product item) {
    item.increaseQty();

    update();
  }

  void minusQty(Product item) {
    item.decreaseqty();

    update();
  }

  void addOrder(Product item) {
    _orders.add(item);
    cartController.addItemInCart(item);
    update();
  }

  void removeOrder(Product p) {
    //remove itein order list
  }


  
}
