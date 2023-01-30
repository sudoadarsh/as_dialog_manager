import 'package:flutter/cupertino.dart';

class ASContextStack {

  /// Singleton pattern.
  // 1. Private constructor.
  ASContextStack._();
  // 2. Singular instance.
  static final ASContextStack instance = ASContextStack._();

  /// The storage count.
  static int _count = 0;
  int get count => _count;

  /// The context storage.
  static List<BuildContext> storage = [];

  /// Push a context.
  void push(BuildContext context) {
    _count ++;
    storage.add(context);
  }

  /// Pop a context.
  BuildContext? pop() {
    if (_count < 1) return null;
    _count --;
    return storage.removeLast();
  }
}