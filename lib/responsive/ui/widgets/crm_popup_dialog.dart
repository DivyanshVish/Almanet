import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:almanet/constants/dummy_data/industries_dummy_data.dart';

class CRMPopupDialogWidget extends StatefulWidget {
  const CRMPopupDialogWidget({
    super.key,
    this.selectedCompanyGroup,
    required this.nameController,
    required this.emailController,
    required this.addressController,
    required this.contactController,
    required this.companyController,
    required this.onGenerateLeadsButton,
    required this.selectIndustriesOnChange,
    required this.numberOfTeamMembersController,
    required this.selectedCompanyGroupController,
  });

  final String? selectedCompanyGroup;
  final VoidCallback onGenerateLeadsButton;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController addressController;
  final TextEditingController contactController;
  final TextEditingController companyController;
  final Function(String?) selectIndustriesOnChange;
  final TextEditingController numberOfTeamMembersController;
  final TextEditingController selectedCompanyGroupController;

  @override
  State<CRMPopupDialogWidget> createState() => _CRMPopupDialogWidgetState();
}

class _CRMPopupDialogWidgetState extends State<CRMPopupDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    splashRadius: 20,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              color: Colors.black12,
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'How many leads would you like?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black54),
                borderRadius: BorderRadius.circular(4),
              ),
              child: DropdownButton<String>(
                hint: const Text('Select the Industries'),
                value: widget.selectedCompanyGroup,
                underline: const SizedBox(),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                items: dummyIndustriesData.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: widget.selectIndustriesOnChange,
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Number of leads',
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(
                fontSize: 14,
              ),
              controller: widget.numberOfTeamMembersController,
            ),
            const SizedBox(height: 18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Lead Information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: widget.nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: widget.contactController,
                  decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Contact'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: widget.addressController,
                  decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Address'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: widget.emailController,
                  decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Email Address'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: widget.companyController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Company Name',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: widget.onGenerateLeadsButton,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('Generate Leads'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('Close'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
