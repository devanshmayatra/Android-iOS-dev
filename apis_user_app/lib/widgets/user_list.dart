import 'package:apis_user_app/view_models/users_view_model.dart';
import 'package:apis_user_app/widgets/user_list_tile.dart';
import 'package:apis_user_app/screens/view_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    final usersViewModel = context.watch<UsersViewModel>();
    return Container(
      child: usersViewModel.users.isEmpty
          ? Center(child: Text("No Users"))
          : Expanded(
              child: ListView.separated(
                itemCount: usersViewModel.users.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemBuilder: (context, index) {
                  final user = usersViewModel.users[index];
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return ChangeNotifierProvider.value(
                              value: usersViewModel,
                              child: ViewUser(user: user),
                            );
                          },
                        ),
                      );
                    },
                    title: UserListTile(
                      user: user,
                      index: index,
                    ),
                  );
                },
              ),
            ),
    );
  }
}
