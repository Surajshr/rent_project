class NewTenantModel {
  String? id;
  String? fullName;
  String? email;
  String? contactNumber;
  String? shiftedDate;
  String? shiftedFrom;
  String? roomTaken;
  String? rentPerMonth;
  String? wasteFee;
  String? electricityPerUnit;

  NewTenantModel(
      {this.fullName,
      this.contactNumber,
      this.shiftedDate,
      this.shiftedFrom,
      this.roomTaken,
      this.rentPerMonth,
      this.wasteFee,
      this.electricityPerUnit,
      this.email,
      this.id = ""});

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'email': email,
        'contactNumber': contactNumber,
        'shiftedDate': shiftedDate,
        'shiftedFrom': shiftedFrom,
        'roomTaken': roomTaken,
        'rentPerMonth': rentPerMonth,
        'wasteFee': wasteFee,
        'electricityPerUnit': electricityPerUnit
      };

  static NewTenantModel fromJson(Map<String, dynamic> json) => NewTenantModel(
        id: json['id'],
        fullName: json['fullName'],
        contactNumber: json['contactNumber'],
        shiftedDate: json['shiftedDate'],
        shiftedFrom: json['shiftedFrom'],
        roomTaken: json['roomTaken'],
        rentPerMonth: json['rentPerMonth'],
        wasteFee: json['wasteFee'],
        electricityPerUnit: json['electricityPerUnit'],
        email: json['email'],
      );
}
