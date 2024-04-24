import 'package:flutter/material.dart';

class ToggleView extends ChangeNotifier{
  bool isGridview = true;

  void toggleViewType (){
    isGridview = !isGridview;
    notifyListeners();
  }
}