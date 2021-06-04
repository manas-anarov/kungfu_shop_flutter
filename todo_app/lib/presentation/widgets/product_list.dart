import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/product_bloc/product_bloc.dart';
import 'package:todo_app/bloc/product_bloc/product_state.dart';
import 'package:todo_app/constants/strings.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductEmptyState) {
          return Center(
            child: Text(
              'No data received. Press button "Load"',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }

        if (state is ProductLoadingState) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is ProductLoadedState) {
          return ListView.builder(
            itemCount: state.loadedProduct.length,
            itemBuilder: (context, index) => Container(
              color: index % 2 == 0 ? Colors.white : Colors.blue[50],
              child: ListTile(
                onTap: () {
                  // Navigator.pushNamed(context, DETAIL_PRODUCT_ROUTE);
                  Navigator.pushNamed(context, DETAIL_PRODUCT_ROUTE,
                      arguments: state.loadedProduct[index].slug);
                },
                leading: Text(
                  'ID: ${state.loadedProduct[index].id}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                title: Column(
                  children: <Widget>[
                    Text(
                      '${state.loadedProduct[index].title}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Email: ${state.loadedProduct[index].desc}',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        Text(
                          'Phone: ${state.loadedProduct[index].desc}',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        Image.network('${state.loadedProduct[index].image}'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        if (state is ProductErrorState) {
          return Center(
            child: Text(
              'Error fetching users',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
        return null;
      },
    );
  }
}
