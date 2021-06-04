import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/products/detail/product_detail_bloc.dart';
import 'package:todo_app/bloc/products/detail/product_detail_event.dart';
import 'package:todo_app/bloc/products/detail/product_detail_state.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductDetailBloc userBloc =
        BlocProvider.of<ProductDetailBloc>(context);

    userBloc.add(ProductDetailLoadEvent());

    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (context, state) {
        if (state is ProductDetailEmptyState) {
          return Center(
            child: Text(
              'No data received. Press button "Load"',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }

        if (state is ProductNewLoadingState) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is ProductNewLoadedState) {
          return Column(
            // child: Text(
            //   '${state.loadedProduct.title}',
            //   style: TextStyle(fontSize: 20.0),
            // ),
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '${state.loadedProduct.title}',
                style: TextStyle(fontSize: 20.0),
              ),
              Image.network('${state.loadedProduct.image}'),
              Text(
                '${state.loadedProduct.price} \$',
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          );
        }

        if (state is ProductDetailErrorState) {
          return Center(
            child: Text(
              'Error fetching NEws',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
        return null;
      },
    );
  }
}
