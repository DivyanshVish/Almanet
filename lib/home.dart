import 'package:almanet/hover_buttoons.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'firebase_options.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,

        actions: [
         Hover_Button(text: 'Contact Us', defaultcolor: Colors.grey.shade600, hovercolor: Colors.blue, ontap: (){}),
          Hover_Button(text: 'Blog', defaultcolor: Colors.grey.shade600, hovercolor: Colors.blue, ontap: (){}),
          Hover_Button(text: 'About Us', defaultcolor: Colors.grey.shade600, hovercolor: Colors.blue, ontap: (){}),
          Hover_Button(text: 'Services', defaultcolor: Colors.grey.shade600, hovercolor: Colors.blue, ontap: (){}),
          Hover_Button(text: 'Login', defaultcolor: Colors.grey.shade600, hovercolor: Colors.blue, ontap: (){}),
          Hover_Button(text: 'Register', defaultcolor: Colors.grey.shade600, hovercolor: Colors.blue, ontap: (){}),



        ],
        title:  Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 5),
          child: Text('Almanet',style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.blue.shade900
          ),),
        ),

      ),
      body:
        Column(
          children : [
            Center(
              child: Text('Welcome to Almanet', style: TextStyle(
                fontSize: 25
              ),),
            ),
          ],
        ),
    );
  }
}
