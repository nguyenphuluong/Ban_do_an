import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';
import '../providers/cart_provider.dart';
import '../services/api_service.dart';

import '../widgets/food_item.dart';

import 'cart_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {
  List<Food> foods = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    loadFoods();
  }

  Future<void> loadFoods() async {
    try {
      foods = await ApiService.getFoods();

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider =
    Provider.of<CartProvider>(context);

    return Scaffold(

      // =========================
      // APP BAR
      // =========================

      appBar: AppBar(
        title: const Text(
          "Food App",
        ),

        centerTitle: true,

        actions: [

          // =====================
          // CART BUTTON
          // =====================

          Stack(
            children: [

              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (_) =>
                      const CartScreen(),
                    ),
                  );
                },

                icon: const Icon(
                  Icons.shopping_cart,
                ),
              ),

              // =================
              // BADGE
              // =================

              if (cartProvider.totalItems > 0)

                Positioned(
                  right: 5,
                  top: 5,

                  child: Container(
                    padding:
                    const EdgeInsets.all(5),

                    decoration:
                    const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),

                    child: Text(
                      cartProvider.totalItems
                          .toString(),

                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),

      // =========================
      // DRAWER
      // =========================

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,

          children: [

            // =====================
            // HEADER
            // =====================

            const UserAccountsDrawerHeader(
              accountName:
              Text("Nguyen Luong"),

              accountEmail:
              Text("foodapp@gmail.com"),

              currentAccountPicture:
              CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 40,
                ),
              ),
            ),

            // =====================
            // HOME
            // =====================

            ListTile(
              leading:
              const Icon(Icons.home),

              title: const Text("Home"),

              onTap: () {
                Navigator.pop(context);
              },
            ),

            // =====================
            // CART
            // =====================

            ListTile(
              leading: const Icon(
                Icons.shopping_cart,
              ),

              title: const Text("Cart"),

              onTap: () {
                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (_) =>
                    const CartScreen(),
                  ),
                );
              },
            ),

            // =====================
            // LOGOUT
            // =====================

            ListTile(
              leading:
              const Icon(Icons.logout),

              title: const Text("Logout"),

              onTap: () {

                Navigator.pushReplacement(
                  context,

                  MaterialPageRoute(
                    builder: (_) =>
                    const LoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      // =========================
      // BODY
      // =========================

      body: isLoading

      // =====================
      // LOADING
      // =====================

          ? const Center(
        child:
        CircularProgressIndicator(),
      )

      // =====================
      // FOOD LIST
      // =====================

          : foods.isEmpty

          ? const Center(
        child: Text(
          "No foods found",
        ),
      )

          : RefreshIndicator(
        onRefresh: loadFoods,

        child: ListView.builder(
          padding:
          const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),

          itemCount: foods.length,

          itemBuilder:
              (context, index) {

            final food =
            foods[index];

            return FoodItem(
              food: food,
            );
          },
        ),
      ),
    );
  }
}