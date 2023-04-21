import 'package:flutter/material.dart';
import 'package:get_api_response/utils/CategoryProductList.dart';

import '../Model/Product.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key, required this.items});

  List<Product> items;

  @override
  _SearchPage createState() => _SearchPage(items: items);
}

class _SearchPage extends State<SearchPage> {
  _SearchPage({required this.items});

  final searchController = TextEditingController();

  // late Future<List<Product>> products;
  late List<Product> items;

  List<Product> itemsAfterSearch = [];

  @override
  void initState() {
    super.initState();
    itemsAfterSearch = items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: TextField(
              controller: searchController,
              onChanged: (text) {
                if (text.isEmpty) {
                  setState(() {
                    itemsAfterSearch = items;
                  });
                }
              },
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(5.0),
                  suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        onSearchClick();
                      }),
                  hintText: "Search...",
                  border: InputBorder.none),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: getSearchedList(),
        ),
      ),
    );
  }

  Widget getSearchedList() {
    return Center(
      child: itemsAfterSearch.isNotEmpty
          ? CategoryProductList(items: itemsAfterSearch)
          : CategoryProductList(items: items),
    );
  }

  void onSearchClick() {
    List<Product> searchList = [];
    if (searchController.value.text.isNotEmpty) {
      for (var item in items) {
        if (item.title!
            .toLowerCase()
            .startsWith(searchController.value.text.trim().toLowerCase())) {
          searchList.add(item);
        }
      }
    }
    setState(() {
      if (searchList.isEmpty) {
        itemsAfterSearch = [];
      } else {
        itemsAfterSearch = searchList;
      }
    });
  }
}
