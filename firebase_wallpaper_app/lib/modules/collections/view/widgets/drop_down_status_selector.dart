import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_wallpaper_app/modules/collections/view_model/collections_view_model.dart';

class DropDownStatusSelector extends StatelessWidget {
  const DropDownStatusSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CollectionsViewModel>(
      builder: (context, dropdownState, child) {
        return DropdownButton<String>(
          value: dropdownState.selectedValue,
          onChanged: (String? newValue) {
            if (newValue != null) {
              dropdownState.setSelectedValue(newValue);
            }
          },
          items: ['public', 'private']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        );
      },
    );
  }
}
