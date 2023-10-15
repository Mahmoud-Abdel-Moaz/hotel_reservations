import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../core/local/keys.dart';

const token =
    'eyJhbGciOiJSUzI1NiJ9.eyJpZCI6MzAzLCJ0eXBlIjoidXNlciIsInJhbiI6IkJORU5WSVBOTlFUWVBMS0tVQ0JWIiwic3RhdHVzIjoxfQ.YGV-jGKZj1Lp4SqlM3aiF6Aov6YVF6lZRMpKvx_Zdrpjj4C1zE-JSTKtjVboQ9de58TUViyVOc4JwiktjF_4yxnYzIrw449s584j2GiqUpxfp6OPmfAj8BAbfN_M4RoU5PXEjhcNVh5uNRtxtvxZtpECrl72_22T4he3LbqISMNHzVh5eprIKIFLt_pM7cyRKt3Njf8I89CLnq5nUpiDHnMMForamKq9jubmiYPOHpFvijEE3-jusRk0F1T32zMY_0AELXnpqhbbx6HtmMdxBahnrUNyznacdVwaSrNus8vX01N8zEcfRvkRzYuqjnZXr9jrm2iriHq80iicUG99GQ';
String selectedTheme = LIGHT_MODE;
setSplashStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarBrightness: Brightness.light, //ios bar icons
    statusBarIconBrightness: Brightness.dark, //ios bar icons
  ));
}

setTransparentStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light, //ios bar icons
    statusBarIconBrightness: Brightness.dark, //ios bar icons
  ));
}

setWhiteStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarBrightness: Brightness.light, //ios bar icons
    statusBarIconBrightness: Brightness.dark, //ios bar icons
  ));
}

navigateTo(context, widget, {void Function()? than}) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    ).then((value) => than);

Future<void> navigateToAndFinish(context, widget) =>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ), (Route<dynamic> route) {
      return false;
    });

void navigateToAndReplacement(context, widget) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

String convertDate({required String input, String format = 'MMM dd,yyyy'}) {
  var inputFormat = DateFormat('yyyy-MM-dd');
  var inputDate = inputFormat.parse(input);
  var outputFormat = DateFormat(format);
  var outputDate = outputFormat.format(inputDate);
  return outputDate;
}
