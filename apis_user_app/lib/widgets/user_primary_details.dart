import 'package:apis_user_app/models/user_details_model.dart';
import 'package:flutter/material.dart';

class UserPrimaryDetails extends StatelessWidget {
  const UserPrimaryDetails({
    super.key,
    required this.user,
  });

  final UserDetailsModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        height: 180,
        padding: EdgeInsets.only(right: 12, left: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 80,
              child: Image.network(user.image),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 48,
                ),
                Text(
                  'Name : ${user.firstName} ${user.lastName}',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  'Maiden Name : ${user.maidenName == "" ? "None" : user.maidenName}',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  'Age : ${user.age}',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
