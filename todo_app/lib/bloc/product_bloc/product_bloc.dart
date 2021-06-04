import 'package:todo_app/bloc/product_bloc/product_event.dart';
import 'package:todo_app/bloc/product_bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/models/product.dart';
import 'package:todo_app/data/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductsRepository productsRepository;

  ProductBloc(this.productsRepository) : super(ProductEmptyState());

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is ProductLoadEvent) {
      yield ProductLoadingState();
      try {
        final List<Product> _loadedUserList =
            await productsRepository.getAllProducts();
        yield ProductLoadedState(loadedProduct: _loadedUserList);
      } catch (_) {
        yield ProductErrorState();
      }
    } else if (event is ProductClearEvent) {
      yield ProductEmptyState();
    }
  }
}
