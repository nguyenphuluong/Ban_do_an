import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import 'home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {
  final usernameController =
  TextEditingController();

  final passwordController =
  TextEditingController();

  bool isLoading = false;

  Future<void> login() async {
    setState(() {
      isLoading = true;
    });

    try {
      final result = await AuthService.login(
        usernameController.text,
        passwordController.text,
      );

      if (result['success']) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) =>
            const HomeScreen(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(
          SnackBar(
            content: Text(
              result['message'],
            ),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orange,
              Colors.deepOrange,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding:
              const EdgeInsets.all(20),

              child: Card(
                elevation: 10,

                shape:
                RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(
                    20,
                  ),
                ),

                child: Padding(
                  padding:
                  const EdgeInsets.all(
                    25,
                  ),

                  child: Column(
                    mainAxisSize:
                    MainAxisSize.min,

                    children: [
                      const Icon(
                        Icons.fastfood,
                        size: 80,
                        color: Colors.orange,
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      const Text(
                        "Food App",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      TextField(
                        controller:
                        usernameController,

                        decoration:
                        InputDecoration(
                          labelText:
                          "Username",

                          prefixIcon:
                          const Icon(
                            Icons.person,
                          ),

                          border:
                          OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(
                              12,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      TextField(
                        controller:
                        passwordController,

                        obscureText: true,

                        decoration:
                        InputDecoration(
                          labelText:
                          "Password",

                          prefixIcon:
                          const Icon(
                            Icons.lock,
                          ),

                          border:
                          OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(
                              12,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 30,
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

                            shape:
                            RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(
                                12,
                              ),
                            ),
                          ),

                          onPressed:
                          isLoading
                              ? null
                              : login,

                          child: isLoading
                              ? const CircularProgressIndicator(
                            color: Colors
                                .white,
                          )
                              : const Text(
                            "LOGIN",
                            style:
                            TextStyle(
                              fontSize:
                              18,
                              color: Colors
                                  .white,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                              const RegisterScreen(),
                            ),
                          );
                        },

                        child: const Text(
                          "Create New Account",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}