import 'package:apis_user_app/view_models/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GlobalProvider extends StatelessWidget {
  const GlobalProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeViewModel(),
      child: child,
    );
  }
}
