import 'dart:ui';

class OrderItem {
  final String? title;
  final int? qty;
  final double? price;
  final String? image;
  final Color? bgColor;
  
  OrderItem({
    this.qty,
    this.price,
    this.image,
    this.bgColor,
    this.title,
  });
}