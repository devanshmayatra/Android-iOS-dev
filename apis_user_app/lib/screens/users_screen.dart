import 'package:apis_user_app/service/fetch_api.dart';
import 'package:apis_user_app/view_models/users_view_model.dart';
import 'package:apis_user_app/widgets/change_theme_icon_button.dart';
import 'package:apis_user_app/widgets/filter_chip_widget.dart';
import 'package:apis_user_app/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatefulWidget {
  UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  FetchApi service = FetchApi();

  @override
  void initState() {
    super.initState();
    context.read<UsersViewModel>().getUsers("all users");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Users"),
        actions: [
          const ChangeThemeIconButton(),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilterChipWidget(
                tag: "All Users",
                selector: "All Users",
              ),
              SizedBox(
                width: 20,
              ),
              FilterChipWidget(
                tag: "Male",
                selector: "Male",
              ),
              SizedBox(
                width: 20,
              ),
              FilterChipWidget(
                tag: "Female",
                selector: "Female",
              ),
            ],
          ),
          UserList(),
        ],
      ),
    );
  }
}
