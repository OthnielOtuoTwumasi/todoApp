import 'package:flutter/material.dart';
import 'package:todoapp/route/todo_app_route1.dart';
import 'package:todoapp/theme_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Todo_App_Route1(),
        theme: themeData(),
      ),
    ));
