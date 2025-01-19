import 'package:add_contact_app/view_models/theme_data_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeThemeIconButton extends StatelessWidget {
  const ChangeThemeIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<ThemeViewModel>().isDarkMode;
    return IconButton.filledTonal(
      onPressed: () {
        context.read<ThemeViewModel>().changeTheme();
      },
      icon: Icon(
        isDarkMode ? Icons.light_mode : Icons.dark_mode,
      ),
    );
  }
}
