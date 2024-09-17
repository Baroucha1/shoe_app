import 'package:flutter/material.dart';
import 'package:shoe_app/componenets/bottom_nav.dart';
import 'package:shoe_app/pages/shop_page.dart';

import 'cart_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // this selected index is to control the bottom nav
  int _selectedIndex = 0;

  // this methode will update ourselected index
  void navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages to display
  final List<Widget> _pages = [
    // shop page
    const ShopPage(),

    // cart page
    const CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu)),
        ),
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          children: [
            // logo
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
                child: Image.asset(
              'lib/images/nikelogo.png',
              color: Colors.white, )
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Divider(
              color: Colors.grey[800],
            ),)
            // other pages
          ]
          
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }


}
