

import 'package:app_first_may/src/features/authenication/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;



  /// Function to save user data to Firestore.
  Future<void> saveUserRecord(UserModel user, String person) async {
    try {
      await _db.collection(person).doc(user.email).set(user.toMap());
    }catch (e) {
      throw Exception('Error saving user record');
    }
  }

  //Function to get user details based on user ID
  // Future<UserModel> fetchUserDetails()async{
  //   try{
  //     final documentSnapshot = await _db.collection("Users").doc().get();
  //     if(documentSnapshot.exists){
  //       return UserModel.fromMap();
  //     }
  //     else{
  //     }
  //   }
  // }

}