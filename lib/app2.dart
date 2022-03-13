import 'package:milkman_application_4/main_common.dart';

import 'flavor_config.dart';
import 'package:flutter/material.dart';

void main() {
  // Inject our own configurations
  // Coffee Beans

  final app2 = FlavourConfig()
    ..apptitle = "app2"
    ..apiEndpoint = {
      Endpoints.items: "random.api.dev/items",
      Endpoints.details: "random.api.dev/item"
    }
    ..theme = ThemeData.light();

  maincommon(app2);
}
