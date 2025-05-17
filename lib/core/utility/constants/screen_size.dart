import 'package:flutter/material.dart';

double screenMaxWidth({required BuildContext context}) {
  return MediaQuery.of(context).size.width;
}

double screenMaxHeight({required BuildContext context}) {
  return MediaQuery.of(context).size.height;
}