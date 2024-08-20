import 'package:easybuyadmin/routers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    //  widget container

    Widget admincontrol({String pic = "", String text = "", dynamic ontap}) {
      return GestureDetector(
        onTap: ontap,
      
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(pic), fit: BoxFit.fill)),
            ),
            Text(text)
          ],
        ),
      );
    }

    print(FirebaseAuth.instance.currentUser?.email);

    //  product row widget

    return Scaffold(
        appBar: AppBar(
          title: const Text("administrator"),
          backgroundColor: const Color.fromARGB(255, 164, 142, 203),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.pushNamed(context, Routers.loginpage);
              },
            ),
          ],
        ),
        body: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  admincontrol( ontap: (){Navigator.pushNamed(context, Routers.sellerverification);},pic: "https://cdn-icons-png.freepik.com/256/11630/11630009.png?ga=GA1.1.2079983318.1682091982&semt=ais_hybrid", text: "seller verification",),
                 


                  admincontrol( ontap: (){Navigator.pushNamed(context, Routers.allproduct);}, pic: "https://cdn-icons-png.freepik.com/256/9198/9198158.png?ga=GA1.1.2079983318.1682091982&semt=ais_hybrid", text: "all product")
                ],
              ),
             admincontrol( ontap: (){Navigator.pushNamed(context, Routers.orderlist);}, pic:  "https://cdn-icons-png.freepik.com/256/4290/4290854.png?ga=GA1.1.2079983318.1682091982&semt=ais_hybrid", text: "order list")
            ],
          ),
        ));
  }
}
