import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../helpers/firebase_auth_helper.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> SignupKey = GlobalKey<FormState>();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();

  String? email;
  String? password;
  String? username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color(0XFF459f2e),
        ),
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(colors: [
        //   Color(0xffCB2B93),
        //   Color(0xff9546C4),
        //   Color(0xff5E61F4),
        // ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: [
                Form(
                  key: SignupKey,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextFormField(
                        controller: _userNameController,
                        validator: (val) =>
                            (val!.isEmpty) ? "Enter Username first..." : null,
                        onSaved: (val) {
                          //email = val;
                          setState(() {
                            username = val;
                          });
                        },

                        keyboardType: TextInputType.text,
                        // decoration: const InputDecoration(
                        //   label: Text("Email"),
                        //   hintText: "Enter email first ...",
                        //   //errorText: "Enter email first ...",
                        //   border: OutlineInputBorder(),
                        // ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white70,
                          ),
                          label: Text("Username"),
                          labelStyle:
                              TextStyle(color: Colors.white.withOpacity(0.9)),
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Colors.white.withOpacity(0.3),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        validator: (val) =>
                            (val!.isEmpty) ? "Enter email first..." : null,
                        onSaved: (val) {
                          //email = val;
                          setState(() {
                            email = val;
                          });
                        },

                        keyboardType: TextInputType.emailAddress,
                        // decoration: const InputDecoration(
                        //   label: Text("Email"),
                        //   hintText: "Enter email first ...",
                        //   //errorText: "Enter email first ...",
                        //   border: OutlineInputBorder(),
                        // ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Colors.white70,
                          ),
                          label: Text("Email"),
                          labelStyle:
                              TextStyle(color: Colors.white.withOpacity(0.9)),
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Colors.white.withOpacity(0.3),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        validator: (val) =>
                            (val!.isEmpty) ? "Enter password first..." : null,
                        onSaved: (val) {
                          password = val;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.password,
                            color: Colors.white70,
                          ),
                          label: Text("Password"),
                          labelStyle:
                              TextStyle(color: Colors.white.withOpacity(0.9)),
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Colors.white.withOpacity(0.3),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none)),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(90)),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.black26;
                        }
                        return Colors.white;
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      if (SignupKey.currentState!.validate()) {
                        SignupKey.currentState!.save();

                        User? user = await FirebaseAuthHelper.firebaseAuthHelper
                            .signInUser(email: email!, password: password!);

                        if (user != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text("Sign In Successful\n UID:${user.uid}"),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.green,
                            ),
                          );
                          //Navigator.of(context).pop();

                          Navigator.of(context)
                              .pushReplacementNamed('/', arguments: user);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Sign In failed"),
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                          // Navigator.of(context).pop();
                        }
                        _userNameController.clear();
                        _emailController.clear();
                        _passwordController.clear();
                        setState(() {
                          username = "";
                          email = "";
                          password = "";
                        });
                      }
                      // Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          // Navigator.of(context).pushNamed('signin_screen');
                          Get.toNamed('/signin_screen');
                        });
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
