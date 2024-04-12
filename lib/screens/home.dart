import 'package:almanet/Crm/crm_web_page.dart';
import 'package:almanet/constants/Fade_Info.dart';
import 'package:almanet/screens/pages/Login.dart';
import 'package:almanet/screens/pages/SAP_S4HANA.dart';
import 'package:almanet/screens/pages/Sign_Up.dart';
import 'package:almanet/constants/home_services.dart';
import 'package:almanet/constants/hover_buttoons.dart';
import 'package:almanet/screens/styles.dart';
import 'package:almanet/try.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hovering/hovering.dart';
import '../constants/FadeContainer.dart';
import '../constants/blogs.dart';
import '../firebase_options.dart';

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

    _scrollController.addListener(() {
      setState(() {
        innerBoxIsScrolled =
            _scrollController.position.pixels > Get.height * 0.4 ? true : false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    final blog_title =
        'Is “digital transformation” just a buzzword? Thoughts from a tech CEO on how we can give meaning back to the phrase';
    final blog_desc =
        "One of the key benefits of technology like enterprise resource planning (ERP) is the automation of workflows and manual tasks. And yet, despite significant investments in ERP, many manufacturers still manually track information, which not only slows down operations but increases the chance of human error. In an economy where every opportunity to gain a competitive edge can make a material impact on a company’s success, most companies with extensive shop floor operations can’t afford delays or errors. Businesses that have the vision to increase speed and agility should consider automation tools that collect, aggregate, and analyze that data, and then communicate back to the shop floor with an appropriate response. ";
    final blog_image = const AssetImage('assets/images/img_5.png');

    return LayoutBuilder(

     builder: (context, constraint)
      {
        double ww = Get.width;
        double fs = ww * 0.0165;
        double hh = Get.height;
        return sliverappbar(child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: ww * 0.15,
                      right: ww * 0.15,
                      bottom: hh * 0.06),
                  child: Column(
                    children: [
                      FadeInFromLeftToRight(widgets: [
                        Container(
                          width: ww * 0.2,
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SOLUTIONS',
                                style: TextStyle(
                                    fontSize: ww * 0.01,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: hh * 0.02,
                                    bottom: hh * 0.03),
                                child: Text(
                                  'Less cookie-cutter, more tailored expertise',
                                  style: TextStyle(
                                      fontSize: ww * 0.015,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.indigo.shade900),
                                ),
                              ),
                              Text(
                                'Using holistic thinking and a proven methodology to solving problems, we’re enterprise resource planning (ERP) and SAP software experts committed to five core innovative practices.',
                                style:
                                TextStyle(fontSize: ww * 0.008),
                              ),
                            ],
                          ),
                        ),
                        Image(
                          image: const AssetImage(
                              'assets/images/img_4.png'),
                          width: ww * 0.3,
                          height: hh * 0.3,
                        )
                      ], duration: const Duration(milliseconds: 500)),
                      SizedBox(
                        height: hh * 0.05,
                      ),
                      FadeInFromLeftToRight(
                        widgets: [
                          Home_Services(
                              Title: 'SAP Services',
                              Description:
                              'We provide SAP technology and industry expertise, tangible solutions, and a personalized approach to ensure you maximize your software investment.',
                              ontap: () {}),
                          Home_Services(
                              Title: 'SAP S/4HANA',
                              Description:
                              'We provide SAP technology and industry expertise, tangible solutions, and a personalized approach to ensure you maximize your software investment.',
                              ontap: () {Get.to(()=>sap_s4hana());}),
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
                        duration: const Duration(milliseconds: 500),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                  height: hh * 0.02,
                  color: const Color(0xFF082444),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: ww * 0.15,
                    right: ww * 0.15,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top: hh * 0.1, left: ww*0.015),
                        child: Align(
                          child: Text(
                            'Blog',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: ww * 0.015),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(bottom: hh * 0.1,
                        ),
                        child: FadeInFromLeftToRight(widgets: [
                          AnimatedWidgetColumn(
                              title: blog_title,
                              image: blog_image,
                              desc: blog_desc,
                              ontap: () {}),
                          AnimatedWidgetColumn(
                              title: blog_title,
                              image: blog_image,
                              desc: blog_desc,
                              ontap: () {}),
                          AnimatedWidgetColumn(
                              title: blog_title,
                              image: blog_image,
                              desc: blog_desc,
                              ontap: () {}),
                        ], duration: const Duration(seconds: 2)),
                      ),

                    ],
                  ),
                ),
                FadeInContainer(
                  width: double.infinity,
                  height: hh*0.45,
                  colour: Color(0xFF082444),
                  child: Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Padding(
                        padding:  EdgeInsets.only(bottom: 3),
                        child: Text('Join our team',style: TextStyle(color: Colors.white, fontSize: ww*0.015, fontWeight: FontWeight.bold),),
                      ),
                      Text('We engage and hire the best talent',style: TextStyle(color: Colors.white, fontSize: ww*0.011, fontWeight: FontWeight.bold),),
                      Container(
                          width: ww*0.3,
                          child: Text('We take a glass half full approach, choosing not to ask what’s the worst that can happen but instead ask what’s the best that can happen.',style: TextStyle(color: Colors.white, fontSize: ww*0.008, ),softWrap: true,textAlign: TextAlign.center,)),
                      Padding(padding: EdgeInsets.only(top: hh*0.03),
                        child: FadeInFromLeftToRight(
                          duration: Duration(milliseconds: 500),
                          widgets: [
                            ElevatedButton(
                              onPressed: () {
                                Get.to(() => const login());
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.resolveWith<Color>((states) {
                                  if (!states.contains(MaterialState.hovered)) {
                                    return Colors.white; // Change color when hovered
                                  }
                                  return Colors.green; // Default color
                                }),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),

                                  ),
                                ),
                              ),
                              child: Text(
                                'DISCOVER MORE ABOUT OUR WORLD',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: ww * 0.008,
                                ),
                              ),
                            ),
                          ],

                        ),),



                    ],
                  )),
                  duration: Duration(milliseconds: 250),
                ),
                Web_footer(),



              ],
            ),
          ),
        ),);
      },
    );
  }
}
