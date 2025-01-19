import 'package:apis_user_app/models/user_details_model.dart';
import 'package:apis_user_app/widgets/change_theme_icon_button.dart';
import 'package:apis_user_app/widgets/user_primary_details.dart';
import 'package:apis_user_app/widgets/user_secondary_details.dart';
import 'package:flutter/material.dart';

class ViewUser extends StatelessWidget {
  ViewUser({super.key, required this.user});

  UserDetailsModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
        actions: [
          const ChangeThemeIconButton(),
          SizedBox(width: 16),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            UserPrimaryDetails(user: user),
            UserSecondaryDetails(user: user),
          ],
        ),
      ),
    );
  }
}
