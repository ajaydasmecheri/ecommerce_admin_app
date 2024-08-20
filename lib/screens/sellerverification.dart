import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';

class Sellerverification extends StatefulWidget {
  const Sellerverification({Key? key}) : super(key: key);

  @override
  State<Sellerverification> createState() => _SellerverificationState();
}

class _SellerverificationState extends State<Sellerverification> {
  final CollectionReference sellerdetails =
      FirebaseFirestore.instance.collection('seller');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('all seller details'),
        backgroundColor: const Color.fromARGB(255, 164, 142, 203),
      ),
      body: StreamBuilder(
        stream: sellerdetails.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot newsellerdetails =
                    snapshot.data.docs[index];
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    
                    child: Column(
                      children: [
                        SwipeActionCell(
                          /// this key is necessary
                          key: ObjectKey([index]),
                          trailingActions: <SwipeAction>[
                            SwipeAction(

                                /// this is the same as iOS native
                                performsFirstActionWithFullSwipe: true,
                                title: "delete",
                                onTap: (handler) async{
                                  await FirebaseFirestore.instance.collection("seller").doc(newsellerdetails.id).delete();

                                },
                                color: const Color.fromARGB(255, 164, 142, 203),),
                          ],
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'seller email: ${newsellerdetails["selleremail"]}'),
                                  Text(
                                      'adress: ${newsellerdetails["selleraddress"]}'),
                                  Text(
                                      'name: ${newsellerdetails["sellername"]}'),
                                  Text(
                                      'number: ${newsellerdetails["sellerphonenumber"]}'),
                                  Text(
                                      'password: ${newsellerdetails["sellerpassword"]}'),
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
