import 'package:console_restaurant_app/category_model.dart';
import 'package:console_restaurant_app/menu_model.dart';
import 'package:console_restaurant_app/restaurant_database.dart';

class Restaurant {
  Restaurant._();

  static final _instance = Restaurant._();

  factory Restaurant() => _instance;

  final db = MyRestaurantDb();

  Map<MenuModel, int> cart = {};

  int? noOfItems(MenuModel menu) {
    return cart[menu];
  }

  void addToCart(int id) {
    final map = db.findMenuById(id);
    if (map == null) return;

    final menu = MenuModel.fromMap(map);
    if (cart.containsKey(menu)) {
      cart[menu] = cart[menu]! + 1;
    } else {
      cart.addAll({
        menu: 1,
      });
    }
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (final entry in cart.entries) {
      totalPrice = totalPrice + (entry.key.price * entry.value);
    }
    return totalPrice;
  }

  List<MenuModel> getMenusFromCategory(int categoryId) {
    return getAllMenus()
        .where((element) => element.categoryId == categoryId)
        .toList();
  }

  List<CategoryModel> getAllCategories() {
    return db.categories.values
        .map((value) => CategoryModel.fromMap(value))
        .toList();
  }

  List<MenuModel> getAllMenus() {
    return db.menu.values.map((value) => MenuModel.fromMap(value)).toList();
  }
}
