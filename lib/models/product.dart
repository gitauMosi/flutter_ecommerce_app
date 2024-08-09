

class Product {
  String? id;
  String name, url;
  double price;
  String? description;
  
  
  
  Product({this.id = "0", required this.name, required this.url, required this.price, this.description});
     int _qty = 1;
    int get qty => _qty;
    // set qty  (value) => value;
    double currrentPrice = 0;

   // double get _price => price;

    void increaseQty(){
      _qty++;
    }
    void setCurrentPrice(double price){
      currrentPrice = price;
    }

    void decreaseqty(){
      if(_qty > 1){
         _qty--;
      }
    }
}