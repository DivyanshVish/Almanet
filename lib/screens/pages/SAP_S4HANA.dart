import 'package:almanet/Crm/crm_web_page.dart';
import 'package:almanet/constants/FadeContainer.dart';
import 'package:almanet/constants/Fade_Info.dart';
import 'package:almanet/screens/pages/Login.dart';
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

class sap_s4hana extends StatefulWidget {
  const sap_s4hana({super.key});

  @override
  State<sap_s4hana> createState() => _sap_s4hanaState();
}

class _sap_s4hanaState extends State<sap_s4hana> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double ww = Get.width;
      double hh = Get.height;
      return sliverappbar_collapsed(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: ww,
              height: hh * 0.55,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/hana.png'),
                      fit: BoxFit.fill)),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: hh * 0.04),
                      child: Text(
                        'SAP S/4HANA',
                        style: TextStyle(
                            fontSize: ww * 0.009, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: hh * 0.01),
                      child: Text(
                        'Stand apart with Intelligent ERP',
                        style: TextStyle(
                            fontSize: ww * 0.02,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900),
                      ),
                    ),
                    Image(image: AssetImage('assets/images/img_4.png')),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: hh * 0.005,
            ),
            FadeInContainer(
                width: ww,
                height: hh * 0.6,
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: hh * 0.04),
                        child: Text(
                          'What is SAP S/4HANA?',
                          style: TextStyle(
                              fontSize: ww * 0.015,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                      ),
                      Container(
                        width: ww * 0.5,
                        height: hh * 0.17,
                        child: Text(
                          'SAP S/4HANA is the next-generation business suite designed to Run Simple in a digital economy. Built for the revolutionary SAP S/4 HANA in-memory computing platform, it fundamentally redefines how enterprise software creates value across industries with instant insight. SAP S/4HANA also personalizes the user experience on any device and natively connects to Big Data, the Internet of Things, and business and social networks – all in real time.',
                          style: TextStyle(fontSize: ww * 0.009),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      Container(
                        width: ww * 0.5,
                        child: FadeInFromLeftToRight(widgets: [
                          Container(
                            width: ww * 0.1,
                            height: hh * 0.3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: hh * 0.025),
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/sap_s4hana/img_6.png'),
                                    height: hh * 0.1,
                                    width: ww * 0.15,
                                  ),
                                ),
                                Text(
                                  'Address industry-specific requirements with proven best practices for 26 verticals and enable new business models as your marketplace evolves',
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: ww * 0.008),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: ww * 0.1,
                            height: hh * 0.3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: hh * 0.025),
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/sap_s4hana/img_7.png'),
                                    height: hh * 0.1,
                                    width: ww * 0.15,
                                  ),
                                ),
                                Text(
                                  'Revolutionize business processes with intelligent automation — supported by artificial intelligence and robotic process automation',
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: ww * 0.008),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: ww * 0.1,
                            height: hh * 0.3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: hh * 0.025),
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/sap_s4hana/img.png'),
                                    height: hh * 0.1,
                                    width: ww * 0.15,
                                  ),
                                ),
                                Text(
                                  'Make better decisions faster with embedded analytics, a conversational interface, and digital assistants',
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: ww * 0.008),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: ww * 0.1,
                            height: hh * 0.3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: hh * 0.025),
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/sap_s4hana/img_1.png'),
                                    height: hh * 0.1,
                                    width: ww * 0.15,
                                  ),
                                ),
                                Text(
                                  'Meet your IT landscape goals with hybrid, cloud, and on-premise scenarios that share a consistent data model, code line, and user experience',
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: ww * 0.008),
                                )
                              ],
                            ),
                          ),
                        ], duration: Duration(milliseconds: 1500)),
                      )
                    ],
                  ),
                ),
                colour: Colors.white,
                duration: Duration(milliseconds: 500)),
            Divider(
              color: Color(0xFF082444),
              thickness: 3,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: hh*0.05, horizontal: ww*0.2),
              color: Colors.grey.shade100,

                width: ww,
                height: hh * 0.6,
                child: Center(
                  child: Row(
                    children: [
                      Container(
                        width: 0.25*ww,
                        child: Column(
                          children: [
                            Text('Navigate constantly changing industries', style: TextStyle(fontSize: ww*0.014, fontWeight: FontWeight.bold, color: Colors.indigo.shade900),softWrap: true,),
                            Padding(
                              padding:  EdgeInsets.symmetric(vertical: hh*0.02),
                              child: Text('Gain the industry depth your business requires and the cloud benefits you want.', style: TextStyle(fontSize: ww*0.0085),),
                            ),
                            Text('Support industry-specific business processes with out-of-the-box functionality.', style: TextStyle(fontSize: ww*0.0085),),
                            Padding(
                              padding:  EdgeInsets.symmetric(vertical: hh*0.02),
                              child: Text('Transform your business model with innovative revenue capabilities, including subscription- and consumption-based billing.', style: TextStyle(fontSize: ww*0.0085),),
                            ),
                            Text('Create new, customer-focused products and services with highly flexible configuration, pricing, and quoting capabilities across engagement models.', style: TextStyle(fontSize: ww*0.0085),),
                            Padding(
                              padding:  EdgeInsets.symmetric(vertical: hh*0.02),
                              child: Text('Monitor contract performance with real-time profitability analysis and revenue recognition', style: TextStyle(fontSize: ww*0.0085),),
                            ),
                          ],
                        ),
                      ),

                      Image(image: AssetImage('assets/images/sap_s4hana/img_2.png'),height: hh*0.45,width: ww*0.35,alignment: Alignment.center,)

                    ],
                  ),
                ),
            )


          ],
        ),
      ));
    });
  }
}
