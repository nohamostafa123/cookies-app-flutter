import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'grocery_item_tile.dart';
import 'cart_model.dart';
import 'cart_page.dart';
import 'cookie_detail.dart';

class CookiePage extends StatefulWidget {
  const CookiePage({super.key});

  @override
  State<CookiePage> createState() => _CookiePageState();
}

class _CookiePageState extends State<CookiePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffa6010f),
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xfffdfefe)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Home Page',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xfffefefe))),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.details, color: Color(0xfffafafb)),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => CookieDetail()));
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffa6010f),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CartPage();
            },
          ),
        ),
        child: const Icon(Icons.add_shopping_cart),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Let's order fresh items for you",
              style: TextStyle(
                color: Color(0xffa6010f),
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 10),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(),
          ),

          const SizedBox(height: 12),

          // categories -> horizontal listview
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Fresh Items",
              style: TextStyle(
                color: Color(0xfff27f89),
                fontSize: 18,
              ),
            ),
          ),

          // recent orders -> show last 3
          Expanded(
            child: Consumer<CartModel>(
              builder: (context, value, child) {
                return GridView.builder(
                  padding: const EdgeInsets.all(6),
                  itemCount: value.shopItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.2,
                  ),
                  itemBuilder: (context, index) {
                    return GroceryItemTile(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      imagePath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: () =>
                          Provider.of<CartModel>(context, listen: false)
                              .addItemToCart(index),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
