// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hovering/hovering.dart';
//
// class Home extends StatefulWidget {
//   const Home({Key? key});
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   final ScrollController _scrollController = ScrollController();
//   bool innerBoxIsScrolled = false;
//
//   @override
//   void initState() {
//     super.initState();
//     print('ii ${innerBoxIsScrolled}');
//
//     _scrollController.addListener(() {
//       setState(() {
//         innerBoxIsScrolled =
//         _scrollController.position.pixels > Get.height * 0.4 ? true : false;
//         print('ss ${innerBoxIsScrolled}');
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double ww = Get.width;
//     double fs = ww * 0.0165;
//     double hh = Get.height;
//     return Scaffold(
//       body: CustomScrollView(
//         controller: _scrollController,
//         slivers: <Widget>[
//           SliverAppBar(
//             collapsedHeight: hh * 0.08,
//             actions: [
//               HoverButton(
//                 text: 'Contact Us',
//                 defaultColor: Colors.grey.shade600,
//                 hoverColor: Colors.blue,
//                 onTap: () {
//                   print(innerBoxIsScrolled);
//                 },
//                 fontSize: fs,
//                 width: ww,
//               ),
//               HoverButton(
//                 text: 'Blog',
//                 defaultColor: Colors.grey.shade600,
//                 hoverColor: Colors.blue,
//                 onTap: () {},
//                 fontSize: fs,
//                 width: ww,
//               ),
//               HoverButton(
//                 text: 'Careers',
//                 defaultColor: Colors.grey.shade600,
//                 hoverColor: Colors.blue,
//                 onTap: () {},
//                 fontSize: fs,
//                 width: ww,
//               ),
//               HoverButton(
//                 text: 'About Us',
//                 defaultColor: Colors.grey.shade600,
//                 hoverColor: Colors.blue,
//                 onTap: () {},
//                 fontSize: fs,
//                 width: ww,
//               ),
//               HoverButton(
//                 text: 'Services',
//                 defaultColor: Colors.grey.shade600,
//                 hoverColor: Colors.blue,
//                 onTap: () {
//                   Get.to(() => Products());
//                 },
//                 fontSize: fs,
//                 width: ww,
//               ),
//               HoverButton(
//                 text: 'Login',
//                 defaultColor: Colors.grey.shade600,
//                 hoverColor: Colors.blue,
//                 onTap: () {
//                   Get.to(() => Login());
//                 },
//                 fontSize: fs,
//                 width: ww,
//               ),
//               HoverButton(
//                 text: 'Register',
//                 defaultColor: Colors.grey.shade600,
//                 hoverColor: Colors.blue,
//                 onTap: () {
//                   Get.to(() => SignUp());
//                 },
//                 fontSize: fs,
//                 width: ww,
//               ),
//             ],
//             expandedHeight: hh * 0.5,
//             pinned: true,
//             floating: true,
//             backgroundColor: Colors.white,
//             flexibleSpace: FlexibleSpaceBar(
//               title: innerBoxIsScrolled
//                   ? Padding(
//                 padding: const EdgeInsets.only(left: 15.0, top: 5),
//                 child: Image(
//                   image: AssetImage('assets/images/logo.jpg'),
//                   width: ww * 0.3,
//                 ),
//               )
//                   : null,
//               background: Image.asset(
//                 'assets/images/ii.png',
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Text(
//                     'Welcome to Almanet',
//                     style: TextStyle(
//                       fontSize: fs,
//                       decoration: TextDecoration.none,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: ww * 0.15),
//                     child: FadeInFromLeftToRight(
//                       widgets: [
//                         HomeServices(
//                           title: 'SAP Services',
//                           description:
//                           'We provide SAP technology and industry expertise, tangible solutions, and a personalized approach to ensure you maximize your software investment.',
//                           onTap: () {},
//                         ),
//                         HomeServices(
//                           title: 'SAP Services',
//                           description:
//                           'We provide SAP technology and industry expertise, tangible solutions, and a personalized approach to ensure you maximize your software investment.',
//                           onTap: () {},
//                         ),
//                         HomeServices(
//                           title: 'SAP Services',
//                           description:
//                           'We provide SAP technology and industry expertise, tangible solutions, and a personalized approach to ensure you maximize your software investment.',
//                           onTap: () {},
//                         ),
//                         HomeServices(
//                           title: 'SAP Services',
//                           description:
//                           'We provide SAP technology and industry expertise, tangible solutions, and a personalized approach to ensure you maximize your software investment.',
//                           onTap: () {},
//                         ),
//                         HomeServices(
//                           title: 'SAP Services',
//                           description:
//                           'We provide SAP technology and industry expertise, tangible solutions, and a personalized approach to ensure you maximize your software investment.',
//                           onTap: () {},
//                         ),
//                       ],
//                       duration: Duration(milliseconds: 500),
//                     ),
//                   ),
//                   SizedBox(height: 150),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
