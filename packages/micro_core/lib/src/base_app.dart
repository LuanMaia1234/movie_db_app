import 'package:flutter/material.dart';
import 'package:micro_core/src/micro_app.dart';
import 'package:micro_core/src/micro_core_utils.dart';

abstract class BaseApp {
  List<MicroApp> get microApps;

  Map<String, WidgetBuilderArgs> get baseRoutes;

  final Map<String, WidgetBuilderArgs> routes = {};

  void registerRoutes() {
    if (baseRoutes.isNotEmpty) routes.addAll(baseRoutes);
    for (var microApp in microApps) {
      routes.addAll(microApp.routes);
    }
  }

  void registerInjections() {
    for (var microApp in microApps) {
      microApp.injection();
    }
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    var widgetBuilder = routes[settings.name];
    if (widgetBuilder == null) return null;
    return MaterialPageRoute(
      builder: (context) => widgetBuilder(context, settings.arguments),
    );
  }
}
