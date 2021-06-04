import 'package:todo_app/presentation/widgets/action_buttons.dart';
import 'package:todo_app/presentation/widgets/product_list.dart';

import 'package:todo_app/data/product_repository.dart';

import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
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
            ActionButtons(),
            Expanded(child: UserList()),
          ],
        ),
      ),
    );
  }
}
