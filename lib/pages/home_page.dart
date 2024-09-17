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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Column(

              children: [
              Container(
                padding: EdgeInsets.only(top:20, left: 20 ,right: 20),
                child: Column(
                  children: [

                    Image.asset('lib/images/nike.png', color: Colors.white, width: 200, height: 200,fit :BoxFit.contain ),

                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Divider(
                  color: Colors.grey[800],
                ),
              ),

              // other pages
              // home
              const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.home,color: Colors.white,),
                  title: Text('Home',style: TextStyle(color: Colors.white),),
                ),
              ),
                // about
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.info,color: Colors.white,),
                    title: Text('About',style: TextStyle(color: Colors.white),),
                  ),
                ),
            ],),


            //logout
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.logout,color: Colors.white,),
                title: Text('Logout',style: TextStyle(color: Colors.white),),
              ),
            ),
          ]

        ),
      ),
      body: _pages[_selectedIndex],
    );
  }


}
