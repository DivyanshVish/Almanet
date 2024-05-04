import 'package:flutter/material.dart';

import '../../models/lead_model.dart';

class CRMListTile extends StatelessWidget {
  const CRMListTile({
    super.key,
    required this.lead,
    required this.onPressEdit,
  });

  final VoidCallback onPressEdit;
  final LeadsModel lead;

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
                  'Name : ${lead.name}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Expanded(
                child: Text(
                  'Contact : ${lead.contact}',
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
                  'Address : ${lead.address}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Expanded(
                child: Text(
                  'Email : ${lead.email}',
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
                  'Company Name : ${lead.companyName}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Expanded(
                child: Text(
                  'Selected Industries : ${lead.selectedCompanyGroup}',
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
                  'Number of Leads : ${lead.numberOfTeamMembers}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Expanded(
                child: IconButton(
                  //splashColor: Colors.green,
                  splashRadius: 20,
                  icon: const Icon(Icons.edit),
                  onPressed: onPressEdit,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
