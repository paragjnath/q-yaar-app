import 'package:flutter/material.dart';
import 'package:q_yaar/constants/environment_config.dart';
import 'package:q_yaar/ui/q_yaar_app.dart';

void main() async {
  await EnvironmentConfig.ensureInitilized();
  runApp(const QYaarApp());
}