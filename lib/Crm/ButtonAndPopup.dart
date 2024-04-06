import 'package:flutter/material.dart';

import '../constants/hover_buttoons.dart';

String? _selectedCompany;
String? _selectedCompanyGroup;
String? _numberOfTeamMembers;

Padding ButtonAndPopup(BuildContext context) {
  return Padding(
    padding: const EdgeInsetsDirectional.only(end: 20),
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
              width: 0,
              defaultcolor: Colors.grey.shade600,
              fontsize: 23,
              hovercolor: Colors.green,
              ontap: () {},
              text: 'Sales',
            ),
          ),
          const SizedBox(width: 5),
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 20),
            child: Hover_Button(
              width: 0,
              defaultcolor: Colors.grey.shade600,
              fontsize: 23,
              hovercolor: Colors.green,
              ontap: () {},
              text: 'Reports',
            ),
          ),
          const SizedBox(width: 5),
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 20),
            child: Hover_Button(
              width: 0,
              defaultcolor: Colors.grey.shade600,
              fontsize: 23,
              hovercolor: Colors.green,
              ontap: () {},
              text: 'Configuration',
            ),
          ),
          const SizedBox(width: 5),
          InkWell(
            hoverColor: Colors.transparent,
            onTap: () {},
            child: const Padding(
              padding: EdgeInsetsDirectional.only(end: 20),
              child: Icon(Icons.settings),
            ),
          )
        ],
        leading: InkWell(
          onTap: () {},
          child: const Icon(
            Icons.dehaze_rounded,
            size: 35,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                // Add functionality for the "New" button here
              },
              child: const Text(
                'New',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                // Show popup when "Generate Lead" button is pressed
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          content: SizedBox(
                            width: MediaQuery.of(context).size.width *
                                0.4, // 40% of screen width
                            height: MediaQuery.of(context).size.height *
                                0.4, // 30% of screen height
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Need help to reach the target?',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.close,
                                          color: Colors.black,
                                          size: 30,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  height: 10,
                                  thickness: 1,
                                  color: Colors.black,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    'How many leads would you like?',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: DropdownButton<String>(
                                    hint: const Text('Select Company'),
                                    value: _selectedCompany,
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
                                      setState(() {
                                        _selectedCompany = newValue;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: DropdownButton<String>(
                                    hint: const Text('Select the Industries'),
                                    value: _selectedCompanyGroup,
                                    items: <String>[
                                      'Automobiles & Components',
                                      'Industry',
                                      'Banks & Insurance',
                                      'Consumer Durables & Apparel',
                                      'Consumer Services',
                                      'Energy & Utilities',
                                      'Media',
                                      'Retailing',
                                      'Software & Services',
                                      'Telecommunication Services',
                                      'Transportation',
                                      'Health Care Equipment & Services',
                                      'Materials',
                                      'Pharmaceuticals, Biotechnology & Life Sciences',
                                      'Real Estate',
                                      'Consumer Staples',
                                      'Diversified Financials & Financial Services',
                                      'Food & Beverage & Tobacco',
                                      'Capital Goods',
                                      'Consumer Discretionary',
                                      'Commercial & Professional Services',
                                      'Independent Power and Renewable Electricity Producers',
                                    ].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedCompanyGroup = newValue;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: TextField(
                                    decoration: const InputDecoration(
                                      labelText: 'Number of leads',
                                      border: OutlineInputBorder(),
                                    ),
                                    style: const TextStyle(
                                      fontSize: 14, // Adjust font size here
                                    ),
                                    onChanged: (value) {
                                      _numberOfTeamMembers = value;
                                    },
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 15,
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // TODO: Add functionality to generate leads
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                          backgroundColor: Colors.green,
                                        ),
                                        child: const Text(
                                          'Generate Leads',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 15,
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                          backgroundColor: Colors.green,
                                        ),
                                        child: const Text(
                                          'Close',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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