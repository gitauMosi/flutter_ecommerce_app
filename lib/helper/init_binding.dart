import 'package:eco_app/controllers/cart_controller.dart';
import 'package:eco_app/controllers/productcontroller.dart';
import 'package:get/get.dart';

class InitDep implements Bindings {
  @override
  void dependencies(){
    Get.lazyPut(()=>ProductController());
   Get.lazyPut(()=>CartController());
  }
}