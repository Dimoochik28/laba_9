import 'package:flutter/material.dart';
import 'package:laba_8/pages/sign_up.dart';
import 'package:laba_8/pages/reset_password.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("Вітаємо в застосунку"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/Image/Flutter.png', width: 150, height: 150),

                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Ваш email',
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
                        labelText: 'Пароль',
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 180,
                        height: 32,
                        child: OutlinedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {

                              showDialog(
                                context: context,
                                builder: (ctx) {
                                  return AlertDialog(
                                    title: Text('Message'),
                                    content: Text(
                                        "Email: ${emailController.text}\nПароль: ${passwordController.text}"),
                                  );
                                },
                              );
                            }
                          },
                          child: Text("Увійти"),
                        ),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: 180,
                        height: 32,
                        child: OutlinedButton(
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                            )
                          },
                          child: Text("Зареєструватись"),
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: OutlinedButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResetPasswordScreen(),
                          ),
                        )
                      },
                      child: Text("Змінити пароль"),
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