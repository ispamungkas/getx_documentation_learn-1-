import 'package:flutter/material.dart';

class UserInheritanceWidget extends InheritedWidget {
  const UserInheritanceWidget(
      {super.key, required super.child, required this.username, required this.onNameChange});

  final String username;
  final void Function() onNameChange;

  static UserInheritanceWidget? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<UserInheritanceWidget>();
  }

  @override
  bool updateShouldNotify(UserInheritanceWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.username != username;
  }
}
