class MyValidators {

  static String validateLocation(String value) {
    if (value.length < 8) {
      return 'Vnesite ulico, hišna št. in kraj';
    } else {
      return null;
    }
  }

  static String validateQuantity(String value) {
    if (value != null && value.length > 0) {
      String val = value.replaceAll('.', '');
      val = val.replaceAll(',', '');
      if (double.parse(val) > 20) {
        return 'Maksimalno: 20';
      }
    } else if (value.length == 0) {
      return 'Vnesite približno količino';
    }
    return null;
  }

  static String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter Valid Email';
    } else {
      return null;
    }
  }

  static String validatePhone(String value) {
    if (value.isNotEmpty) {
      if (value.length != 9) {
        return 'Mobile Number must be of 10 digit';
      }
    }
    return null;
  }
}