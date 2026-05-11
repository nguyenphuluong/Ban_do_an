import 'package:flutter/material.dart';

import '../models/food.dart';
import '../screens/food_detail_screen.dart';

class FoodItem extends StatelessWidget {
  final Food food;

  const FoodItem({
    super.key,
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,

          MaterialPageRoute(
            builder: (_) =>
                FoodDetailScreen(food: food),
          ),
        );
      },

      child: Card(
        elevation: 4,

        margin: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),

        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(15),
        ),

        child: Padding(
          padding: const EdgeInsets.all(10),

          child: Row(
            children: [

              // =====================
              // IMAGE
              // =====================

              ClipRRect(
                borderRadius:
                BorderRadius.circular(12),

                child: Image.network(
                  food.image,

                  width: 100,
                  height: 100,

                  fit: BoxFit.cover,

                  errorBuilder:
                      (context, error, stackTrace) {
                    return Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey[300],

                      child: const Icon(
                        Icons.image,
                        size: 40,
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(width: 15),

              // =====================
              // INFO
              // =====================

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Text(
                      food.name,

                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      food.category,

                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      food.description,

                      maxLines: 2,
                      overflow:
                      TextOverflow.ellipsis,

                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "\$${food.price}",

                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight:
                        FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),

              // =====================
              // ICON
              // =====================

              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}