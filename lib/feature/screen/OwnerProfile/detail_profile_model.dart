class DetailProfileModel {
  String? name;
  int? number;
  String? email;
  DateTime? dateTime;
  String? address;
  int? familyNumber;
  double? rent;
  double? wasteFee;
  double? electricityFee;

  DetailProfileModel(
      {this.name,
      this.number,
      this.email,
      this.dateTime,
      this.address,
      this.familyNumber,
      this.rent,
      this.wasteFee,
      this.electricityFee});
}


List<DetailProfileModel> detailProfileData =[
  DetailProfileModel(
    name: 'Suraj Shrestha',
    number: 9840220077,
    email: "Suraj575shrestha@gmail.com",
    dateTime: DateTime.now(),
    address: "sanothimi,Bhaktapur",
    familyNumber: 1,
    rent: 1500.00,
    wasteFee: 150.00,
    electricityFee: 100.0
  ),
];
