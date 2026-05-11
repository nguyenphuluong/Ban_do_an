import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/food.dart';
import '../providers/cart_provider.dart';

class FoodDetailScreen extends StatelessWidget {
  final Food food;

  const FoodDetailScreen({
    super.key,
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider =
    Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(food.name),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [
            Image.network(
              food.image,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [
                  Text(
                    food.name,

                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    food.category,

                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    food.description,

                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "\$${food.price}",

                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight:
                      FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 50,

                    child: ElevatedButton(
                      onPressed: () {
                        cartProvider
                            .addToCart(food);

                        ScaffoldMessenger.of(
                            context)
                            .showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Added to cart",
                            ),
                          ),
                        );
                      },

                      child: const Text(
                        "ADD TO CART",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}