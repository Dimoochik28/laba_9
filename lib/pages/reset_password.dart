import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Змінити пароль"),
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
                    child: OutlinedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Email пройшов валідацію
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text('Успіх'),
                              content: Text(
                                  "Лист для зміни пароля буде надіслано на: ${emailController.text}"),
                            ),
                          );
                        }
                      },
                      child: const Text("Далі"),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12),
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
