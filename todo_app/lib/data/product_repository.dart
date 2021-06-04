import 'package:todo_app/data/models/product.dart';
import 'package:todo_app/data/product_api_provider.dart';

class ProductsRepository {
  final ProductProvider pruductsProvider;

  ProductsRepository({this.pruductsProvider});

  Future<List<Product>> getAllProducts() => pruductsProvider.getProduct();

  Future<Product> getDetailProduct(String product_slug) =>
      pruductsProvider.getProductDetail(product_slug);
}
