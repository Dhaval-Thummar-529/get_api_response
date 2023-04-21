import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_api_response/Model/Product.dart';

class ProductBox extends StatelessWidget {
  ProductBox({super.key, required this.item});

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      height: 150,
      child: Card(
        elevation: 6,
        color: Colors.lightBlue.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.30,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(item.image!),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "${item.title}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "${item.description}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "₹ ${item.price}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "${item.rating!.rate!} / 5",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
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
