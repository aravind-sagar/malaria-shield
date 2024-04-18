import 'package:firebase_database/firebase_database.dart';

Future<bool> checkIfUserExists(String phoneNumber) async {
  // DataSnapshot snapshot = await FirebaseDatabase.instance
  //     .reference()
  //     .child('users')
  //     .child(phoneNumber)
  //     .once();
  // return snapshot.value != null;
  return false;
}

Future<void> saveUserData(String phoneNumber) async {
  DatabaseReference reference = FirebaseDatabase.instance.reference();
  reference.child('users').child(phoneNumber).set({
    'name': null,
    'age': null,
    'blood_group': null,
    'gender': null,
    'address': null,
  });
}
