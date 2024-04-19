import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:toggle_theme/provider/theme_provider.dart";
import "package:toggle_theme/screens/home.dart";

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context,child){
        final provider = Provider.of<ThemeProvider>(context);
      
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: provider.theme,
        home: HomePage(),
        
      );
      },
      
    );
  }
}