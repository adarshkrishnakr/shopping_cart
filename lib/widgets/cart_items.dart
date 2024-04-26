import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_theme/models/product.dart';
import 'package:toggle_theme/provider/cart_provider.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({
    Key? key,
    required this.id,
    required this.title,
    required this.price,
    required this.qty,
    required this.productId,
  }) : super(key: key);

  final String id;
  final String title;
  final String price;
  final int qty;
  final String productId;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, '/product-details', arguments: productId);
        },
        leading: Text(price),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$qty"),
            Text('${double.parse(price) * qty}')
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            print('Deleting item with id: $id');
            Provider.of<Cart>(context, listen: false).removeItem(productId);
          },
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}
