import 'package:flutter/foundation.dart';
import 'package:todo_app/data/models/product.dart';

abstract class ProductDetailState {}

class ProductDetailEmptyState extends ProductDetailState {}

class ProductNewLoadingState extends ProductDetailState {}

class ProductNewLoadedState extends ProductDetailState {
  dynamic loadedProduct;
  ProductNewLoadedState({@required this.loadedProduct})
      : assert(loadedProduct != null);
}

class ProductDetailErrorState extends ProductDetailState {}
