import 'package:flutter/material.dart';
import 'package:getx_state_project/text_widget.dart';
import 'package:getx_state_project/user_inheritance.dart';

class ThridPlace extends StatefulWidget {
  const ThridPlace({super.key});

  @override
  State<ThridPlace> createState() => _ThridPlaceState();
}

class _ThridPlaceState extends State<ThridPlace> {
  String? name = "maspam";

  void changeName() {
    setState(() {
      name = "hk";
    });
  }

  @override
  Widget build(BuildContext context) {
    return UserInheritanceWidget(
      username: name!,
      onNameChange: changeName, 
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                key: UniqueKey(),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: changeName,
                child: Text("changename"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
