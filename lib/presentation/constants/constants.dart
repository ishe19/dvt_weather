import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


String degreeString = "\u00b0";


enum ImageThemes {
  sea,
  forest
}


enum WeatherStatesEnum {
  sunny,
  cloudy,
  rainy
}


double selectedIconSize = 35;
double unselectedIconSize = 30;

const titleStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.w500);


Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

 double screenHeight(BuildContext context, {double dividedBy = 1}) {
return screenSize(context).height / dividedBy;
}

 double screenWidth(BuildContext context, {double dividedBy = 1}) {
return screenSize(context).width / dividedBy;
}

Widget addVerticalHeight(double height){
  return SizedBox(
    height: height,
  );
}

Widget addHorizontalHeight(double height){
  return SizedBox(
    height: height,
  );
}


Future<void> showAppDialog(BuildContext context, Widget dialog) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return dialog;
    },
  );
}

void showToast(BuildContext context, String text) {
  Fluttertoast.showToast(
      msg: text, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
}

void showConnectionErrorToast(BuildContext context){
  Fluttertoast.showToast(msg: "An error occurred please check your internet connection", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
}

