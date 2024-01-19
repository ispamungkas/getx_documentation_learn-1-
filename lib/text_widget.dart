import 'package:flutter/material.dart';
import 'package:getx_state_project/user_inheritance.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(UserInheritanceWidget.of(context)!.username);
  }
}