import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

otpTextContainer(TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.only(right: 2.0, left: 2.0),
    child: new Container(
      alignment: Alignment.center,
      decoration: new BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.1),
          border:
              new Border.all(width: 1.0, color: Color.fromRGBO(0, 0, 0, 0.1)),
          borderRadius: new BorderRadius.circular(4.0)),
      child: new TextField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        textAlign: TextAlign.center,
        controller: controller,
        autofocus: false,
        enabled: false,
        style: TextStyle(fontSize: 24.0, color: Colors.black),
      ),
    ),
  );
}

otpStartingEndingPadding(double left, double right) {
  return Padding(
    padding: EdgeInsets.only(left: left, right: right),
    child: new Container(
      color: Colors.transparent,
    ),
  );
}

optKeyboard(String number) {
  return Text(number,
      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400),
      textAlign: TextAlign.center);
}
