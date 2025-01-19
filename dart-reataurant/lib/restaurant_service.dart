import 'category_model.dart';
import 'menu_model.dart';
import 'restaurant_db.dart';

class MyRestaurantService {
  MyRestaurantService._();
  static final _instance = MyRestaurantService._();
  factory MyRestaurantService() => _instance;

  final database = MyRestaurantDatabase();

  Map<MenuModel, int> cart = {};

  int? getQuantity(MenuModel menu) {
    return cart[menu];
  }

  void addMenuToCart(int id) {
    final map = database.findMenuById(id);
    if (map == null) return;

    final menu = MenuModel.fromMap(map);
    final addToCart = id > 0;

    if (cart.containsKey(menu)) {
      if (addToCart) {
        cart[menu] = cart[menu]! + 1;
      } else {
        cart[menu] = cart[menu]! > 0 ? cart[menu]! - 1 : 0;
      }
    } else if (addToCart) {
      cart.addAll({
        menu: 1,
      });
    }

    if (cart[menu] == 0) {
      cart.remove(menu);
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
    return database.categories.values
        .map((value) => CategoryModel.fromMap(value))
        .toList();
  }

  List<MenuModel> getAllMenus() {
    return database.menu.values
        .map((value) => MenuModel.fromMap(value))
        .toList();
  }
}
