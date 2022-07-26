import 'package:flutter/material.dart';
import 'package:todoapp/route/Route1.dart';
import 'package:todoapp/themeData.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const TodoApp(),
        theme: themeData(),
      ),
    ));
