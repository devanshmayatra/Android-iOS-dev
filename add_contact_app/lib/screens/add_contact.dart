import 'package:add_contact_app/view_models/contact_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddContact extends StatelessWidget {
  const AddContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Contact',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
        automaticallyImplyLeading: false,
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
                  decoration: const InputDecoration(
                    labelText: "Enter a new Contact Name",
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
                  decoration: const InputDecoration(
                    labelText: "Enter a new Contact Number",
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
                  decoration: const InputDecoration(
                    labelText: "Enter a new Contact Email",
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
                        context.read<ContactViewModel>().addTodoItem(
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
                                .text);
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
