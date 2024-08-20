
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easybuyadmin/routers.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Allproduct extends StatefulWidget {
  const Allproduct({super.key});

  @override
  State<Allproduct> createState() => _AllproductState();
}

class _AllproductState extends State<Allproduct> {

  final CollectionReference productslist=FirebaseFirestore.instance.collection('products');

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: const Text("All products"),
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
      body: StreamBuilder(stream: productslist.snapshots(), builder:(context, AsyncSnapshot snapshot) {
        if(snapshot.hasData){
          return ListView.builder(itemCount: snapshot.data!.docs.length, itemBuilder: (context, index) {
            final DocumentSnapshot productsnap=snapshot.data.docs[index];
          return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Image.network(productsnap["image"]),
                        title: Text(productsnap["productname"]),
                        subtitle: Text(productsnap["selleremail"]),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () async {
                                    await FirebaseStorage.instance
                                        .refFromURL(productsnap["image"])
                                        .delete();
                                    await FirebaseFirestore.instance.collection("products")
                                        .doc(productsnap.id)
                                        .delete();
                                  },
                                  icon: const Icon(Icons.delete)),
                              
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
        },);
        }
        return Container();
        
        
        
      },
      
      ),
    );
  }
}