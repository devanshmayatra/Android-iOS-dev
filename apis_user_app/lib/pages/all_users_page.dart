import 'package:apis_user_app/screens/users_screen.dart';
import 'package:apis_user_app/view_models/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllUsersPage extends StatelessWidget {
  const AllUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UsersViewModel(),
      child: UsersScreen(),
    );
  }
}
