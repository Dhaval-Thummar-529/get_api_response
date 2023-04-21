import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screen/DetailScreen.dart';
import '../Model/Product.dart';
import 'ProductBox.dart';

class CategoryProductList extends StatelessWidget {
  final List<Product> items;

  const CategoryProductList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus!.unfocus();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(product: items[index]),
                ),
              );
            },
            child: ProductBox(item: items[index]),
          );
        });
  }
}
