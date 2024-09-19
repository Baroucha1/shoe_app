import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/models/shoe.dart';

class Cart extends ChangeNotifier{
  // List of shoe for sale
    List<Shoe> shoeShop = [
      Shoe(
          name: "AirJordan",
          price: "236",
          imagePath: "lib/images/airjordanblue.png",
          description: 'The forward-thinking design of this latest signature shoe'),
      Shoe(
          name: "Blazer Mid Red",
          price: "240",
          imagePath: "lib/images/blazermidred.png",
          description: 'The forward-thinking design of this latest signature shoe'),
      Shoe(
          name: "AirMax Dn",
          price: "250",
          imagePath: "lib/images/airmaxdn.png",
          description: 'The forward-thinking design of this latest signature shoe'),
      Shoe(
          name: "Nike Dunk ",
          price: "220",
          imagePath: "lib/images/nikedunklowretro.png",
          description: 'The forward-thinking design of this latest signature shoe'),
    ];

  // list of items in user cart;
  List<Shoe> userCart = [];
  // get the list of shoe for sale
  List<Shoe> getShoeList(){
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart(){
    return userCart;
  }

  // add items to cart
  void addItemToCart(Shoe shoe){
    userCart.add(shoe);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Shoe shoe){
    userCart.remove(shoe);
    notifyListeners();
  }
}