import 'package:flutter/material.dart';
import 'package:test_app/core/di/injection_container_common.dart';
import 'package:test_app/core/shared_pref/prefrences.dart';

import 'core/config/flavour.dart';
import 'feature/app_parent_widget.dart';

void main() async {
  F.appFlavor = Flavor.dev;
  WidgetsFlutterBinding.ensureInitialized();
  PreferenceUtils.init();
  await initDI();
  runApp(const AppParentWidget());
}
