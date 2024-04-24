import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_theme/provider/cart_provider.dart';
import 'package:toggle_theme/provider/products_provider.dart';
import 'package:toggle_theme/provider/theme_provider.dart';
import 'package:toggle_theme/provider/toggle_view_provider.dart';
import 'package:toggle_theme/screens/cartPage.dart';
import 'package:toggle_theme/screens/home.dart';
import 'package:toggle_theme/screens/productDetails.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context)=>Products()),
        ChangeNotifierProvider(create: (context)=>Cart()),
        ChangeNotifierProvider(create: (context)=>ToggleView())
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: provider.theme,
            home: HomePage(),
           
            
            routes: {
              
              '/product-details':(context)=>ProductDetails(),
              '/cart-page.id': (context)=>CartPage(),
              
             
             
             
            },
          );
        },
      ),
    );
  }
}
