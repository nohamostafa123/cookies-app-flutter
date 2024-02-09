import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:project/cookie_page.dart';
import 'login_cubit.dart';
import 'custom_text_field.dart';
import 'string_extension.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Color(0xfffec5c5),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          right: 40,
          left: 40,
          top: 50,
          bottom: 20,
        ),
        child: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 120,
                      width: 120,
                      child: Image.asset("assets/logo2.png")),
                  SizedBox(
                    height: height * .02,
                  ),
                  Text(
                    "Your favourite",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    "Cookies",
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xffa6010f),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  CustomTextField(
                      height: height,
                      text: "Email",
                      controller: _emailController,
                      validator: (value) {
                        setState(() {});
                        return null;
                      }),
                  SizedBox(
                    height: height * .05,
                  ),
                  CustomTextField(
                      height: height,
                      text: "Password",
                      controller: _passwordController,
                      isPassword: _obscureText),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Forget Password?"),
                    ],
                  ),
                  SizedBox(
                    height: height * .04,
                  ),
                  // BlocBuilder<LoginCubit,LoginState>(
                  //   builder: context,state){
                  //     if (state is LoginLoadingState){
                  //       return Center(child: CircularProgressIndicator(),);
                  //     }

                  InkWell(
                    onTap: () {
                      //     if (_formKey.currentState!.validate()) {
                      //       context.read<LoginCubit>().login(
                      //             email: _emailController.text,
                      //             password: _passwordController.text,
                      //           );
                      Get.offAll(CookiePage());
                      // }
                      //     //}
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(16),
                      elevation: 10,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(0xffa6010f),
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have account?"),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(CookiePage());
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Color(0xffa6010f),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required double height,
    required String text,
    String? Function(String?)? validator,
    required TextEditingController controller,
    bool? isPassword,
  }) {
    print("is password (1): " + isPassword.toString());
    return Column(
      children: [
        Row(
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(
          height: height * .01,
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: isPassword ?? false,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            contentPadding: EdgeInsets.all(12),
            border: OutlineInputBorder(borderSide: BorderSide.none),
            suffixIcon: isPassword != null
                ? InkWell(
                    onTap: () {
                      isPassword = !isPassword!;
                      print("===============isPassword: " +
                          isPassword.toString());
                      setState(() {});
                    },
                    child: Icon(isPassword
                        ? CupertinoIcons.eye_slash_fill
                        : CupertinoIcons.eye_fill),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
