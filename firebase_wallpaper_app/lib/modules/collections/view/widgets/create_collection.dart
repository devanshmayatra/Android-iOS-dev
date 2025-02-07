import 'package:firebase_wallpaper_app/modules/collections/view/widgets/drop_down_status_selector.dart';
import 'package:firebase_wallpaper_app/modules/collections/view_model/collections_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateCollection extends StatefulWidget {
  const CreateCollection({super.key});

  @override
  State<CreateCollection> createState() => _CreateCollectionState();
}

class _CreateCollectionState extends State<CreateCollection> {
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Enter Collection name:"),
                      TextField(
                        controller: textFieldController,
                        decoration: InputDecoration(
                          hintText: "Enter name ",
                        ),
                      ),
                      DropDownStatusSelector(),
                      TextButton(
                        onPressed: () {
                          context
                              .read<CollectionsViewModel>()
                              .createCollection(textFieldController.text);
                          Navigator.pop(context);
                        },
                        child: Text("Add"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
