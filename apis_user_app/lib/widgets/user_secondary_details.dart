import 'dart:ui';

import 'package:apis_user_app/models/user_details_model.dart';
import 'package:flutter/material.dart';

class UserSecondaryDetails extends StatelessWidget {
  const UserSecondaryDetails({
    super.key,
    required this.user,
  });

  final UserDetailsModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 12, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Personal Details :",
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Email : ${user.email}',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                'Mobile Number : ${user.phone}',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                'Gender : ${user.gender}',
                style: TextStyle(fontSize: 14),
              ),
              Row(
                children: [
                  Text(
                    'DOB : ${user.birthDate}',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    'Blood Group : ${user.bloodGroup}',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Height : ${user.height}',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    width: 46,
                  ),
                  Text(
                    'Weight : ${user.weight}',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
