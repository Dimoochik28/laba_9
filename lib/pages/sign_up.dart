import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Реєстрація"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Image.asset('assets/Image/Flutter.png', width: 150, height: 150),

                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Ім'я",
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Поле не може бути порожнім";
                        }
                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email не може бути порожнім";
                        }
                        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                        if (!emailRegex.hasMatch(value)) {
                          return "Введіть коректний email";
                        }
                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Пароль",
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Пароль не може бути порожнім";
                        }
                        if (value.length < 8) {
                          return "Пароль має бути мінімум 8 символів";
                        }
                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: OutlinedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text('Успіх'),
                              content: Text(
                                  "Ім'я: ${nameController.text}\nEmail: ${emailController.text}\nПароль: ${passwordController.text}"),
                            ),
                          );
                        }
                      },
                      child: const Text("Зареєструватись"),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Назад"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
