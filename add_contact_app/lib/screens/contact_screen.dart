import 'package:add_contact_app/screens/add_contact.dart';
import 'package:add_contact_app/view_models/contact_view_model.dart';
import 'package:add_contact_app/widgets/change_theme_icon_button.dart';
import 'package:add_contact_app/widgets/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contacts',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: const [
          ChangeThemeIconButton(),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 200,
            child: Center(
              child: Text(
                'Phone',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) {
                          return ChangeNotifierProvider.value(
                            value: context.read<ContactViewModel>(),
                            child: const AddContact(),
                          );
                        },
                      ),
                    );
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
          const Expanded(
            child: ContactList(),
          ),
        ],
      ),
    );
  }
}
