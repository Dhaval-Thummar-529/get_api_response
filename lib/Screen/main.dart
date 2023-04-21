import 'package:flutter/material.dart';
import 'package:get_api_response/Screen/SearchPage.dart';
import '../Model/Product.dart';
import '../Services/Api.dart';
import '../utils/ProductBoxList.dart';

void main() {
  runApp(MainApp(products: Api().fetchProducts()));
}

class MainApp extends StatelessWidget {
  final Future<List<Product>> products;

  MainApp({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Online Store",
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      debugShowCheckedModeBanner: false,
      home: _ApiResponseApp(
        products: products,
      ),
    );
  }
}

class _ApiResponseApp extends StatelessWidget {
  final Future<List<Product>> products;
  List<Product> items = [];

  _ApiResponseApp({required this.products});

  void convertList() async {
    items = await products;
  }

  @override
  Widget build(BuildContext context) {
    convertList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Online Store"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SearchPage(items: items)));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: SafeArea(
        child: Center(
          child: FutureBuilder<List<Product>>(
            future: products,
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? ProductBoxList(items: snapshot.data!)
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ),
      ),
    );
  }
}
