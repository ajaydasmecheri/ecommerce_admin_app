// ignore_for_file: avoid_print, use_build_context_synchronously


import 'package:easybuyadmin/routers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  TextEditingController remail = TextEditingController();
  TextEditingController rpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register now"),
        backgroundColor: const Color.fromARGB(255, 164, 142, 203),
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height*0.55,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
        
              Padding(
                padding: const EdgeInsets.only( right: 15, left: 15),
                child: TextField(
                  controller: remail,
                  decoration: InputDecoration(
                      hintText: "enter email",
                      icon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
        
        
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: TextField(
                  controller: rpassword,
                  decoration: InputDecoration(
                      hintText: "password",
                      icon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
        
        
              // start login button
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.45,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 164, 142, 203),
                  borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
                ),
                child: TextButton(
                  onPressed: () async {
                    try {
                        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: remail.text.trim(), password: rpassword.text.trim());
        
                    } on FirebaseAuthException catch (e) {
                      print(e.toString());
                    }
        
                    //  alert box code
        
                    showDialog(
                      context: context,
                       builder: (context)
                       {
                        return  AlertDialog(
                          title: const Text("Registration sucessfully"),
                          actions: [
                            Center(child: ElevatedButton(onPressed: (){
                       Navigator.of(context).pushNamed(Routers.loginpage);
                            }, child: const Text("back to loginpage")))
                          ],
                        );
                       });
        
        
        
        
                    //  end code
                  },
                  child: const Text(
                    "REGISTER",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        letterSpacing: 5,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routers.loginpage);
                  },
                  child: const Text(
                    "Go to Login Page",
                    style: TextStyle(color: Colors.black),
                  ))
        
              // end
            ],
          ),
        ),
      ),
    );
  }
}
