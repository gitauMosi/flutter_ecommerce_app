import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          size: 20
        ),
      ),
      body: Column(
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 8, top: 5, right: 8),
                width: double.infinity,
                child: TextField(
                  controller: searchController,
                  style: const TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                      hintText: " Search",
                      hoverColor: Colors.blue,
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 15,
                      ),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            searchController.text = '';
                          },
                          child: const Icon(
                            Icons.cancel_outlined,
                            size: 15,
                          )),
                      contentPadding: const EdgeInsets.all(0),
                      border: OutlineInputBorder(
                          gapPadding: 0,
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              const SizedBox(
                height: 23,
              ),
              
            ],
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text("Search products"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
