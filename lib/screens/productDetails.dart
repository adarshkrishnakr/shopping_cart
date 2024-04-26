import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_theme/provider/cart_provider.dart';
import 'package:toggle_theme/provider/products_provider.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final productID = ModalRoute.of(context)!.settings.arguments as String;
    final productProvider = Provider.of<Products>(context);
    final product = productProvider.getProductById(productID);
     final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Image.asset(product.image),
            Text(product.title),
            Text('Description: ${product.description}'),
            Text('Price: \$${product.price.toString()}'),
            ElevatedButton(
              onPressed: () {
                cart.addToCart();

                cart.addItem(productId: product.id, title: product.title, price: product.price.toString());

              },
              child: Text(
                cart.addedToCart?"Added to cart":"Add to cart",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  ),
            )
          ],
        ),
      ),
    );
  }
}
