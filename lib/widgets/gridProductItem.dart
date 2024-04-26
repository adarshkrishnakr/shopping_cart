import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_theme/models/product.dart';
import 'package:toggle_theme/provider/cart_provider.dart';
import 'package:toggle_theme/provider/products_provider.dart';
import 'package:toggle_theme/screens/productDetails.dart';

class GridProductItem extends StatelessWidget {
  const GridProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Consumer<Product>(
      builder: (context, product, child) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: GridTile(
            child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/product-details',
                      arguments: product.id);
                },
                child: Image.asset(product.image)),
            footer: GridTileBar(
              title: Text(
                product.title,
                textAlign: TextAlign.center,
              ),
              backgroundColor: Colors.black54,
              leading: IconButton(
                icon: product.isFavourite
                    ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : Icon(Icons.favorite_border_outlined),
                onPressed: () {
                  product.toggleFav();
                },
              ),
              trailing: IconButton(
                icon:product.isAdded?
                 Icon(
                  Icons.shopping_cart,
                  color: Colors.red,
                ):
                Icon(Icons.shopping_cart),
                onPressed: () {
                  product.changeIconClr();
                  
                  cart.addItem(
                      productId: product.id,
                      title: product.title,
                      price: product.price.toString());

                  
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
