class LeadsModel {
  String? id;
  String? name;
  String? email;
  String? address;
  String? contact;
  String? companyName;
  String? numberOfTeamMembers;
  String? selectedCompanyGroup;

  LeadsModel({
    this.id,
    this.name,
    this.email,
    this.address,
    this.contact,
    this.companyName,
    this.numberOfTeamMembers,
    this.selectedCompanyGroup,
  });
  factory LeadsModel.fromJson(Map<String, dynamic> json, String? id) {
    return LeadsModel(
      id: id,
      name: json['name'],
      email: json['email'],
      address: json['address'],
      contact: json['contact'],
      companyName: json['companyName'],
      numberOfTeamMembers: json['numberOfTeamMembers'],
      selectedCompanyGroup: json['selectedCompanyGroup'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'contact': contact,
      'companyName': companyName,
      'numberOfTeamMembers': numberOfTeamMembers,
      'selectedCompanyGroup': selectedCompanyGroup,
    };
  }
}
