import 'package:flutter/foundation.dart';

abstract class ProductState {}

class ProductEmptyState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  List<dynamic> loadedProduct;
  ProductLoadedState({@required this.loadedProduct})
      : assert(loadedProduct != null);
}

class ProductErrorState extends ProductState {}
