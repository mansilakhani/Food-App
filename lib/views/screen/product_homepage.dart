import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:statehandler_food_ordering_app/helpers/firebase_auth_helper.dart';

import '../components/product_card.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final GlobalKey<ScaffoldState> _dKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    User? data = ModalRoute.of(context)!.settings.arguments as User?;
    return Scaffold(
      key: _dKey,
      drawer: Drawer(
        backgroundColor: Colors.green.withOpacity(0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey.withOpacity(0.6),
                backgroundImage: (data?.photoURL != null)
                    ? NetworkImage("${data!.photoURL}")
                    : null,
              ),
            ),
            const Divider(
              indent: 15,
              endIndent: 15,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15),
              child: (data?.displayName != null)
                  ? Text(
                      "Name: ${data!.displayName}",
                      style: TextStyle(color: Colors.white),
                    )
                  : const Text(
                      "Name: -",
                      style: TextStyle(color: Colors.white),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 15),
              child: (data?.email != null)
                  ? Text(
                      "Email: ${data!.email}",
                      style: TextStyle(color: Colors.white),
                    )
                  : const Text(
                      "Email: -",
                      style: TextStyle(color: Colors.white),
                    ),
            ),
            Spacer(flex: 5),
            Center(
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () async {
                    await FirebaseAuthHelper.firebaseAuthHelper.signOut();

                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/signin_page', (route) => false);
                  },
                  child: Text(
                    "Log out",
                    style: TextStyle(fontSize: 15, color: Colors.green),
                  )),
            ),
            Spacer(),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        _dKey.currentState!.openDrawer();
                      },
                      child: Center(
                        child: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.green,
                        size: 25,
                      ),
                      Text(
                        "Magura, BD",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 19,
                        ),
                      ),
                    ],
                  ),

                  /// image ...
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                      // image: NetworkImage("${data!.photoURL}")
                      image: DecorationImage(
                        image: NetworkImage("${data!.photoURL}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                "Hi ${data?.displayName}",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                  color: Color(0XFF459f2e),
                ),
              ),

              const SizedBox(height: 5),
              const Text(
                "Find your food",
                style: TextStyle(
                  fontSize: 28,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 18),
              TextField(
                cursorHeight: 20,
                autofocus: false,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintText: "Search Food",
                  hintStyle: TextStyle(fontSize: 18),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xff459f2e),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  suffixIcon: Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      color: Color(0xff459f2e),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.filter_list,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              //CategoryCard(),

              ProductCart_Page(),
            ],
          ),
        ),
      ),
    );
  }
}
