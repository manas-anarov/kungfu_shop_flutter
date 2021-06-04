// import 'package:todo_app/bloc/product_bloc/product_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/products/detail/product_detail_event.dart';
import 'package:todo_app/bloc/products/detail/product_detail_state.dart';
import 'package:todo_app/data/models/product.dart';
import 'package:todo_app/data/product_repository.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final String product_slug;

  final ProductsRepository productsRepository;

  ProductDetailBloc(this.productsRepository, this.product_slug)
      : super(ProductDetailEmptyState());

  @override
  Stream<ProductDetailState> mapEventToState(ProductDetailEvent event) async* {
    if (event is ProductDetailLoadEvent) {
      yield ProductNewLoadingState();
      try {
        final Product _loadedUserList =
            await productsRepository.getDetailProduct(product_slug);
        yield ProductNewLoadedState(loadedProduct: _loadedUserList);
      } catch (_) {
        yield ProductDetailErrorState();
      }
    }
  }
}
