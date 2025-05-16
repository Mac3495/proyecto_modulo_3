import 'package:flutter/material.dart';

abstract class AppNavigator {
  void push(String path, {Object? args, VoidCallback? onPost});
  void pushNamed(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? args,
  });
  void pushReplacement(String path, {Object? args});
  void pushReplacementNamed(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? args,
  });
  void pushAndRemoveUntil(String path);
  void pop();
  void removeUntil(String path, {VoidCallback? onCompleted});
}
