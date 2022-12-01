import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0XFF459f2e),
      body: Column(
        children: [
          const Spacer(flex: 5),
          Image.asset('assets/images/img_1.png'),
          const SizedBox(height: 35),
          const Text(
            "Fast delivery at \nyour doorstep",
            style: TextStyle(
              fontSize: 23,
              color: Colors.white,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            "Home delivery and online reservation \n     system for restaurants & cafe",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.2,
              color: Colors.white,
            ),
          ),
          const Spacer(flex: 10),
          SizedBox(
            width: _width * 0.85,
            height: _height * 0.056,
            child: SizedBox.expand(
              child: ElevatedButton(
                  // style: ElevatedButton.styleFrom(
                  //   backgroundColor: Colors.white,
                  //
                  //   // minimumSize: Size.fromHeight(50),
                  // ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/signin_page');
                    //Get.toNamed('/signin_page');
                  },
                  child: const Text(
                    "Let's Explore",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF459f2e),
                        fontSize: 18),
                  )),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
