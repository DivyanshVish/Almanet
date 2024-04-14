import 'package:almanet/Crm/crm_web_page.dart';
import 'package:almanet/screens/pages/Login.dart';
import 'package:almanet/constants/hover_buttoons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../constants/FadeContainer.dart';

class sliverappbar_collapsed extends StatefulWidget {
  Widget child;
  sliverappbar_collapsed({super.key, required this.child});

  @override
  State<sliverappbar_collapsed> createState() => _sliverappbar_collapsedState();
}

class _sliverappbar_collapsedState extends State<sliverappbar_collapsed> {
  final ScrollController _scrollController = ScrollController();
  bool innerBoxIsScrolled = false;

  void initState() {
    super.initState();

    _scrollController.addListener(() {
      setState(() {
        innerBoxIsScrolled = _scrollController.position.pixels > Get.height * 0.4 ? true : false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double ww = Get.width;
    double fs = ww * 0.0165;
    double hh = Get.height;
    return LayoutBuilder(builder: (context, constraints) {
      double ww = Get.width;
      double fs = ww * 0.0165;
      double hh = Get.height;
      return Scaffold(
          appBar: web_appbar(),
          body: CustomScrollView(
              controller: _scrollController,
              // double appBarHeight = hh * 0.5; // Initial height
              // Color appBarColor = Colors.white; // Initial color

              // Change height and color when scrolled down
              // print(innerBoxIsScrolled);
              slivers: <Widget>[
                SliverAppBar(
                  collapsedHeight: hh * 0.08,
                  actions: [
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
                    Padding(
                      padding: EdgeInsets.only(right: ww * 0.1),
                      child: Hover_Button(
                        text: 'CRM',
                        defaultcolor: Colors.grey.shade600,
                        hovercolor: Colors.blue,
                        ontap: () {
                          Get.to(() => const CRMPage());
                        },
                        fontsize: fs,
                        width: ww,
                      ),
                    ),

                    // Hover_Button(text: 'Login', defaultcolor: Colors.grey.shade600, hovercolor: Colors.blue, ontap: (){Get.to(() => login());},fontsize: fs,width: ww,),
                    // Hover_Button(text: 'Register', defaultcolor: Colors.grey.shade600, hovercolor: Colors.blue, ontap: (){Get.to(() => signup());},fontsize: fs,width: ww,),
                  ],
                  // expandedHeight: hh * 0.5,
                  pinned: true,
                  // floating: true, // Make the app bar float
                  backgroundColor: Colors.white,
                  flexibleSpace: FlexibleSpaceBar(
                      title: Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 5),
                    child: Image(
                      image: const AssetImage('assets/images/sap.jpeg'),
                      width: ww * 0.3,
                    ),
                  )),
                ),
                SliverToBoxAdapter(
                  child: SingleChildScrollView(child: widget.child),
                ),
              ]));
    });
  }
}

class sliverappbar extends StatefulWidget {
  Widget child;
  sliverappbar({super.key, required this.child});

  @override
  State<sliverappbar> createState() => _sliverappbarState();
}

class _sliverappbarState extends State<sliverappbar> {
  final ScrollController _scrollController = ScrollController();
  bool innerBoxIsScrolled = false;

  void initState() {
    super.initState();

    _scrollController.addListener(() {
      setState(() {
        innerBoxIsScrolled = _scrollController.position.pixels > Get.height * 0.4 ? true : false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // double ww = Get.width;
    // double fs = ww * 0.0165;
    // double hh = Get.height;
    return LayoutBuilder(builder: (context, constraints) {
      double ww = Get.width;
      double fs = ww * 0.0165;
      double hh = Get.height;
      return Scaffold(
          appBar: web_appbar(),
          body: CustomScrollView(
              controller: _scrollController,
              // double appBarHeight = hh * 0.5; // Initial height
              // Color appBarColor = Colors.white; // Initial color

              // Change height and color when scrolled down
              // print(innerBoxIsScrolled);
              slivers: <Widget>[
                SliverAppBar(
                  collapsedHeight: hh * 0.08,
                  actions: [
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
                    Padding(
                      padding: EdgeInsets.only(right: ww * 0.1),
                      child: Hover_Button(
                        text: 'CRM',
                        defaultcolor: Colors.grey.shade600,
                        hovercolor: Colors.blue,
                        ontap: () {
                          Get.to(() => const CRMPage());
                        },
                        fontsize: fs,
                        width: ww,
                      ),
                    ),

                    // Hover_Button(text: 'Login', defaultcolor: Colors.grey.shade600, hovercolor: Colors.blue, ontap: (){Get.to(() => login());},fontsize: fs,width: ww,),
                    // Hover_Button(text: 'Register', defaultcolor: Colors.grey.shade600, hovercolor: Colors.blue, ontap: (){Get.to(() => signup());},fontsize: fs,width: ww,),
                  ],
                  expandedHeight: hh * 0.5,
                  pinned: true,
                  // floating: true, // Make the app bar float
                  backgroundColor: Colors.white,
                  flexibleSpace: FlexibleSpaceBar(
                    title: this.innerBoxIsScrolled
                        ? Padding(
                            padding: EdgeInsets.only(left: 15.0, top: 5),
                            child: Image(
                              image: const AssetImage('assets/images/sap.jpeg'),
                              width: ww * 0.3,
                            ),
                          )
                        : null,
                    background: Image.asset(
                      'assets/images/ii.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: widget.child,
                ),
              ]));
    });
  }
}

class web_appbar extends StatefulWidget implements PreferredSizeWidget {
  const web_appbar({super.key});
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  State<web_appbar> createState() => _web_appbarState();
}

class _web_appbarState extends State<web_appbar> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double ww = Get.width;
      // double fs = ww * 0.0165;
      double hh = Get.height;
      return AppBar(
        backgroundColor: Color(0xFF082444),
        title: Padding(
          padding: EdgeInsets.only(left: ww * 0.15),
          child: Image(
            image: const AssetImage('assets/images/logo.jpg'),
            width: ww * 0.1,
            height: hh * 0.06,
          ),
        ),
        toolbarHeight: hh * 0.06,
        actions: [
          Hover_Button(
            text: 'Careers',
            defaultcolor: Colors.white,
            hovercolor: Colors.white,
            ontap: () {},
            fontsize: ww * 0.011,
            width: ww,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ww * 0.005),
            child: const Icon(
              FontAwesomeIcons.facebook,
              color: Colors.white,
              size: 18,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ww * 0.005),
            child: const Icon(
              FontAwesomeIcons.instagram,
              color: Colors.white,
              size: 18,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ww * 0.005),
            child: const Icon(
              FontAwesomeIcons.twitter,
              color: Colors.white,
              size: 18,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ww * 0.005),
            child: const Icon(
              FontAwesomeIcons.youtube,
              color: Colors.white,
              size: 18,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: ww * 0.005, right: ww * 0.11),
            child: SizedBox(
              height: hh * 0.03,
              width: ww * 0.075,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const login());
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                    if (!states.contains(MaterialState.hovered)) {
                      return Colors.green; // Change color when hovered
                    }
                    return const Color(0xFF082444); // Default color
                  }),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Colors.green, width: 1),
                    ),
                  ),
                ),
                child: Text(
                  'Login/Signup',
                  style: TextStyle(color: Colors.white, fontSize: ww * 0.008, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}

class Web_footer extends StatefulWidget {
  const Web_footer({super.key});

  @override
  State<Web_footer> createState() => _Web_footerState();
}

class _Web_footerState extends State<Web_footer> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double ww = Get.width;
      // double fs = ww * 0.0165;
      double hh = Get.height;
      return FadeInContainer_footer(
          width: double.infinity,
          height: hh * 0.5,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ww * 0.15,
            ),
            child: Row(
              children: [
                Container(
                  width: ww * 0.18,
                  height: hh * 0.5,
                  color: Color(0xFF082444),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: ww * 0.012),
                          child: Divider(
                            color: Colors.green,
                            height: 8,
                            thickness: 3,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(top: hh * 0.07, bottom: hh * 0.15),
                          child: Image(
                            image: AssetImage('assets/images/logo.jpg'),
                            width: ww * 0.15,
                            // height: hh * 0.2,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Discover more About our world',
                            style: TextStyle(color: Colors.white, fontSize: ww * 0.01, fontWeight: FontWeight.w500),
                          ),
                          Hover_Button(text: 'Join Our Team >', defaultcolor: Colors.white, hovercolor: Colors.white, ontap: () {}, fontsize: ww * 0.009, width: ww)
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: hh * 0.08, left: ww * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: hh * 0.015),
                                child: Text(
                                  'Solutions',
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: ww * 0.007),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: hh * 0.01),
                                child: Hover_Button(text: 'SAP S/4HANA', defaultcolor: Colors.white, hovercolor: Colors.white, ontap: () {}, fontsize: ww * 0.006, width: ww),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: hh * 0.01),
                                child: Hover_Button(text: 'SAP S/4HANA', defaultcolor: Colors.white, hovercolor: Colors.white, ontap: () {}, fontsize: ww * 0.006, width: ww),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: hh * 0.01),
                                child: Hover_Button(text: 'SAP S/4HANA', defaultcolor: Colors.white, hovercolor: Colors.white, ontap: () {}, fontsize: ww * 0.006, width: ww),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: hh * 0.01),
                                child: Hover_Button(text: 'SAP S/4HANA', defaultcolor: Colors.white, hovercolor: Colors.white, ontap: () {}, fontsize: ww * 0.006, width: ww),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: hh * 0.015),
                                child: Text(
                                  'About us',
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: ww * 0.007),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: hh * 0.01),
                                child: Hover_Button(text: 'Know Us More', defaultcolor: Colors.white, hovercolor: Colors.white, ontap: () {}, fontsize: ww * 0.006, width: ww),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: hh * 0.01),
                                child: Hover_Button(text: 'Blogs', defaultcolor: Colors.white, hovercolor: Colors.white, ontap: () {}, fontsize: ww * 0.006, width: ww),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: hh * 0.01),
                                child: Hover_Button(text: 'Contact Us', defaultcolor: Colors.white, hovercolor: Colors.white, ontap: () {}, fontsize: ww * 0.006, width: ww),
                              ),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: hh * 0.02, right: ww * 0.01),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sign up to our Blog.',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: ww * 0.01, color: Colors.white),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: ww * 0.025),
                              child: OutlinedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                                    if (!states.contains(MaterialState.hovered)) {
                                      return Colors.white; // Change color when hovered
                                    }
                                    return Colors.blue; // Default color
                                  }),
                                  backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                                    if (!states.contains(MaterialState.hovered)) {
                                      return Colors.transparent; // Change color when hovered
                                    }
                                    return Colors.white; // Default color
                                  }),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0.0), // Set to 0.0 for rectangular shape
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Subscribe',
                                  style: TextStyle(
                                    fontSize: ww * 0.008,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: hh * 0.025),
                        child: Row(
                          children: [
                            Image(
                              image: const AssetImage('assets/images/sap.jpeg'),
                              width: ww * 0.05,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: ww * 0.005),
                              child: IconButton(
                                icon: Icon(
                                  FontAwesomeIcons.facebook,
                                  size: 25,
                                ),
                                onPressed: () {},
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0), // Set to 0 for rectangular shape
                                    ),
                                  ),
                                ),
                                color: Color(0xFF082444),
                                hoverColor: Colors.white,
                                padding: EdgeInsets.all(5),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: ww * 0.005),
                              child: IconButton(
                                icon: Icon(
                                  FontAwesomeIcons.instagram,
                                  size: 25,
                                ),
                                onPressed: () {},
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0), // Set to 0 for rectangular shape
                                    ),
                                  ),
                                ),
                                color: Color(0xFF082444),
                                hoverColor: Colors.white,
                                padding: EdgeInsets.all(5),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: ww * 0.005),
                              child: IconButton(
                                icon: Icon(
                                  FontAwesomeIcons.twitter,
                                  size: 25,
                                ),
                                onPressed: () {},
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0), // Set to 0 for rectangular shape
                                    ),
                                  ),
                                ),
                                color: Color(0xFF082444),
                                hoverColor: Colors.white,
                                padding: EdgeInsets.all(5),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: ww * 0.005),
                              child: IconButton(
                                icon: Icon(
                                  FontAwesomeIcons.youtube,
                                  size: 25,
                                ),
                                onPressed: () {},
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0), // Set to 0 for rectangular shape
                                    ),
                                  ),
                                ),
                                color: Color(0xFF082444),
                                hoverColor: Colors.white,
                                padding: EdgeInsets.all(5),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          duration: Duration(milliseconds: 500));
    });
  }
}
