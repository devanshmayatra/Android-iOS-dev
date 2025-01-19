import 'package:apis_user_app/models/user_details_model.dart';
import 'package:flutter/material.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({super.key, required this.user, required this.index});

  final UserDetailsModel user;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 30,
          child: Image.network(user.image),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            '${user.firstName} ${user.lastName}',
          ),
        )
      ],
    );
  }
}
