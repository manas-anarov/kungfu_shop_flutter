// import 'package:bloc_network_example/bloc/user_bloc.dart';
// import 'package:todo_app/bloc/post_bloc/post_event.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/product_bloc/product_bloc.dart';
import 'package:todo_app/bloc/product_bloc/product_event.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductBloc userBloc = BlocProvider.of<ProductBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RaisedButton(
          child: Text('Load'),
          onPressed: () {
            userBloc.add(ProductLoadEvent());
          },
          color: Colors.green,
        ),
        SizedBox(width: 8.0),
        RaisedButton(
          child: Text('Clear'),
          onPressed: () {
            userBloc.add(ProductClearEvent());
          },
          color: Colors.red,
        ),
      ],
    );
  }
}
