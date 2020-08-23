import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loadingWidget = Container(
  child: Center(
    child: SpinKitThreeBounce(
      color: Colors.white,
      size: 20.0,
    ),
  ),
);
