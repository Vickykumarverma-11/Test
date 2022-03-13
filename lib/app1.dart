import 'package:milkman_application_4/main_common.dart';

import 'flavor_config.dart';
import 'package:flutter/material.dart';

void main() {
  // Inject our own configurations
  // Coffee Beans

  final app1 = FlavourConfig()
    ..apptitle = "app1"
    ..apiEndpoint = {
      Endpoints.items: "api.app1.dev/items",
      Endpoints.details: "api.app1.dev/items"
    }
    ..theme = ThemeData.dark();

  maincommon(app1);
}
