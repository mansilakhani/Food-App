import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../helpers/firebase_auth_helper.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> SignInKey = GlobalKey<FormState>();

  final TextEditingController SignIn_emailController = TextEditingController();
  final TextEditingController SignIn_passwordController =
      TextEditingController();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Color(0XFF459f2e),
        ),
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(colors: [
        //     Color(0xffCB2B93),
        //     Color(0xff9546C4),
        //     Color(0xff5E61F4),
        //   ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        //),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: [
                // logoWidget(
                //   'assets/images/img.png',
                // )
                Image.asset("assets/images/img_1.png"),
                const SizedBox(height: 30),
                Form(
                  key: SignInKey,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextFormField(
                        controller: SignIn_emailController,
                        validator: (val) =>
                            (val!.isEmpty) ? "Enter email first..." : null,
                        onSaved: (val) {
                          //email = val;
                          setState(() {
                            email = val;
                          });
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.mail,
                            color: Colors.white70,
                          ),
                          label: const Text("Email"),
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
                        controller: SignIn_passwordController,
                        obscureText: true,
                        validator: (val) =>
                            (val!.isEmpty) ? "Enter password first..." : null,
                        onSaved: (val) {
                          password = val;
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.password,
                            color: Colors.white70,
                          ),
                          label: const Text("Password"),
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
                    onPressed: () async {
                      if (SignInKey.currentState!.validate()) {
                        SignInKey.currentState!.save();

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

                        SignIn_emailController.clear();
                        SignIn_passwordController.clear();
                        setState(() {
                          email = "";
                          password = "";
                        });
                      }
                      // Navigator.of(context).pop();
                    },
                    child: const Text(
                      "LOG IN",
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
                      "Don't have account ?",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).pushNamed('/signup_page');
                          //Get.toNamed('/signup_page');
                        });
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ],
                ),
                const Text("Or"),
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
                    onPressed: () async {
                      User? user = await FirebaseAuthHelper.firebaseAuthHelper
                          .signInWithGoogle();

                      if (user != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Login Successful\nUID: ${user.uid}"),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.of(context)
                            .pushReplacementNamed('/', arguments: user);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Login failed ..."),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: SizedBox(
                      width: 170,
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/google.png",
                            scale: 20,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Sign with google",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
