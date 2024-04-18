import 'package:almanet/responsive/ui/widgets/crm_edit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CRMListTile extends StatelessWidget {
  CRMListTile({
    super.key,
    required this.nameController,
    required this.contactController,
    required this.addressController,
    required this.emailController,
    required this.companyController,
    required this.selectedCompanyGroup,
    required this.numberOfTeamMembersController,
  });

  final String nameController;
  final String contactController;
  final String addressController;
  final String emailController;
  final String companyController;
  final String selectedCompanyGroup;
  final String numberOfTeamMembersController;

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
                  'Name : $nameController',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Expanded(
                child: Text(
                  'Contact : $contactController',
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
                  'Address : $addressController',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Expanded(
                child: Text(
                  'Email : $emailController',
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
                  'Company Name : $companyController',
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
          Row(
            children: [
              Expanded(
                child: Text(
                  'Number of Leads : $numberOfTeamMembersController',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Expanded(
                child: const EditButtonCrmPage(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
