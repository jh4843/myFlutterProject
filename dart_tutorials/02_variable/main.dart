void main() {
  // ############################################################
  // 01_values
  // ############################################################
  String strName = "Jaehyeok";
  int nAge = 1;

// ############################################################
  // 02_dynamic or var
  // ############################################################
  var vHi = "hi";
  // vHi = 3; // error
  dynamic vVal;

  vVal = "요금";
  vVal = 500;

  print("1) My name is " + strName);
  print("2) My name is $strName");
  print(nAge.toString());
  print(vVal);

  if (strName is String) {
    print("strName is String!!");
  }

  if (vVal is int) {
    print("vVal is int");
  }

  vVal = "Test Text";

  if (vVal is String) {
    print("vVal is string");
  }

  // ############################################################
  // 03_nullable
  // ############################################################
  String? canNull = "Jin";
  canNull = null;

  if (canNull != null) {
    canNull.isNotEmpty;
  } else {
    print(canNull);
  }

  // ############################################################
  // 04_final
  // ############################################################
  final String constWorld = 'a';
  //constWorld = 'b'; // fail

  // ############################################################
  // 05_late
  // ############################################################
  late final String lateWorld;
  print(constWorld);
  //print(lateWorld); // fail can not print the value before assign value;
  lateWorld = 'c';
  //lateWorld = 'd'; // fail

  // ############################################################
  // 06_const
  // ############################################################
  const max_price = 5000;
  // const tt = fetchAPI() // fail because when compile, compiler can not know the type of the variable. so use final at that time.
}
