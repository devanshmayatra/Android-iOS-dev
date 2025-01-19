import 'dart:io';

import '../category_model.dart';
import '../extensions/print_color_extension.dart';
import '../menu_model.dart';
import '../restaurant_service.dart';

void menuScreen() {
  final service = MyRestaurantService();

  final categories = service.getAllCategories();

  int? input;

  while (input != 0) {
    print("\x1B[2J\x1B[0;0H");
    print('Welcome to My Restaurant! 😊');
    print('');
    print('Select the menu you want to order...');
    for (CategoryModel category in categories) {
      print('');
      print(category.name.blue);
      final menus = service.getMenusFromCategory(category.id);
      for (MenuModel menu in menus) {
        print('${menu.id}. ${menu.name}'.padRight(30) +
            '${menu.currency} ${menu.price}'.padRight(10).magenta +
            '${service.getQuantity(menu) ?? ''}');
      }
    }
    print('Total price : ' + '${service.calculateTotalPrice()}'.green);

    final inputString = stdin.readLineSync();
    input = int.tryParse(inputString ?? '');

    service.addMenuToCart(input ?? 999);
  }

  print('End');
}
