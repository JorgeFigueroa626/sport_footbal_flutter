// ignore_for_file: await_only_futures

import 'package:flutter/material.dart';
import 'package:sport_football/page/json_array_ex3_page.dart';

void main()async {
   await  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
    home: JsonArrayEx3Page(),
  ));
}
