import 'package:flutter/material.dart';

class CRMListTile extends StatelessWidget {
  const CRMListTile({
    super.key,
    required this.nameController,
    required this.contactController,
    required this.addressController,
    required this.emailController,
    required this.companyController,
    required this.selectedCompanyGroup,
    required this.numberOfTeamMembersController,
  });

  final TextEditingController nameController;
  final TextEditingController contactController;
  final TextEditingController addressController;
  final TextEditingController emailController;
  final TextEditingController companyController;
  final String selectedCompanyGroup;
  final TextEditingController numberOfTeamMembersController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Name : ${nameController.text}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Expanded(
                child: Text(
                  'Contact : ${contactController.text}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Address : ${addressController.text}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Expanded(
                child: Text(
                  'Email : ${emailController.text}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Company Name : ${companyController.text}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Expanded(
                child: Text(
                  'Selected Industries : $selectedCompanyGroup',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Number of Leads : ${numberOfTeamMembersController.text}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
