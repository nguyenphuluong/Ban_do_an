import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import 'payment_success_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider =
    Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        centerTitle: true,
      ),

      body: cartProvider.cartItems.isEmpty
          ? const Center(
        child: Text(
          "Cart is empty",
          style: TextStyle(
            fontSize: 22,
            fontWeight:
            FontWeight.bold,
          ),
        ),
      )

          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider
                  .cartItems.length,

              itemBuilder:
                  (context, index) {
                final item =
                cartProvider
                    .cartItems[
                index];

                return Card(
                  margin:
                  const EdgeInsets
                      .all(10),

                  elevation: 5,

                  shape:
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius
                        .circular(
                      15,
                    ),
                  ),

                  child: Padding(
                    padding:
                    const EdgeInsets
                        .all(10),

                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius:
                          BorderRadius
                              .circular(
                            10,
                          ),

                          child:
                          Image.network(
                            item.food
                                .image,

                            width: 90,
                            height:
                            90,

                            fit: BoxFit
                                .cover,
                          ),
                        ),

                        const SizedBox(
                          width: 15,
                        ),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                            children: [
                              Text(
                                item.food
                                    .name,

                                style:
                                const TextStyle(
                                  fontSize:
                                  20,

                                  fontWeight:
                                  FontWeight
                                      .bold,
                                ),
                              ),

                              const SizedBox(
                                height:
                                8,
                              ),

                              Text(
                                "\$${item.food.price}",

                                style:
                                const TextStyle(
                                  fontSize:
                                  18,

                                  color:
                                  Colors.red,

                                  fontWeight:
                                  FontWeight
                                      .bold,
                                ),
                              ),

                              const SizedBox(
                                height:
                                10,
                              ),

                              Row(
                                children: [
                                  IconButton(
                                    onPressed:
                                        () {
                                      cartProvider.decreaseQuantity(
                                        item,
                                      );
                                    },

                                    icon:
                                    const Icon(
                                      Icons
                                          .remove_circle,

                                      color:
                                      Colors.red,
                                    ),
                                  ),

                                  Text(
                                    item
                                        .quantity
                                        .toString(),

                                    style:
                                    const TextStyle(
                                      fontSize:
                                      18,

                                      fontWeight:
                                      FontWeight.bold,
                                    ),
                                  ),

                                  IconButton(
                                    onPressed:
                                        () {
                                      cartProvider.increaseQuantity(
                                        item,
                                      );
                                    },

                                    icon:
                                    const Icon(
                                      Icons
                                          .add_circle,

                                      color:
                                      Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            padding:
            const EdgeInsets.all(
              20,
            ),

            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,

                  children: [
                    const Text(
                      "Total",

                      style: TextStyle(
                        fontSize: 24,
                        fontWeight:
                        FontWeight
                            .bold,
                      ),
                    ),

                    Text(
                      "\$${cartProvider.totalPrice.toStringAsFixed(2)}",

                      style:
                      const TextStyle(
                        fontSize: 24,
                        fontWeight:
                        FontWeight
                            .bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),

                SizedBox(
                  width:
                  double.infinity,
                  height: 55,

                  child:
                  ElevatedButton(
                    style:
                    ElevatedButton.styleFrom(
                      backgroundColor:
                      Colors.orange,
                    ),

                    onPressed: () {
                      cartProvider
                          .clearCart();

                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (_) =>
                          const PaymentSuccessScreen(),
                        ),
                      );
                    },

                    child: Text(
                      "Proceed To Pay (${cartProvider.totalItems})",

                      style:
                      const TextStyle(
                        fontSize: 18,
                        color:
                        Colors.white,
                        fontWeight:
                        FontWeight
                            .bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}