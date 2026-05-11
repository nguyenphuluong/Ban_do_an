import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() =>
      _RegisterScreenState();
}

class _RegisterScreenState
    extends State<RegisterScreen> {
  final usernameController =
  TextEditingController();

  final passwordController =
  TextEditingController();

  bool isLoading = false;

  Future<void> register() async {
    setState(() {
      isLoading = true;
    });

    try {
      final result =
      await AuthService.register(
        usernameController.text,
        passwordController.text,
      );

      if (result['success']) {
        ScaffoldMessenger.of(context)
            .showSnackBar(
          const SnackBar(
            content:
            Text("Register Success"),
          ),
        );

        Navigator.pop(context);
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
      appBar: AppBar(
        title: const Text("Register"),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding:
            const EdgeInsets.all(20),

            child: Card(
              elevation: 8,

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
                      Icons.person_add,
                      size: 80,
                      color: Colors.orange,
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    const Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 28,
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
                            : register,

                        child: isLoading
                            ? const CircularProgressIndicator(
                          color: Colors
                              .white,
                        )
                            : const Text(
                          "REGISTER",
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}