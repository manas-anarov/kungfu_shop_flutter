import 'package:todo_app/presentation/widgets/products/product_detail.dart';

import 'package:todo_app/data/product_repository.dart';

import 'package:flutter/material.dart';

class ProductsNewPage extends StatelessWidget {
  final productsRepository = ProductsRepository();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Users List'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(child: ProductDetail()),
          ],
        ),
      ),
    );
  }
}
