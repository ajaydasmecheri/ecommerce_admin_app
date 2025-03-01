

import 'package:easybuyadmin/firebase_options.dart';
import 'package:easybuyadmin/root.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const Rootpage());
}