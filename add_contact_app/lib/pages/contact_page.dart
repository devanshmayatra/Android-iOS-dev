import 'package:add_contact_app/screens/contact_screen.dart';
import 'package:add_contact_app/view_models/contact_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContactViewModel(),
      child: const ContactScreen(),
    );
  }
}
