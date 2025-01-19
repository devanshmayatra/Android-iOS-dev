import 'package:apis_user_app/global_provider.dart';
import 'package:apis_user_app/material_app.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlobalProvider(
      child: MaterialAppWIdget(),
    );
  }
}
