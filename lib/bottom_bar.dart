import 'package:flutter/material.dart';
import 'package:project/cart_page.dart';
import 'package:project/cookie_page.dart';

import 'contact.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        color: Colors.transparent,
        elevation: 9.0,
        clipBehavior: Clip.antiAlias,
        child: Container(
            height: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0)),
                color: Colors.white),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 2 - 40.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.home, color: Color(0xFF676E79)),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => CookiePage()));
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.person_outline,
                                color: Color(0xFF676E79)),
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (_) => Contact()));
                            },
                          ),
                        ],
                      )),
                  Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 2 - 40.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.search, color: Color(0xFF676E79)),
                          IconButton(
                            icon: Icon(Icons.shopping_basket,
                                color: Color(0xFF676E79)),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => CartPage()));
                            },
                          ),
                        ],
                      )),
                ])));
  }
}
