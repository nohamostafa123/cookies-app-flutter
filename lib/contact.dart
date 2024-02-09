import 'package:flutter/material.dart';
import 'cookie_detail.dart';
import 'cookie_page.dart';
import 'login_screen.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
        title: Text('Contact Us',
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
      backgroundColor: const Color(0xfff0f1f5),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(15),
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: size.width,
              height: size.height * .3,
              child: Image.asset('assets/c1.jpg'),
            ),
            Container(
              height: size.height * .5,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.2),
                      spreadRadius: 2,
                      blurRadius: 20,
                      offset: const Offset(0, 0),
                    )
                  ]),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Positioned(
                    top: 10,
                    left: 20,
                    child: Text(
                      'YOUR DATA..',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffa6010f),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 50,
                      left: 20,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.contact_page,
                                color: Colors.grey,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                width: 300,
                                child: const TextField(
                                  cursorColor: Colors.grey,
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'noha mostafa',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: size.width * .8,
                            child: const Divider(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )),
                  Positioned(
                      top: 120,
                      left: 20,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.mail_outline,
                                color: Colors.grey,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                width: 300,
                                child: const TextField(
                                  cursorColor: Colors.grey,
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'noha@gmail.com',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: size.width * .8,
                            child: const Divider(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )),
                  Positioned(
                      top: 190,
                      left: 20,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.remove_red_eye,
                                color: Colors.grey,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                width: 300,
                                child: const TextField(
                                  obscureText: true,
                                  cursorColor: Colors.grey,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 20,
                                    letterSpacing: 1.4,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '........',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: size.width * .8,
                            child: const Divider(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )),
                  Positioned(
                    bottom: -30,
                    right: 30,
                    child: Container(
                      padding: const EdgeInsets.all(22),
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color(0xffa6010f),
                              Color(0xfff65f6b),
                            ],
                            stops: [
                              0.0,
                              1.0
                            ],
                            begin: FractionalOffset.topLeft,
                            end: FractionalOffset.bottomRight),
                        shape: BoxShape.circle,
                      ),
                      child: InkWell(
                        child: Image.asset('assets/right-arrow.png'),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CookiePage()));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
