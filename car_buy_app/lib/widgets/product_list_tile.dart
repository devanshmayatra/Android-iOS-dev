import 'package:car_buy_app/models/product.dart';
import 'package:flutter/material.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({
    super.key,
    required this.product,
    required this.quantity,
    required this.onTapAdd,
    required this.onTapRemove,
  });

  final Product product;
  final void Function() onTapAdd;
  final void Function() onTapRemove;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 255, 61, 61),
      ),
      child: Row(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 220, 220),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                '${product.currency} ${product.price}',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: IconButton.filled(
                  onPressed: onTapRemove,
                  icon: const Icon(Icons.remove),
                  iconSize: 10,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                quantity.toString(),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 30,
                height: 30,
                child: IconButton.filled(
                  onPressed: onTapAdd,
                  icon: const Icon(Icons.add),
                  iconSize: 10,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
