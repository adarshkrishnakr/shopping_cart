import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_theme/provider/theme_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      body: Center(
          child: Consumer<ThemeProvider>(builder: (context, value, child) {
           
        return ElevatedButton(
          onPressed: () {
            value.changeTheme();
          },
          child: Text("Change Theme"),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
              foregroundColor: MaterialStateProperty.all(Colors.black)),
        );
      })),
    );
  }
}
