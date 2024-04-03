import 'package:almanet/Crm/crm_web_page.dart';
import 'package:almanet/Fade_Info.dart';
import 'package:almanet/Login.dart';
import 'package:almanet/Sign_Up.dart';
import 'package:almanet/home_services.dart';
import 'package:almanet/hover_buttoons.dart';
import 'package:almanet/try.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hovering/hovering.dart';
import 'firebase_options.dart';

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
        innerBoxIsScrolled = _scrollController.position.pixels > Get.height*0.4 ? true : false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
  final blog_title = 'Is “digital transformation” just a buzzword? Thoughts from a tech CEO on how we can give meaning back to the phrase';
  final blog_desc = "One of the key benefits of technology like enterprise resource planning (ERP) is the automation of workflows and manual tasks. And yet, despite significant investments in ERP, many manufacturers still manually track information, which not only slows down operations but increases the chance of human error. In an economy where every opportunity to gain a competitive edge can make a material impact on a company’s success, most companies with extensive shop floor operations can’t afford delays or errors. Businesses that have the vision to increase speed and agility should consider automation tools that collect, aggregate, and analyze that data, and then communicate back to the shop floor with an appropriate response. ";
final blog_image =AssetImage('assets/images/img_5.png');


    return LayoutBuilder(
      builder: (context,constraints)
      {

        double ww = Get.width;
        double fs = ww*0.0165;
        double hh = Get.height;
       return Scaffold(
         appBar: AppBar(
           backgroundColor: Color(0xFF082444),
           title: Padding(
             padding:  EdgeInsets.only(left: ww*0.2),
             child: Image(

               image: AssetImage('assets/images/logo.jpg'),
               width: ww * 0.1,
               height: hh*0.06,
             ),
           ),
           toolbarHeight: hh*0.06,
           actions: [
             Hover_Button(text: 'Careers', defaultcolor: Colors.white, hovercolor: Colors.white, ontap: (){},fontsize: ww*0.011,width: ww,),
             Padding(
               padding:  EdgeInsets.symmetric(horizontal: ww*0.005),
               child: Icon(
                 FontAwesomeIcons.facebook,
                 color: Colors.white,
                 size: 18,
               ),
             ),
             Padding(
               padding:  EdgeInsets.symmetric(horizontal: ww*0.005),
               child: Icon(
                 FontAwesomeIcons.instagram,
                 color: Colors.white,
                 size: 18,
               ),
             ),Padding(
               padding:  EdgeInsets.symmetric(horizontal: ww*0.005),
               child: Icon(
                 FontAwesomeIcons.twitter,
                 color: Colors.white,
                 size: 18,
               ),
             ),Padding(
               padding:  EdgeInsets.symmetric(horizontal: ww*0.005),
               child: Icon(
                 FontAwesomeIcons.youtube,
                 color: Colors.white,
                 size: 18,
               ),
             ),
             Padding(
               padding:  EdgeInsets.only(left: ww*0.005, right: ww*0.11),
               child: SizedBox(
                 height: hh*0.03,
                 width: ww*0.075,
                 child: ElevatedButton(onPressed: (){Get.to(()=>login());}, child: Text('Login/Signup',style: TextStyle(color: Colors.white, fontSize: ww*0.008, fontWeight: FontWeight.bold),),
                   style: ButtonStyle(

                     backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                       if (!states.contains(MaterialState.hovered)) {
                         return Colors.green; // Change color when hovered
                       }
                       return Color(0xFF082444); // Default color
                     }),
                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                       RoundedRectangleBorder(

                         borderRadius: BorderRadius.circular(8),
                         side: BorderSide(color: Colors.green, width: 1),
                       ),
                     ),
                   ),),
               ),
             )

           ],
         ),
         body: CustomScrollView(
           controller: _scrollController,
             // double appBarHeight = hh * 0.5; // Initial height
             // Color appBarColor = Colors.white; // Initial color
         
             // Change height and color when scrolled down
            // print(innerBoxIsScrolled);
             slivers: <Widget>[

               SliverAppBar(
                 collapsedHeight: hh*0.08,
                 actions: [

                   Hover_Button(text: 'About Us', defaultcolor: Colors.grey.shade600, hovercolor: Colors.blue, ontap: (){},fontsize: fs,width: ww,),
                   Hover_Button(text: 'Services', defaultcolor: Colors.grey.shade600, hovercolor: Colors.blue, ontap: (){},fontsize: fs,width: ww,),
                   Hover_Button(text: 'Contact Us', defaultcolor: Colors.grey.shade600, hovercolor: Colors.blue, ontap: (){}, fontsize: fs, width: ww,),
                   Hover_Button(text: 'Blog', defaultcolor: Colors.grey.shade600, hovercolor: Colors.blue, ontap: (){},fontsize: fs,width: ww,),
                   Padding(
                     padding:  EdgeInsets.only(right: ww*0.1),
                     child: Hover_Button(text: 'CRM', defaultcolor: Colors.grey.shade600, hovercolor: Colors.blue, ontap: (){Get.to(()=>CRMPage());},fontsize: fs,width: ww,),
                   ),


                   // Hover_Button(text: 'Login', defaultcolor: Colors.grey.shade600, hovercolor: Colors.blue, ontap: (){Get.to(() => login());},fontsize: fs,width: ww,),
                   // Hover_Button(text: 'Register', defaultcolor: Colors.grey.shade600, hovercolor: Colors.blue, ontap: (){Get.to(() => signup());},fontsize: fs,width: ww,),



                 ],
                 expandedHeight: hh * 0.5 ,
                 pinned: true,
                 // floating: true, // Make the app bar float
                 backgroundColor: Colors.white,
                 flexibleSpace: FlexibleSpaceBar(
                   title: this.innerBoxIsScrolled
                       ?  Padding(
             padding: const EdgeInsets.only(left: 15.0,  top: 5),
             child: Image(
             image: AssetImage('assets/images/sap.jpeg'),
             width: ww * 0.3,
             ),
             ) : null,


                   background: Image.asset(
                     'assets/images/ii.png',
                     fit: BoxFit.fill,
                   ),
                 ),
               ),



            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  child: Column(
                    children : [
                      SizedBox(height: 100,),


                      Padding(
                        padding:  EdgeInsets.only(left: ww*0.15, right: ww*0.15, bottom: hh*0.06),
                        child: Column(
                          children: [
                            FadeInFromLeftToRight(widgets: [
                              Container(
                                width: ww*0.2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('SOLUTIONS',style: TextStyle(
                                      fontSize: ww*0.01,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green

                                    ),),
                                    Padding(
                                      padding:  EdgeInsets.only(top: hh*0.02,bottom: hh*0.03),
                                      child: Text('Less cookie-cutter, more tailored expertise',
                                        style: TextStyle(
                                            fontSize: ww*0.015,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.indigo.shade900

                                        ),
                                      ),
                                    ),
                                    Text('Using holistic thinking and a proven methodology to solving problems, we’re enterprise resource planning (ERP) and SAP software experts committed to five core innovative practices.',style: TextStyle(
                                      fontSize: ww*0.008
                                    ),),

                                  ],
                                ),
                              ),
                              Image(image: AssetImage('assets/images/img_4.png'),
                              width: ww*0.3,
                                height: hh*0.3,
                              )
                            ], duration: Duration(milliseconds: 500)),
                            SizedBox(height: hh*0.05,),
                            FadeInFromLeftToRight(
                              widgets: [
                            
                              Home_Services(Title: 'SAP Services', Description: 'We provide SAP technology and industry expertise, tangible solutions, and a personalized approach to ensure you maximize your software investment.', ontap: (){}),
                                Home_Services(Title: 'SAP Services', Description: 'We provide SAP technology and industry expertise, tangible solutions, and a personalized approach to ensure you maximize your software investment.', ontap: (){}),
                                Home_Services(Title: 'SAP Services', Description: 'We provide SAP technology and industry expertise, tangible solutions, and a personalized approach to ensure you maximize your software investment.', ontap: (){}),
                                Home_Services(Title: 'SAP Services', Description: 'We provide SAP technology and industry expertise, tangible solutions, and a personalized approach to ensure you maximize your software investment.', ontap: (){}),
                                Home_Services(Title: 'SAP Services', Description: 'We provide SAP technology and industry expertise, tangible solutions, and a personalized approach to ensure you maximize your software investment.', ontap: (){}),
                            
                            
                              ],
                              duration: Duration(milliseconds: 500),
                            ),

                          ],
                        ),
                      ),
                      Divider(
                        thickness: 3,
                        height: hh*0.02,
                        color: Color(0xFF082444),
                      ),
                  Padding(
                    padding:  EdgeInsets.only(left: ww*0.15, right: ww*0.15, bottom: hh*0.1, top: hh*0.1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(child: Text('Blog',style: TextStyle(color: Colors.blue, fontSize: ww*0.015),),
                        alignment: Alignment.topLeft,),
                      FadeInFromLeftToRight(widgets: [
                        AnimatedWidgetColumn(title: blog_title, image: blog_image, desc: blog_desc, ontap: (){}),
                        AnimatedWidgetColumn(title: blog_title, image: blog_image, desc: blog_desc, ontap: (){}),
                        AnimatedWidgetColumn(title: blog_title, image: blog_image, desc: blog_desc, ontap: (){}),
                      ], duration: Duration(seconds: 2)),

                      ],
                    ),
                  ),

                      SizedBox(height: 700,)
                    ],
                  ),
                ),
              ),
            ),
         ]
          ),
       );
      },

    );
  }
}
