import 'dart:async';
import 'package:flutter/material.dart';
import 'package:prixity_ecommerce_app/core/bindings/initial_bindings.dart';
import 'app.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitalBindings.initialize();
  runApp(const App());
}
