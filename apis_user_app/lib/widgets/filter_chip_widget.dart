import 'package:apis_user_app/view_models/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterChipWidget extends StatelessWidget {
  FilterChipWidget({super.key, required this.tag, required this.selector});

  final String tag;
  String selector;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      selectedColor: Colors.green[300],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      selected: context.watch<UsersViewModel>().selector == tag.toLowerCase(),
      onSelected: (selected) {
        if (selected == true) {
          context.read<UsersViewModel>().getUsers(tag.toLowerCase());
        }
      },
      label: Text(tag),
    );
  }
}
