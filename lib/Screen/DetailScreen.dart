import 'package:flutter/material.dart';

import '../Model/Product.dart';

class DetailScreen extends StatelessWidget {
  final Product product;

  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(12),
              height: 150,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(product.image!),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${product.title}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${product.description}",
                      maxLines: 12,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Price : ₹ ${product.price}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Rating : ${product.rating!.rate!} / 5",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
