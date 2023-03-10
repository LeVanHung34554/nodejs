import 'package:flutter/material.dart';
import 'package:nodejs/common/widgets/stars.dart';

import '../../../model/product.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;

  const SearchedProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalRating = 0;
    for (int i = 0; i < product.rating!.length; i++) {
      totalRating += product.rating![i].rating;
    }
    double avgRating = 0;
    if (totalRating != 0) {
      avgRating = totalRating / product.rating!.length;
    }
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Image.network(product.images[0],
                  fit: BoxFit.contain, width: 135, height: 135),
              Column(children: [
                Container(
                  width: 235,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    product.name,
                    style: TextStyle(fontSize: 16),
                    maxLines: 2,
                  ),
                ),
                Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Stars(
                      rating: 3,
                    )),
                Container(
                    width: 235,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Eligible for Free shipping",
                    )),
                Container(
                  width: 235,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    '\$${product.price}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                ),
                Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Stars(
                      rating: avgRating,
                    )),
                Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text(
                      'Eligible for free Shipping',
                    )),
                Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: const Text('In Stock',
                        style: const TextStyle(color: Colors.teal))),
              ])
            ],
          ),
        )
      ],
    );
  }
}
