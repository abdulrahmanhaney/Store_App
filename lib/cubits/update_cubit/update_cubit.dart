import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/product_model.dart';
import '../../services/update_product.dart';
part 'update_state.dart';

class UpdateCubit extends Cubit<UpdateState> {
  UpdateCubit() : super(UpdateInitial());

  Future<void> updateProduct({
    required ProductModel product,
    required String productTitle,
    required String price,
    required String description,
    required String image,
  }) async {
    try {
      emit(UpdateLoading());
      await UpdateProductService().updateProduct(
        title: productTitle,
        price: price.toString(),
        description: description,
        image: image,
        category: product.category,
        id: product.id,
      );
      Future.delayed(
        const Duration(seconds: 3),
        () {
          emit(UpdateSucsess());
        },
      );
    } catch (e) {
      emit(UpdateFailed());
    }
  }
}
