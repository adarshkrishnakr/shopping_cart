import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:toggle_theme/provider/cart_provider.dart';
import 'package:toggle_theme/widgets/cart_items.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page"),
      ),
      body: Column(
        children: [
          Card(),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) => CartItemTile(
                id: cart.items.values.toList()[index].id,
                title: cart.items.values.toList()[index].title,
                price: cart.items.values.toList()[index].price,
                productId: cart.items.values.toList()[index].productId,
                qty: cart.items.values.toList()[index].qty,
                
                
               
                
            
                ),
          ))
        ],
      ),
    );
  }
}
