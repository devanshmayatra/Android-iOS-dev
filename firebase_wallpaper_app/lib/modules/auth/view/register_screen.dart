import 'package:firebase_wallpaper_app/modules/auth/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register User"),
      ),
      body: Container(
        decoration: BoxDecoration(),
        child: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(),
                margin: const EdgeInsets.all(20),
                width: 240,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                          labelText: "Enter your Username",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          labelText: "Enter your Password",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<AuthViewModel>()
                            .signupWithEmailPasswordEvent(
                              usernameController.text,
                              passwordController.text,
                            );
                        if (usernameController.text != "" &&
                            passwordController.text != "" &&
                            context.watch<AuthViewModel>().error.isEmpty) {
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Signup with email'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
