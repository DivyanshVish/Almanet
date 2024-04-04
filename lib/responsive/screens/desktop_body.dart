import 'package:flutter/material.dart';

import '../../constants/hover_buttoons.dart';

class DesktopBody extends StatelessWidget {
  const DesktopBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 20),
      //padding: const EdgeInsets.only(right: 8.0, top: 5),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "CRM",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 20),
              child: Hover_Button(
                text: 'Sales',
                defaultcolor: Colors.grey.shade600,
                hovercolor: Colors.blue,
                ontap: () {},
                fontsize: 23,
                width: 0,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 20),
              child: Hover_Button(
                text: 'Reporting',
                defaultcolor: Colors.grey.shade600,
                hovercolor: Colors.blue,
                ontap: () {},
                fontsize: 23,
                width: 0,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 20),
              child: Hover_Button(
                text: 'Configuration',
                defaultcolor: Colors.grey.shade600,
                hovercolor: Colors.blue,
                ontap: () {},
                fontsize: 23,
                width: 0,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            InkWell(
              child: const Padding(
                padding: EdgeInsetsDirectional.only(end: 20),
                child: Icon(Icons.settings),
              ),
              onTap: () {},
            )
          ],
          leading: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.dehaze_rounded,
                size: 35,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Button to create a new something
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                onPressed: () {
                  // Add functionality for the "New" button here
                },
                child: const Text(
                  'New',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 20), // Spacer

              // Button to generate lead
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                onPressed: () {
                  // Show popup when "Generate Lead" button is pressed
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        contentPadding: EdgeInsets.zero,
                        content: SizedBox(
                          width: MediaQuery.of(context).size.width *
                              0.6, // 80% of screen width
                          height: MediaQuery.of(context).size.height *
                              0.4, // 60% of screen height
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Custom appbar-like header with close icon
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Need help to reach the target?',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.close,
                                          color: Colors.black, size: 30),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              // Content of the popup window
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            const Text(
                                              'How many leads would you like?',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            const SizedBox(height: 20),
                                            DropdownButton<String>(
                                              hint: const Text(
                                                  'Select no. of leads'),
                                              items: <String>[
                                                '< 5 leads',
                                                '5-10 leads',
                                                '> 10 leads',
                                              ].map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                // Implement what to do when company is selected
                                              },
                                            ),
                                            const SizedBox(height: 20),
                                            DropdownButton<String>(
                                              items: <String>[
                                                'Companies',
                                                'Companies and their contacts',

                                              ].map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                // Implement what to do when company group is selected
                                              },
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Close'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Text(
                  'Generate Lead',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
