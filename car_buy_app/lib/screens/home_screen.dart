import 'dart:developer';

import 'package:car_buy_app/models/product.dart';
import 'package:car_buy_app/screens/cart_screen.dart';
import 'package:car_buy_app/widgets/cart_floating_action_button.dart';
import 'package:car_buy_app/widgets/product_list_tile.dart';
import 'package:flutter/material.dart';

Product getProductById(int id) {
  return products.where((element) => element.id == id).first;
}

final List<Product> products = [
  const Product(
    id: 1,
    name: 'Koeniggsegg',
    price: 450000,
  ),
  const Product(
    id: 2,
    name: 'Aston Martin',
    price: 250000,
  ),
  const Product(
    id: 3,
    name: 'Ferarri',
    price: 500000,
  ),
  const Product(
    id: 4,
    name: 'Maserati',
    price: 300000,
  ),
  const Product(
    id: 5,
    name: 'Aventador',
    price: 500000,
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<int, int> cart = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 104, 104),
      appBar: AppBar(
        title: const Text('Pick your Favourite Car'),
        backgroundColor: const Color.fromARGB(255, 255, 0, 0),
      ),
      floatingActionButton: CartFloatingActionButton(
        onTap: () {
          log('button kisine press kiya');
          Navigator.of(context).push<Map<int, int>>(
            MaterialPageRoute(
              builder: (context) {
                return CartScreen(cart: cart);
              },
            ),
          ).then((value) {
            setState(() {
              if (value != null) {
                cart = value;
              }
            });
          });
        },
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductListTile(
            product: product,
            quantity: getQuantity(product),
            onTapAdd: () => addItemButtonClickEvent(product),
            onTapRemove: () => removeItemButtonClickEvent(product),
          );
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
        // cart mai nhi hai
        cart[product.id] = 1;
      }
    });
  }

  void removeItemButtonClickEvent(Product product) {
    setState(() {
      if (cart.containsKey(product.id)) {
        final quantity = cart[product.id] as int;
        if (quantity > 0) {
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
