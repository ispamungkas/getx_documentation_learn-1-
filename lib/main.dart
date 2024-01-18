import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_state_project/StoreController.dart';
import 'package:getx_state_project/second_page.dart';
import 'package:getx_state_project/theme_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends GetView<StoreController> {
  MyApp({super.key});
  final cont = Get.put(StoreController());
  final theme = Get.put(ThemeController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Get X Store",
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      themeMode: theme.theme,
      home: home(context),
    );
  }

  Widget home(BuildContext conn) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    labelText: "Store Name",
                    labelStyle: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                  controller: cont.storeNameEditingController,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  cont.updateStore(cont.storeNameEditingController.text);
                  Get.snackbar("Updated",
                      "Store name has been updated to ${cont.storeNameEditingController.text}",
                      duration: Duration(seconds: 2),
                      snackPosition: SnackPosition.BOTTOM);
                },
                child: Text("Change Store Name"),
              ),
              ElevatedButton(
                onPressed: () {
                  cont.incementFollowerCount();
                },
                child: Text("Add Follower"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Obx(
                  () => Text(
                    controller.store_name.value,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Obx(
                  () => Text(
                    cont.followerCount.value.toString(),
                  ),
                ),
              ),
              GetX<StoreController>(
                builder: (storeController) => Switch(
                  value: storeController.storeStatus.value,
                  activeColor: Colors.blue[400],
                  onChanged: (value) {
                    storeController.updateStoreStatus(value);
                    theme.saveTheme(value);
                    theme.changeThemeMode((Get.isDarkMode) ? ThemeMode.light : ThemeMode.dark);
                  },
                ),
              ),
              Builder(
                builder: (context) => TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const SecondPlace(),
                    //   ),
                    // );
                    Get.defaultDialog(
                      radius: 10.0,
                      contentPadding: const EdgeInsets.all(20.0),
                      title: 'title',
                      middleText: 'content',
                      textConfirm: 'Okay',
                      confirm: OutlinedButton.icon(
                        onPressed: () => Get.back(),
                        icon: const Icon(
                          Icons.check,
                          color: Colors.blue,
                        ),
                        label: const Text(
                          'Okay',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      cancel: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.abc),
                        label: Text("Halo"),
                      ),
                    );
                  },
                  child: Text("Add Follower"),
                ),
              ),
              Builder(
                builder: (context) => TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>SecondPlace(),
                      ),
                    );
                  },
                  child: Text("Second Place"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
