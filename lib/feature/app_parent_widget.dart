import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:test_app/core/di/injection_container_common.dart';
import 'package:test_app/core/network/network_info.dart';
import 'package:test_app/core/routing/routing.dart';


class AppParentWidget extends StatefulWidget {
  const AppParentWidget({super.key});

  @override
  State<StatefulWidget> createState() => AppParentWidgetState();
}

class AppParentWidgetState extends State<AppParentWidget> {
  late StreamSubscription _connectivitySubscription;

  @override
  void initState() {
    super.initState();

    _connectivitySubscription =
        serviceLocator<NetworkInfo>().startConnectivityListener();

  }


  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      title: "Flutter Test",
      routerConfig: newRouter,
      scrollBehavior: MyCustomScrollBehavior().copyWith(
        scrollbars: false,
      ),
      debugShowCheckedModeBanner: false,

    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };

  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return StretchingOverscrollIndicator(
      axisDirection: details.direction,
      child: child,
    );
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const ClampingScrollPhysics();
  }
}
