import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_theme/models/product.dart';
import 'package:toggle_theme/provider/cart_provider.dart';
import 'package:toggle_theme/provider/products_provider.dart';
import 'package:toggle_theme/provider/theme_provider.dart';
import 'package:toggle_theme/screens/cartPage.dart';
import 'package:toggle_theme/widgets/gridProductItem.dart';

class HomePage extends StatelessWidget {
  static const id = '/HomePage';
  HomePage({Key? key});

 

  @override
  Widget build(BuildContext context) {
    final productData= Provider.of<Products>(context);
    final productList = productData.productList;
    return Scaffold(
    appBar: AppBar(
  backgroundColor: Colors.green,
  title: Text('SHOPPING CART'),
  centerTitle: true,
  actions: [
    IconButton(
      onPressed: () {
        Provider.of<ThemeProvider>(context, listen: false).changeTheme();
      },
      icon: Icon(Icons.dark_mode),
    ),
    Consumer<Cart>(
      builder: (context, cart, _) => Stack(
        alignment: Alignment.center,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/cart-page.id');
            },
            icon: Icon(Icons.shopping_cart),
          ),
          cart.items.isNotEmpty
              ? Positioned(
                  top: -1,
                  right: 1,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 10,
                    child: Text(
                      cart.items.length.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    ),
  ],
),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("NEYMAR"),
              accountEmail: Text("neymarjr@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/NEYMAR.webp'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                "Profile",
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                "Settings",
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text(
                "DashBoard",
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                "Logout",
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return ChangeNotifierProvider<Product>(
            create: (BuildContext context)=> productList[index],
            child: GridProductItem(
             
                 ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 30,
        ),
      ),
    );
  }
}