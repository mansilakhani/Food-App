import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  initTime() async {
    await Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, "/introscreen");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF459f2e),
      //backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              // height: 150,
              // width: 150,
              scale: 2,
              color: Colors.white,
            ),
            SizedBox(
              height: 30,
            ),
            CircularProgressIndicator(
              color: Colors.white.withOpacity(0.8),
              backgroundColor: Colors.grey.withOpacity(0.8),
            )
            // Text(
            //   "Author App",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 30,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
