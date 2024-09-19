import 'package:flutter/material.dart';

import '../componenets/shoe_tile.dart';
import '../models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
          padding: EdgeInsets.symmetric(horizontal: 25),
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

        Expanded(child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
          Shoe shoe1 = Shoe(
              name: 'blazer',
              price: '250',
              imagePath: 'lib/images/blazer1.png',
              description: 'cool shoe');
          return ShoeTile(shoe: shoe1,);
        })
        ),

      ],
    );
  }
}
