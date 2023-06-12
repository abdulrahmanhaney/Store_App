import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/updateProductScreen.dart';

// ignore: must_be_immutable
class ProductWidget extends StatelessWidget {
  ProductWidget({super.key, required this.productInfo});

  ProductModel productInfo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          UpdateProductScreen.id,
          arguments: productInfo,
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            child: Card(
              color: Colors.white,
              elevation: 5,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productInfo.title.length > 15
                          ? productInfo.title.substring(0, 15)
                          : productInfo.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'MyFont-Medium',
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${productInfo.price}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'MyFont-Bold',
                          ),
                        ),
                        const Icon(
                          Icons.favorite,
                          size: 20,
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 105,
            bottom: 65,
            right: 20,
            child: Image.network(
              productInfo.image,
              height: 100,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
