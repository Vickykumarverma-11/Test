import 'package:flutter/material.dart';

enum Endpoints { items, details }

class FlavourConfig {
  String? apptitle;
  Map<Endpoints, String>? apiEndpoint;
  String? imageLoction;
  ThemeData? theme;
  FlavourConfig({
    this.apptitle = "Flavour",
    this.imageLoction = "",
  }) {
    this.theme = ThemeData.light();
  }
}
