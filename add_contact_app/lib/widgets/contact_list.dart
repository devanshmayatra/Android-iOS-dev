import 'package:add_contact_app/view_models/contact_view_model.dart';
import 'package:add_contact_app/view_models/theme_data_view_model.dart';
import 'package:add_contact_app/widgets/contact_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.watch<ThemeViewModel>().isDarkMode
              ? const Color.fromARGB(66, 0, 0, 0)
              : const Color.fromARGB(63, 165, 165, 165),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: context.read<ContactViewModel>().contacts.isEmpty
          ? Center(
              child: Text(
                "No contacts",
                style: TextStyle(
                  color: context.watch<ThemeViewModel>().isDarkMode
                      ? const Color.fromARGB(255, 226, 226, 226)
                      : const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            )
          : ListView.builder(
              itemCount: context.watch<ContactViewModel>().contacts.length,
              itemBuilder: (context, index) {
                return ContactListTile(
                    contact: context.watch<ContactViewModel>().contacts[index],
                    index: index);
              },
            ),
    );
  }
}
