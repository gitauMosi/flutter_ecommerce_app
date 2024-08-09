import 'package:flutter/material.dart';


class ExploreBody extends StatelessWidget {
  const ExploreBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.white,
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (BuildContext context, int index){
          return exploreProductsItem();
        },
      ),
    );
  }
  Widget exploreProductsItem(){
    return  Container(
      width: double.maxFinite,
      height: 150,
      //color: Colors.white,
      margin: const EdgeInsets.only(bottom: 10, left: 2, right: 2),
      padding: const EdgeInsets.only(left: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.deepOrange.withOpacity(0.5)
      ),
      child: Row(
        
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset("assets/images/cr3.jpg", fit: BoxFit.cover, scale: 0.1,),
          ),
          const SizedBox(width: 10,),
        const Expanded(
           child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text("Name of the product",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22
                ),
                ),
                SizedBox(height: 15,),
                Text("\$ 3344",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 18
                ),
                )
              ],
            ),
         )
        ],
      ),
    
    );
  }
}