import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/cubits/home_cubit/home_cubit.dart';
import 'package:store_app/cubits/home_cubit/home_states.dart';
import 'package:store_app/models/product_model.dart';

import '../widgets/productWidget.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static String id = "HomeScreen";

  List<ProductModel> productList = [];

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).getProducts();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New Trend",
          style: TextStyle(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.cartShopping,
              color: Colors.black,
              size: 20,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomeSucsess) {
              productList = BlocProvider.of<HomeCubit>(context).productsList;
              return GridView.builder(
                clipBehavior: Clip.none,
                itemCount: productList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 50,
                ),
                itemBuilder: (context, index) {
                  return ProductWidget(
                    productInfo: productList[index],
                  );
                },
              );
            } else if (state is HomeFailed) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error,
                      size: 50,
                      color: Colors.red,
                    ),
                    Text(
                      'Failed TO Load Products',
                      style: TextStyle(fontSize: 30),
                    )
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
