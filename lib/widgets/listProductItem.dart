import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_theme/models/product.dart';
import 'package:toggle_theme/provider/cart_provider.dart';

class ListProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, '/product-details',
              arguments: product.id);
        },
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
          icon:product.isAdded?
           Icon(Icons.add_shopping_cart,
           color: Colors.red,
           ):
           Icon(Icons.add_shopping_cart),
          onPressed: () {
            product.changeIconClr();
            cart.addItem(
              productId: product.id,
              title: product.title,
              price: product.price.toString(),
            );
          },
        ),
      ),
    );
  }
}
