import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statehandler_food_ordering_app/providers/product_provider.dart';
import 'package:statehandler_food_ordering_app/views/screen/product_homepage.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic selected;
  // var heart = false;
  PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: StylishBottomBar(
        backgroundColor: Colors.white,
        items: [
          AnimatedBarItems(
              icon: const Icon(
                Icons.house_outlined,
                size: 28,
              ),
              selectedIcon: const Icon(Icons.house_rounded),
              selectedColor: Colors.green,
              backgroundColor: Colors.lightGreenAccent,
              title: const Text('')),
          AnimatedBarItems(
              icon: const Icon(
                Icons.chat_outlined,
                size: 25,
              ),
              selectedIcon: const Icon(
                Icons.chat_outlined,
              ),
              selectedColor: Colors.green,
              backgroundColor: Colors.lightGreenAccent,
              title: const Text('')),
          AnimatedBarItems(
              icon: const Icon(
                Icons.notifications,
                size: 25,
              ),
              selectedIcon: const Icon(
                Icons.notifications,
              ),
              selectedColor: Colors.green,
              backgroundColor: Colors.lightGreenAccent,
              title: const Text('')),
          AnimatedBarItems(
              icon: const Icon(
                CupertinoIcons.heart,
                size: 25,
              ),
              selectedIcon: const Icon(
                CupertinoIcons.heart_fill,
              ),
              selectedColor: Colors.green,
              backgroundColor: Colors.lightGreenAccent,
              title: const Text('Like')),
        ],
        iconSize: 32,
        barAnimation: BarAnimation.transform3D,
        iconStyle: IconStyle.animated,
        hasNotch: true,
        fabLocation: StylishBarFabLocation.center,
        opacity: 0.3,
        currentIndex: selected ?? 0,
        onTap: (index) {
          controller.jumpToPage(index!);
          setState(() {
            selected = index;
          });
        },
      ),
      floatingActionButton: Container(
        height: 80,
        width: 60,
        child: Stack(
          children: [
            Positioned(
              bottom: 15,
              left: 2,
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                backgroundColor: const Color(0XFF459f2e),
                onPressed: () {
                  Navigator.of(context).pushNamed("/cart_page");
                },
                tooltip: 'increment',
                elevation: 5,
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 4),
                  color: const Color(0XFF459f2e),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "${Provider.of<ProductProvider>(context).totalProducts}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: const [
            //ProductHomePage(),
            ProductPage(),
            Center(child: Text('Star')),
            //CartPage(),
            Center(child: Text('')),
            Center(child: Text('Profile')),

            // Center(child: Text("Cart")),
          ],
        ),
      ),
    );
  }
}
