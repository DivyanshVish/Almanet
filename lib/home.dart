import 'package:almanet/hover_buttoons.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  bool innerBoxIsScrolled = false;
  @override
  void initState() {
    super.initState();
    print('ii ${innerBoxIsScrolled}');

    _scrollController.addListener(() {
      setState(() {
        innerBoxIsScrolled =
            _scrollController.position.pixels > Get.height * 0.4 ? true : false;
        print('ss ${innerBoxIsScrolled}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double ww = Get.width;
        double fs = ww * 0.0165;
        double hh = Get.height;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 100,
            actions: [
              Hover_Button(
                text: 'Contact Us',
                defaultcolor: Colors.grey.shade600,
                hovercolor: Colors.blue,
                ontap: () {},
                fontsize: fs,
                width: ww,
              ),
              Hover_Button(
                text: 'Blog',
                defaultcolor: Colors.grey.shade600,
                hovercolor: Colors.blue,
                ontap: () {},
                fontsize: fs,
                width: ww,
              ),
              Hover_Button(
                text: 'Careers',
                defaultcolor: Colors.grey.shade600,
                hovercolor: Colors.blue,
                ontap: () {},
                fontsize: fs,
                width: ww,
              ),
              Hover_Button(
                text: 'About Us',
                defaultcolor: Colors.grey.shade600,
                hovercolor: Colors.blue,
                ontap: () {},
                fontsize: fs,
                width: ww,
              ),
              Hover_Button(
                text: 'Services',
                defaultcolor: Colors.grey.shade600,
                hovercolor: Colors.blue,
                ontap: () {},
                fontsize: fs,
                width: ww,
              ),
              Hover_Button(
                text: 'Login',
                defaultcolor: Colors.grey.shade600,
                hovercolor: Colors.blue,
                ontap: () {
                  Get.to(() => login());
                },
                fontsize: fs,
                width: ww,
              ),
              Hover_Button(
                text: 'Register',
                defaultcolor: Colors.grey.shade600,
                hovercolor: Colors.blue,
                ontap: () {
                  Get.to(() => signup());
                },
                fontsize: fs,
                width: ww,
              ),
            ],
            title: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 5),
                child: Image(
                  image: AssetImage('assets/images/logo.jpg'),
                  width: ww * 0.3,
                )),
          ),
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    'Welcome to Almanet',
                    style: TextStyle(fontSize: fs),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: ww * 0.15),
                    child: FadeInFromLeftToRight(
                      widgets: [
                        Home_Services(
                            Title: 'SAP Services',
                            Description:
                                'We provide SAP technology and industry expertise, tangible solutions, and a personalized approach to ensure you maximize your software investment.',
                            ontap: () {}),
                        Home_Services(
                            Title: 'SAP Services',
                            Description:
                                'We provide SAP technology and industry expertise, tangible solutions, and a personalized approach to ensure you maximize your software investment.',
                            ontap: () {}),
                        Home_Services(
                            Title: 'SAP Services',
                            Description:
                                'We provide SAP technology and industry expertise, tangible solutions, and a personalized approach to ensure you maximize your software investment.',
                            ontap: () {}),
                        Home_Services(
                            Title: 'SAP Services',
                            Description:
                                'We provide SAP technology and industry expertise, tangible solutions, and a personalized approach to ensure you maximize your software investment.',
                            ontap: () {}),
                        Home_Services(
                            Title: 'SAP Services',
                            Description:
                                'We provide SAP technology and industry expertise, tangible solutions, and a personalized approach to ensure you maximize your software investment.',
                            ontap: () {}),
                      ],
                      duration: Duration(milliseconds: 500),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
