class Converter {
  static DateTime stringToDateTime(String value) {
    var date = DateTime.parse(value);
    return date;
  }

  static double stringToDouble(String value) {
    var data = double.parse(value);
    return data;
  }

  static double daysToMonth(int days) {
    var month = stringToDouble((days / 30).toStringAsFixed(3));
    return month;
  }

  static int stringToInt(String value){
    var intValue = int.parse(value);
    return intValue;
  }
}
