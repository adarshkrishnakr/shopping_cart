

import 'package:flutter/material.dart';
import 'package:toggle_theme/models/product.dart';


class Products with ChangeNotifier{

  final List<Product> _productList = [

    Product(id: "1",
     title: "Apple Iphone 15",
      description:"................",
       image: "images/APPLE IPHONE 15.png",
        price: 82600 ),

       

        
         Product(id: "2",
     title: "NOTHING PHONE 1",
      description:"................",
       image: "images/NOTHING PHONE(1).png",
        price: 29999 ),

          Product(id: "3",
     title: "SAMSUNG S24 ULTRA",
      description:"................",
       image: "images/SAMSUNG S24.png",
        price: 139999 ),

         Product(id: "4",
     title: "VIVO X100",
      description:"................",
       image: "images/VIVOX100.png",
        price: 63999 ),

         Product(id: "5",
     title: "OnePlus 12",
      description:"................",
       image: "images/OnePlus 12.png",
        price: 45999 ),

          Product(id: "6",
     title: "Motorola Edge 50",
      description:"................",
       image: "images/Moto Edge 50.png",
        price: 35999 ),

         Product(id: "7",
     title: "realme 12 pro+",
      description:"................",
       image: "images/realme.webp",
        price: 315999 ),

        
         Product(id: "8",
     title: "Oppo F25 pro",
      description:"................",
       image: "images/Oppo F25 pro.webp",
        price: 25999 ),


  ];

  List<Product> get productList => _productList;


   Product getProductById(String id){
    return _productList.firstWhere((product) => product.id==id);

  }

  
 
  }


