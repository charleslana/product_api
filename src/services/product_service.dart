import '../data/data.dart';
import '../models/dto/product_dto.dart';
import '../models/product_model.dart';

class ProductService {
  Future<List<ProductModel>> findAll() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    final List<ProductModel> all = products.map(ProductModel.fromMap).toList();
    return all;
  }

  Future<ProductModel> find(int id) async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    final List<ProductModel> all = products.map(ProductModel.fromMap).toList();
    final ProductModel product = all.firstWhere((product) => product.id == id);
    return product;
  }

  Future<ProductModel> create(ProductDto dto) async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    dto = dto.copyWith(id: 8372);
    final Map<String, dynamic> product = dto.toMap();
    products.add(product);
    return ProductModel.fromMap(product);
  }

  Future<ProductModel> update(ProductDto dto) async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    final Map<String, dynamic> product = dto.toMap();
    final List<ProductModel> all = products.map(ProductModel.fromMap).toList();
    products[all.indexWhere((product) => product.id == dto.id)] = product;
    return ProductModel.fromMap(product);
  }

  Future<void> delete(int id) async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    final List<ProductModel> all = products.map(ProductModel.fromMap).toList();
    final int productIndex = all.indexWhere((product) => product.id == id);
    products.removeAt(productIndex);
  }
}
