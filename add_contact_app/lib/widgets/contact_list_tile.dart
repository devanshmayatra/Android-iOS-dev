import 'package:add_contact_app/screens/view_contact_screen.dart';
import 'package:add_contact_app/view_models/contact_view_model.dart';
import 'package:add_contact_app/view_models/theme_data_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactListTile extends StatelessWidget {
  const ContactListTile(
      {super.key, required this.contact, required this.index});

  final Map contact;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 10),
      padding: const EdgeInsets.only(left: 10, top: 4, bottom: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: context.watch<ThemeViewModel>().isDarkMode
                  ? const Color.fromARGB(255, 56, 56, 56)
                  : const Color.fromARGB(255, 207, 207, 207),
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(child: Text(contact["name"])),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return ChangeNotifierProvider.value(
                      value: context.read<ContactViewModel>(),
                      child: ViewContact(index: index),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
