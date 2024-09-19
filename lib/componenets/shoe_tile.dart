import 'package:flutter/material.dart';
import 'package:shoe_app/models/shoe.dart';
class ShoeTile extends StatelessWidget {
  Shoe shoe;
  ShoeTile({
    super.key, required this.shoe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // shoe pic
          Image.asset(shoe.imagePath),

          // description

          // price + details

          // button to add to cart
        ],
      ),
    );
  }
}

