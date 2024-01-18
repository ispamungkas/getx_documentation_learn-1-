import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreController extends GetxController{
  final store_name = "Maspam Store".obs;
  final followerCount = 0.obs;
  final storeStatus = false.obs;
  final followerList =[].obs;

  final storeNameEditingController = TextEditingController();
  final folowerCountEditingController = TextEditingController();
  final storeStatusEditingController = TextEditingController();

  updateStore(String name){
    store_name(name);
  }
  
  incementFollowerCount(){
    followerCount(followerCount.value + 1);
  }

  void updateStoreStatus(bool isOpen){
    storeStatus(isOpen);
  }
}