class MyData {
  static List<String> photoList = [
    '',
    '',
    '',
  ];

  static List<String> imgBackList = [
    'assets/photo1.png',
    'assets/photo2.png',
    'assets/photo3.png',
  ];

  static String location;
  static double lat;
  static double lng;
  static double quantity;
  static int woodType;
  static int quiz1;
  static int quiz2;
  static int quiz3;
  static String phone;
  static String email;

  static int userId;
  static int orderId;

  static void printData() {
    print(location);
    print(lat);
    print(lng);
    print(quantity);
    print(woodType);
    print(quiz1);
    print(quiz2);
    print(quiz3);
    print(phone);
    print(email);
    print(userId);
    print(orderId);
  }
}