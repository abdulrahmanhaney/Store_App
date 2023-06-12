import '../helper/api.dart';
import '../models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct({
    required String title,
    required String price,
    required dynamic id,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
    );
    return ProductModel.fromJson(data);
  }
}
