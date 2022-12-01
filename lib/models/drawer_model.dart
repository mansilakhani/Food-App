import 'package:flutter/material.dart';

class DrawerModel {
  final IconData? icon;
  final String? name;
  String? route;

  DrawerModel({required this.icon, required this.name, this.route});
}
