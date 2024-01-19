import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_state_project/model_person.dart';
import 'package:getx_state_project/thrid_place.dart';
import 'package:getx_state_project/user_inheritance.dart';

class SecondPlace extends StatefulWidget {
  const SecondPlace({super.key});
  static const String _KEY = "kuncian";
  static const String _KEYOBJECT = "object";
  static const List<String> datas = ["kiew", 'ews', 'cass'];

  @override
  State<SecondPlace> createState() => _SecondPlaceState();
}

class _SecondPlaceState extends State<SecondPlace> {
  final _storage = GetStorage();
  String name = "Maspam";

  void checkdata(int rand) async {
    _storage.write(SecondPlace._KEY, SecondPlace.datas[rand]);
    setState(() {});
  }

  void checkDataObject() async {
    final createObject = Person(name: "Maspam", age: 12);
    _storage.write(SecondPlace._KEYOBJECT, jsonEncode(createObject.toJson()));
    setState(() {});
  }
  

  @override
  Widget build(BuildContext context) {
    final storage = _storage.read(SecondPlace._KEYOBJECT);
    final dataasli = (storage != null)
        ? Person.fromJson(jsonDecode(storage))
        : Person(name: "kosong", age: 0);

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    '${(dataasli.name == null) ? "check" : dataasli.name} and ${(dataasli.age == null) ? "check" : dataasli.age}'),
                Builder(
                  builder: (context) {
                    return TextButton(
                      onPressed: () => checkDataObject(),
                      child: Text("Check Hasil"),
                    );
                  },
                ),
                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ThridPlace();
                      },
                    ),
                  ),
                  child: Text("goThirdPlage"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
