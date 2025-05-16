import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app_navigator.dart';

class AppNavigatorImp implements AppNavigator {
  AppNavigatorImp({required GoRouter router}) : _router = router;

  final GoRouter _router;

  @override
  void pop() {
    if (_router.canPop()) {
      _router.pop();
    }
  }

  @override
  void push(String path, {Object? args, VoidCallback? onPost}) {
    _router.push(path, extra: args);
    onPost?.call();
  }

  @override
  void pushNamed(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? args,
  }) =>
      _router.pushNamed(
        name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: args,
      );

  @override
  void pushReplacement(String path, {Object? args}) => _router.pushReplacement(path, extra: args);

  @override
  void pushReplacementNamed(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? args,
  }) =>
      _router.pushReplacementNamed(
        name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: args,
      );

  @override
  void pushAndRemoveUntil(String path) {
    while (_router.canPop() &&
        _router.routerDelegate.currentConfiguration.matches.last.matchedLocation != path) {
      pop();
    }
    _router.pushReplacement(path);
  }

  @override
  void removeUntil(String path, {VoidCallback? onCompleted}) {
    while (_router.canPop() &&
        _router.routerDelegate.currentConfiguration.matches.last.matchedLocation != path) {
      pop();
    }
    onCompleted?.call();
  }
}
