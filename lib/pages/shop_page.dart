import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../componenets/shoe_tile.dart';
import '../models/cart.dart';
import '../models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add shoe to cart
  void addShoeToCart(Shoe shoe){
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // aler the user , shoe added
    showDialog(context: context, builder: (context) => const AlertDialog(
      title: Text("Successfully added !!"),
      content: Text("Check your cart"),
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) => Column(
      children: [

        // search bar
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Search'),
              Icon(Icons.search)
            ],
          ),
        ),


        // message
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Text('Everyone flies.. some fly longer than others',
              style: TextStyle(color: Colors.grey[600]),
            )
        ),


        // hot picks
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Hot picks 🔥',
                style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 24,
                ),
              ),
              Text('See all', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
            ],
          ),
        ),

        const SizedBox(height: 30,),

        Expanded(
            child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              Shoe shoe1 = value.getShoeList()[index];
              // return the shoe
              return ShoeTile(shoe: shoe1, onTap: () =>addShoeToCart(shoe1),);
            })
        ),

        const Padding(padding: EdgeInsets.only(top: 25, left: 25,right: 25),
          child: Divider(
            color: Colors.white,
          ),)

      ],
    )
    );
  }
}
