double rentCalculation(
    {required double rent,
    required double wasteFee,
    required int rateOfElectricityPerUnit,
    required double month,
    required int previousRent,
    required int electricityUnit}) {
  final totalRent = (rent * month) +
      (wasteFee) +
      (electricityUnit * rateOfElectricityPerUnit) +
      previousRent;

  return totalRent;
}
