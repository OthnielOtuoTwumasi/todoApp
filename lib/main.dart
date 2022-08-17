import 'package:flutter/material.dart';
import 'package:todoapp/route/todo_app_route1.dart';
import 'todo_app_theme_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(
      ProviderScope(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const TodoAppRoute1(),
          theme: ToDoAppThemeData().themeData,
        ),
      ),
    );
