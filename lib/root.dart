
import 'package:easybuyadmin/routers.dart';
import 'package:easybuyadmin/screens/allproduct.dart';
import 'package:easybuyadmin/screens/homepage.dart';
import 'package:easybuyadmin/screens/loginpage.dart';
import 'package:easybuyadmin/screens/orderlist.dart';
import 'package:easybuyadmin/screens/registerpage.dart';
import 'package:easybuyadmin/screens/sellerverification.dart';
import 'package:easybuyadmin/screens/splashscreen.dart';
import 'package:flutter/material.dart';

class Rootpage extends StatelessWidget {
  const Rootpage({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routers.splashpage,
      routes:  {
        Routers.splashpage:(context) => const Splashpage(),
        Routers.loginpage:(context) => const Loginpage(),
        Routers.registerpage:(context) => const Registerpage(),
        Routers.homepage:(context) => const Homepage(),
        Routers.allproduct:(context) => const Allproduct(),
        Routers.sellerverification:(context) => const Sellerverification(),
        Routers.orderlist:(context) => const Orderlist(),
        


      },
    );
  }
}