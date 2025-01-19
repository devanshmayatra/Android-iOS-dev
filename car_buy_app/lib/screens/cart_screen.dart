import 'package:car_buy_app/models/product.dart';
import 'package:car_buy_app/screens/home_screen.dart';
import 'package:car_buy_app/widgets/product_list_tile.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
    required this.cart,
  });

  final Map<int, int> cart;

  @override
  State<CartScreen> createState() {
    return _CartScreenState();
  }
}

class _CartScreenState extends State<CartScreen> {
  Map<int, int> cart = {};

  @override
  void initState() {
    super.initState();
    cart = widget.cart;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 104, 104),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 0, 0),
        title: const Text('Your cart'),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop(cart);
          },
        ),
      ),
      body: ListView.separated(
        itemCount: cart.entries.length,
        itemBuilder: (context, index) {
          final cartEntry = cart.entries.elementAt(index);
          final product = getProductById(cartEntry.key);
          return ProductListTile(
            product: product,
            quantity: getQuantity(product),
            onTapAdd: () => addItemButtonClickEvent(product),
            onTapRemove: () => removeItemButtonClickEvent(product),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(height: 1);
        },
      ),
    );
  }

  void addItemButtonClickEvent(Product product) {
    setState(() {
      if (cart.containsKey(product.id)) {
        final quantity = cart[product.id] as int;
        cart[product.id] = quantity + 1;
      } else {
        cart[product.id] = 1;
      }
    });
  }

  void removeItemButtonClickEvent(Product product) {
    setState(() {
      if (cart.containsKey(product.id)) {
        final quantity = cart[product.id] as int;
        if (quantity > 1) {
          cart[product.id] = quantity - 1;
        } else {
          cart.remove(product.id);
        }
      }
    });
  }

  int getQuantity(Product product) {
    if (cart.containsKey(product.id)) {
      return cart[product.id] as int;
    } else {
      return 0;
    }
  }
}
