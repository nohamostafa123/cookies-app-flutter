import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:project/contact.dart';
import 'package:project/cookie_detail.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';
import 'package:project/cart_page.dart';
import 'dio_helper.dart';
import 'login_screen.dart';
import 'cookie_detail.dart';
import 'welcome.dart';
import 'login_cubit.dart';

void main() {
  runApp(const MyApp());
  void main() async {
    //Bloc.observer = AppBlocObserver();
    DioHelper.init();
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),

      // providers: [
      //   BlocProvider(create: (context) => LoginCubit()),
      // ],
      child: GetMaterialApp(
        title: 'Login',
        home: Welcome(),
        //home: Contact(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
