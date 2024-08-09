import 'package:flutter/material.dart';

class ConfirmOrderPage extends StatelessWidget {
  const ConfirmOrderPage({super.key});
  final String adress = "Amos git";
  final String phone = "254115088899";
  final double total = 500;
  final double delivery = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Confirm Order"),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context){
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0, bottom: 10.0),
      child: Column(
        children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text("Subtotal"),
                  Text("RS. $total"),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Delivery fee"),
                  Text("Rs. $delivery")
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: Theme.of(context).textTheme.titleLarge,),
                  Text("Rs. ${total + delivery}", style: Theme.of(context).textTheme.titleLarge,)
                ],
              ),
              const SizedBox(height: 20.0,),
              Container(
                color: Colors.grey.shade200,
                padding: const EdgeInsets.all(8.0),
                width: double.infinity,
                child: Text("Delivery Address".toUpperCase()),
              ),
              Column(
                children: [
                  RadioListTile(
                    value: adress,
                    selected: true, 
                    groupValue: adress, 
                    onChanged: (value){}),
                  RadioListTile(
                    value: "New Adress",
                    selected: false, 
                    title: const Text("Choose new delivery address"),
                    groupValue: adress, 
                    onChanged: (value){}),
                  Container(
                    color: Colors.grey.shade200,
                    padding: const EdgeInsets.all(8.0),
                    width: double.infinity,
                    child: Text("Conatact Number".toUpperCase()),
                  ),
                  RadioListTile(
                    value: phone,
                    selected: true, 
                    groupValue: phone, 
                    title: const Text("Choose new contact number"),
                    onChanged: (value){}),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                color: Colors.grey.shade200,
                padding: const EdgeInsets.all(8.0),
                width: double.infinity,
                child: Text("Payment Option".toUpperCase()),
              ),
              RadioListTile(
                    value: true,
                    selected: false, 
                    groupValue: true, 
                    title: const Text("Cash On Delivery"),
                    onChanged: (value){}),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){}, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor
                  ),
                  child: const Text("Pay", style: TextStyle(color: Colors.white),)),
              )
        ],
      ),
      
    );
  }

  
}