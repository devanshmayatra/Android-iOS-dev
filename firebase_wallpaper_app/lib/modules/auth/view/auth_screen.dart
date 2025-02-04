import 'package:firebase_wallpaper_app/modules/auth/view_model/auth_view_model.dart';
import 'package:firebase_wallpaper_app/modules/theme/view_model/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModel = context.watch<AuthViewModel>();

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 28,
            top: 10,
            right: 28,
            bottom: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Login to continue',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                "Email",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Enter your Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                "Password",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Enter your Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.watch<ThemeViewModel>().isDarkMode
                      ? Colors.white
                      : Colors.black,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  authViewModel.loginWithEmailAndPassword(
                    emailController.text,
                    passwordController.text,
                  );
                  Navigator.pop(context);
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: context.watch<ThemeViewModel>().isDarkMode
                        ? Colors.black
                        : Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: context.watch<ThemeViewModel>().isDarkMode
                          ? const Color.fromARGB(255, 134, 134, 134)
                          : const Color.fromARGB(255, 52, 52, 52),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "OR",
                      style: TextStyle(
                        color: context.watch<ThemeViewModel>().isDarkMode
                            ? const Color.fromARGB(255, 134, 134, 134)
                            : const Color.fromARGB(255, 52, 52, 52),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: context.watch<ThemeViewModel>().isDarkMode
                          ? const Color.fromARGB(255, 134, 134, 134)
                          : const Color.fromARGB(255, 52, 52, 52),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.watch<ThemeViewModel>().isDarkMode
                      ? Colors.black
                      : Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  authViewModel.loginWithGoogleClickEvent();
                  // if (authViewModel.isAuthenticatied) {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/google_icon.png',
                      height: 24.0,
                      width: 24.0,
                    ),
                    const SizedBox(width: 12.0),
                    Text(
                      'Continue with Google',
                      style: TextStyle(
                        color: context.watch<ThemeViewModel>().isDarkMode
                            ? Colors.white
                            : Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
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

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}



// SingleChildScrollView(
//         child: Container(
//           decoration: BoxDecoration(),
//           child: Center(
//             child: Column(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(),
//                   margin: const EdgeInsets.all(20),
//                   width: 240,
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 50,
//                       ),
//                       SizedBox(
//                         height: 50,
//                         child: TextField(
//                           controller: emailController,
//                           decoration: const InputDecoration(
//                             labelText: "Enter your Username",
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       SizedBox(
//                         height: 50,
//                         child: TextField(
//                           controller: passwordController,
//                           decoration: const InputDecoration(
//                             labelText: "Enter your Password",
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           authViewModel.loginWithEmailAndPassword(
//                             emailController.text,
//                             passwordController.text,
//                           );
//                         },
//                         child: const Text('Login with email'),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (_) {
//                                 return ChangeNotifierProvider.value(
//                                   value: authViewModel,
//                                   child: RegisterScreen(),
//                                 );
//                               },
//                             ),
//                           );
//                         },
//                         child: Column(
//                           children: [
//                             Text(
//                               "Do not have an Account ?",
//                               textAlign: TextAlign.center,
//                             ),
//                             Text(
//                               " Click here to  Create one !",
//                               textAlign: TextAlign.center,
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 80,
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           authViewModel.loginWithGoogleClickEvent();
//                         },
//                         child: const Text('Continue with Google'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),