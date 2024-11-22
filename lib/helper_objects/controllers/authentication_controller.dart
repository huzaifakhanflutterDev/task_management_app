import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_management_app/helper_objects/models/user_model.dart';

class AuthenticationController extends GetxController {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var loading = false.obs;
  var logLoading = false.obs;
  var googleLoading = false.obs;

  Future<String> signupMethod() async {
    var name = nameController.text;
    var email = emailController.text;
    var password = passwordController.text;
    var response = '';
    loading.value = true;
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      value.user?.updateDisplayName(name);
      var userObj = USerModel(
        id: value.user!.uid,
        name: name,
        email: email,
        password: password,
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(userObj.id)
          .set(userObj.toMap());

      response = "success";
    }).catchError((e) {
      response = e.toString();
    });
    loading.value = false;
    return response;
  }

  Future<String> loginMethod() async {
    logLoading.value = true;
    var response = '';
    var email = emailController.text;
    var password = passwordController.text;
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      response = "success";
    }).catchError((e) {
      response = e.toString();
    });
    logLoading.value = false;
    return response;
  }

  Future<String> googleSignIn() async {
    googleLoading.value = true;
    var response = '';
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        if (userCredential.user != null) {
          var userObj = USerModel(
            id: userCredential.user!.uid,
            name: userCredential.user!.displayName ?? '',
            email: userCredential.user!.email ?? '',
            password: '',
          );

          await FirebaseFirestore.instance
              .collection("users")
              .doc(userObj.id)
              .set(userObj.toMap());

          response = "success";
        }
      }
    } catch (e) {
      response = e.toString();
      print("your error is $e");
    }
    googleLoading.value = false;
    return response;
  }
}
