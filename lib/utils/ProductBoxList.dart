import 'package:flutter/material.dart';

import '../Model/Product.dart';
import 'CategoryProductList.dart';

class ProductBoxList extends StatefulWidget {
  final List<Product> items;

  ProductBoxList({super.key,required this.items});

  @override
  _ProductBoxList createState() => _ProductBoxList(items: items);
}

class _ProductBoxList extends State<ProductBoxList> {
  final List<Product> items;

  _ProductBoxList({required this.items});

  List<String> uniqueCategories = [];

  void getCategories() {
    List<String> categories = <String>[];
    for (var item in items) {
      categories.add(item.category!);
    }
    var seen = <String>{};
    uniqueCategories =
        categories.where((element) => seen.add(element)).toList();
  }

  @override
  void initState() {
    getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: uniqueCategories.length + 1,
      child: Scaffold(
        appBar: TabBar(
          isScrollable: true,
          padding: const EdgeInsets.all(5),
          indicator: BoxDecoration(
            border: Border.all(color: Colors.black54, width: 1.0),
            borderRadius: BorderRadius.circular(50),
            color: Colors.lightBlue.withOpacity(0.5),
          ),
          tabs: [
            const Tab(child: Text("All")),
            for (int i = 0; i < uniqueCategories.length; i++)
              Tab(
                child: Text(
                  uniqueCategories[i],
                ),
              ),
          ],
        ),
        body: TabBarView(
          children: [
            CategoryProductList(items: items),
            for (int i = 0; i < uniqueCategories.length; i++)
              CategoryProductList(
                  items: getFilteredProductLists(uniqueCategories[i])),
          ],
        ),
      ),
    );
  }

  getFilteredProductLists(String category) {
    List<Product> filteredList = [];
    for (var item in items) {
      if (item.category == category) {
        filteredList.add(item);
      }
    }
    return filteredList;
  }
}
