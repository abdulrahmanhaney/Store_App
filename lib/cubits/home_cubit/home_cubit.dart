import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/models/product_model.dart';
import '../../services/all_products_service.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<ProductModel> productsList = [];

  Future<void> getProducts() async {
    try {
      emit(HomeLoading());
      List<ProductModel> products = await AllProductsService().getAllProducts();
      productsList.clear();
      for (var product in products) {
        productsList.add(product);
      }
      emit(HomeSucsess());
    } catch (e) {
      emit(HomeFailed());
    }
  }
}
