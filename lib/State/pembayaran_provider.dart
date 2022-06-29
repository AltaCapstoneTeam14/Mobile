import 'package:flutter/cupertino.dart';

class PaymentState extends ChangeNotifier {
  String? _method;
  String? get method => _method;

  addMethod(String setMethod) {
    _method = setMethod;
    notifyListeners();
  }
}
