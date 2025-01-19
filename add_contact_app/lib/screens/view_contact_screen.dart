import 'package:add_contact_app/view_models/contact_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewContact extends StatelessWidget {
  const ViewContact({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Contact"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 16),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller:
                      context.watch<ContactViewModel>().nameTextController,
                  decoration: InputDecoration(
                    labelText:
                        "Enter new (Name) : ${context.read<ContactViewModel>().contacts[index]["name"]}",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller:
                      context.watch<ContactViewModel>().numberTextController,
                  decoration: InputDecoration(
                    labelText:
                        "Enter New (number) : ${context.read<ContactViewModel>().contacts[index]["number"]}",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller:
                      context.watch<ContactViewModel>().emailTextController,
                  decoration: InputDecoration(
                    labelText:
                        "Enter new (Email) : ${context.read<ContactViewModel>().contacts[index]["email"]}",
                    border: InputBorder.none,
                  ),
                ),
              ),
              const Spacer(),
              Align(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<ContactViewModel>().updateContact(
                              index,
                              context
                                  .read<ContactViewModel>()
                                  .nameTextController
                                  .text,
                              context
                                  .read<ContactViewModel>()
                                  .numberTextController
                                  .text,
                              context
                                  .read<ContactViewModel>()
                                  .emailTextController
                                  .text,
                            );
                        Navigator.of(context).pop();
                      },
                      child: const Text("Add"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
