import 'package:firebase_wallpaper_app/modules/auth/view/widgets/login_field.dart';
import 'package:firebase_wallpaper_app/modules/auth/view_model/auth_view_model.dart';
import 'package:firebase_wallpaper_app/modules/register/view/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                              .loginWithEmailAndPassword(
                                usernameController.text,
                                passwordController.text,
                              );
                        },
                        child: const Text('Login with email'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) {
                                return ChangeNotifierProvider.value(
                                  value: context.read<AuthViewModel>(),
                                  child: RegisterScreen(),
                                );
                              },
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Text(
                              "Do not have an Account ?",
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              " Click here to  Create one !",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<AuthViewModel>()
                              .loginWithGoogleClickEvent();
                        },
                        child: const Text('Continue with Google'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// Center(
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 context.read<AuthViewModel>().loginWithGoogleClickEvent();
//               },
//               child: const Text('Login with google'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 context.read<AuthViewModel>().signupWithEmailPasswordEvent(
//                     "devansh@gmail.com", "Devansh@1");
//               },
//               child: const Text('Sign in with email'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 context.read<AuthViewModel>().loginWithEmailAndPassword(
//                     "devansh@gmail.com", "Devansh@1");
//               },
//               child: const Text('Login with email'),
//             ),
//           ],
//         ),
//       ),