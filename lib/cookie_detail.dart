import 'package:flutter/material.dart';
import 'bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'cart_page.dart';

class CookieDetail extends StatelessWidget {
  final List<String> imageList = [
    "https://tse2.mm.bing.net/th?id=OIP.jNk5g4ABrMqewVNmroAgbAAAAA&pid=Api&P=0&h=180",
    "https://tse1.mm.bing.net/th?id=OIP.86AsqiiiYH-fqrsmc3b9uQHaE8&pid=Api&P=0&h=180",
    "https://tse4.mm.bing.net/th?id=OIP.wm57msCiuC8wsnR_vRuB1AHaE7&pid=Api&P=0&h=180",
    "https://tse3.mm.bing.net/th?id=OIP.K19ZwlG0C16iXsN3o5AdLwHaE8&pid=Api&P=0&h=180",
    "https://tse3.mm.bing.net/th?id=OIP.M-8Og-l5JnRetKYwmZtpNwHaE8&pid=Api&P=0&h=180",
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffa6010f),
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xfff4f5f6)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('About Us',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xfffbfcfd))),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.not_accessible, color: Color(0xfffafafb)),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => CookieDetail()));
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 15.0),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Cookie',
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 42.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffa6010f))),
          ),
          SizedBox(height: 15.0),
          CarouselSlider(
            options: CarouselOptions(
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlay: true,
            ),
            items: imageList
                .map((e) => ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Image.network(
                            e,
                            width: 1050,
                            height: 350,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    ))
                .toList(),
          ),
          SizedBox(height: 20.0),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 50.0,
              child: Text(
                  'Cold, creamy ice cream sandwiched between delicious deluxe cookies. Pick your favorite deluxe cookies and ice cream flavor.Cold, creamy ice cream sandwiched between delicious deluxe cookies. Pick your favorite deluxe cookies and ice cream flavor.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 16.0,
                      color: Color(0xFFB4B8B9))),
            ),
          ),
          SizedBox(height: 20.0),
          Center(
              child: Container(
                  width: MediaQuery.of(context).size.width - 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Color(0xffa6010f)),
                  child: Center(
                    child: Text(
                      'Evaluation us ...',
                      style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xffa6010f),
        child: Icon(Icons.fastfood),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
