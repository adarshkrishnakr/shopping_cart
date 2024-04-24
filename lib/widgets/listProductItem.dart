import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_theme/models/product.dart';
import 'package:toggle_theme/provider/cart_provider.dart';

class ListProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);

    return ListTile(
      leading: Image.asset(product.image),
      title: Text(product.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Price: ${product.price.toString()}'),
          SizedBox(height: 4),
          Text('Description: ${product.description}'),
        ],
      ),
      trailing: IconButton(
        icon: Icon(Icons.add_shopping_cart),
        onPressed: () {
          cart.addItem(
            productId: product.id,
            title: product.title,
            price: product.price.toString(),
          );
        },
      ),
    );
  }
}
