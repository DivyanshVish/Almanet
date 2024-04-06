
import 'package:almanet/screens/home.dart';

import 'package:almanet/screens/pages/Login.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey.shade100,
      child: Align(
        alignment: Alignment.center,
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
                      height: Get.height * 0.2,
                      width: Get.width * 0.2,
                    )),
              ),
              Container(
                width: Get.width * 0.4,
                height: Get.height * 0.7,
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
                        "Create a New Account",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 7),
                      child: Container(
                        width: Get.width * 0.127,
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(25)),
                        child: const ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/img.png'),
                          ),
                          title: Text(
                            'Sign up with Google',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 30.0),
                            child: Divider(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            'OR',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Expanded(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('First Name'),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 15.0),
                                    child: Container(
                                      height: Get.height * 0.05,
                                      width: Get.width * 0.16,
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 0.3),
                                        color: Colors.white,
                                      ),
                                      padding: const EdgeInsets.only(left: 7),
                                      child: const TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Last Name'),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 15.0),
                                    child: Container(
                                      height: Get.height * 0.05,
                                      width: Get.width * 0.16,
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 0.3),
                                        color: Colors.white,
                                      ),
                                      padding: const EdgeInsets.only(left: 7),
                                      child: const TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Text('Email'),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Container(
                              width: Get.width * 0.35,
                              height: Get.height * 0.05,
                              decoration: BoxDecoration(
                                border: Border.all(width: 0.3),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.only(left: 7),
                              child: const TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Email',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Password'),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 15.0),
                                    child: Container(
                                      height: Get.height * 0.05,
                                      width: Get.width * 0.16,
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 0.3),
                                        color: Colors.white,
                                      ),
                                      padding: const EdgeInsets.only(left: 7),
                                      child: const TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Confirm Password'),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 15.0),
                                    child: Container(
                                      height: Get.height * 0.05,
                                      width: Get.width * 0.16,
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 0.3),
                                        color: Colors.white,
                                      ),
                                      padding: const EdgeInsets.only(left: 7),
                                      child: const TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Align(
                          alignment: Alignment.center,
                          child: RichText(
                            text: const TextSpan(children: [
                              TextSpan(
                                  text:
                                      'By creating the account, you accept the '),
                              TextSpan(
                                  text: 'Privacy Policies',
                                  style: TextStyle(color: Colors.blue))
                            ]),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              alignment: Alignment.center,
                              backgroundColor: Colors.blue.shade800,
                              minimumSize:
                                  Size(Get.width * 0.27, Get.height * 0.06)),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )),
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
                      const Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Get.to(() => const login());
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white, fontSize: 19),
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
  }
}
