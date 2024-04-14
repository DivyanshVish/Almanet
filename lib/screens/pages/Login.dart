import 'package:almanet/screens/home.dart';
import 'package:almanet/constants/hover_buttoons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'Sign_Up.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double ww = Get.width;
      double hh = Get.height;
      double fs = ww * 0.015;
      return Material(
        color: Colors.grey.shade100,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: InkWell(
                      onTap: () {
                        Get.to(() => const Home());
                      },
                      child: Image(
                        image: const AssetImage('assets/images/logo.jpg'),
                        height: hh * 0.2,
                        width: ww * 0.2,
                      )),
                ),
                Container(
                  width: Get.width * 0.4,
                  height: Get.height * 0.6,
                  color: Colors.grey.shade200,
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text('Welcome to Almanet',
                      // style: TextStyle(
                      //   fontSize: 30,
                      //   color: Colors.deepOrange,
                      //   fontWeight: FontWeight.bold,
                      // ),),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          "Login to your account",
                          style: TextStyle(
                            fontSize: ww * 0.016,
                            color: Colors.blue.shade900,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10, bottom: 7),
                        child: Container(
                          width: Get.width * 0.127,
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(25)),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: const AssetImage('assets/images/img.png'),
                              radius: ww * 0.01,
                            ),
                            title: Text(
                              'Sign in with Google',
                              style: TextStyle(color: Colors.white, fontSize: ww * 0.0085),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 30.0),
                              child: Divider(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Text(
                              'OR',
                              style: TextStyle(fontSize: ww * 0.008),
                            ),
                          ),
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: 30.0),
                              child: Divider(),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(fontSize: ww * 0.008),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Container(
                                height: Get.height * 0.05,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: Colors.white,
                                ),
                                padding: const EdgeInsets.all(12),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Email',
                                    hintStyle: TextStyle(color: Colors.grey, fontSize: ww * 0.008),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'Password',
                              style: TextStyle(fontSize: ww * 0.008),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: Get.height * 0.05,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.all(12),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                  hintStyle: TextStyle(color: Colors.grey, fontSize: ww * 0.008),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Hover_Button(
                            defaultcolor: Colors.grey,
                            hovercolor: Colors.blue,
                            ontap: () {},
                            text: 'Forgot Password',
                            fontsize: ww * 0.0075,
                            width: ww,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.white, fontSize: ww * 0.015),
                            ),
                            style: ElevatedButton.styleFrom(alignment: Alignment.center, backgroundColor: Colors.blue.shade800, minimumSize: Size(Get.width * 0.27, Get.height * 0.06))),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    width: Get.width * 0.4,
                    height: Get.height * 0.1,
                    child: Row(
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(fontSize: ww * 0.008),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Get.to(() => const signup());
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(color: Colors.white, fontSize: ww * 0.0081),
                            ),
                            style: ElevatedButton.styleFrom(
                                alignment: Alignment.center,
                                backgroundColor: Colors.blue.shade800,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ))),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
