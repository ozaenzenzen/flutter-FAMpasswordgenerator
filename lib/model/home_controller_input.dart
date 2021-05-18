import 'package:flutter/cupertino.dart';

class ControllerInput {
  bool validate = false;
  bool isOn = false;
  TextEditingController inputController = TextEditingController();

  String input;

  get icGetter {
    return input;
  }

  void icSetter(String text) {
    this.input = text;
  }
}
