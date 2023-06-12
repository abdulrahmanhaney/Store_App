import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/cubits/update_cubit/update_cubit.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/customTextField.dart';

// ignore: must_be_immutable
class UpdateProductScreen extends StatefulWidget {
  static String id = "UpdateProductScreen";

  const UpdateProductScreen({super.key});

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productTitle;

  String? description;

  dynamic price;

  String? image;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ProductModel productInfo =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    productTitle = productInfo.title;
    description = productInfo.description;
    price = productInfo.price;
    image = productInfo.image;
    bool loading = false;

    return BlocConsumer<UpdateCubit, UpdateState>(
      listener: (context, state) {
        if (state is UpdateLoading) {
          loading = true;
        } else if (state is UpdateSucsess) {
          loading = false;
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Update Product Sucsess")));
        } else if (state is UpdateFailed) {
          loading = false;
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Failed To Update This Product")));
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: loading,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Update Product"),
              backgroundColor: Colors.transparent,
            ),
            body: Form(
              key: formkey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextField(
                      hint: 'Product Title',
                      text: productInfo.title,
                      onChanged: (value) {
                        productTitle = value;
                      },
                    ),
                    CustomTextField(
                      hint: 'Product Description',
                      text: productInfo.description,
                      onChanged: (value) {
                        description = value;
                      },
                    ),
                    CustomTextField(
                      hint: 'Product Price',
                      text: '${productInfo.price}',
                      textType: TextInputType.number,
                      onChanged: (value) {
                        price = value;
                      },
                    ),
                    CustomTextField(
                      hint: 'Product Image Link',
                      textType: TextInputType.url,
                      text: productInfo.image,
                      onChanged: (value) {
                        image = value;
                      },
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 20, left: 20, top: 50),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(400, 50),
                          backgroundColor: const Color.fromARGB(186, 0, 0, 0),
                        ),
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            BlocProvider.of<UpdateCubit>(context).updateProduct(
                              product: productInfo,
                              productTitle: productTitle!,
                              price: price.toString(),
                              description: description!,
                              image: image!,
                            );
                          } else {}
                        },
                        child: const Text(
                          "Update Product",
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
