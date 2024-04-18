// authentication.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

String globalVerificationID = "";
String globalNumber = "";

Future<bool> checkIfUserExists(String phoneNumber) async {
  try {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
        // Auto-sign in the user with the credential
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle verification failed error
      },
      codeSent: (String verificationId, int? resendToken) {
        // Save the verification ID and resend token for later use
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Handle auto-retrieval timeout
      },
    );
    // If verification process starts successfully, return true
    return true;
  } catch (e) {
    // Print error message for debugging
    print('Error checking if user exists: $e');
    // Return false in case of any errors
    return false;
  }
}

Future<void> saveUserData(String phoneNumber, UserData userData) async {
  DatabaseReference reference = FirebaseDatabase.instance.reference();
  reference.child('users').child(phoneNumber).set({
    'name': userData.name,
    'location': userData.location,
    'blood_group': userData.bloodGroup,
    'gender': userData.gender,
    'dob': userData.dob.millisecondsSinceEpoch,
  });
}

Future<void> sendOTP(String phoneNumber) async {
  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: phoneNumber,
    verificationCompleted: (PhoneAuthCredential credential) {
      // Auto-sign in the user with the credential
    },
    verificationFailed: (FirebaseAuthException e) {
      // Handle verification failed error
    },
    codeSent: (String verificationId, int? resendToken) {
      // Save the verification ID and resend token for later use
      globalVerificationID = verificationId;
      print("verification ID");
      print(globalVerificationID);
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      // Handle auto-retrieval timeout
    },
  );
}

Future<void> verifyOTP(String verificationId, String otp) async {
  PhoneAuthCredential credential = PhoneAuthProvider.credential(
    verificationId: verificationId,
    smsCode: otp,
  );
  await FirebaseAuth.instance.signInWithCredential(credential);
}

class UserData {
  String name;
  String location;
  String bloodGroup;
  String gender;
  DateTime dob; // Added Date of Birth field

  UserData({
    required this.name,
    required this.location,
    required this.bloodGroup,
    required this.gender,
    required this.dob,
  });
}
