import 'package:firebase_auth/firebase_auth.dart';
import 'package:ic_coding_challange/models/FirebaseAuthResponse.dart';

enum FirebaseResponse {
  completed,
}

class FirebaseUtils {
  late FirebaseAuth _auth;
  String? verificationId;
  int? resendToken;

  FirebaseUtils() {
    _auth = FirebaseAuth.instance;
  }
  Future<FirebaseAuthResponse?> verifyUserPhone(String phone) async {
    FirebaseAuthResponse? response;
    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        print("commmmmmmmmmfirmed");
        response = AuthCompleted();
      },
      verificationFailed: (FirebaseAuthException e) {
        print("commmmmmmfirm failed");
        response = AuthFailed(e.message!);
      },
      codeSent: (String verificationId, int? resendToken) async {
        print("code senttttttttt");
        response = AuthCodeSent();
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("timmmmmmmmmme out");
        response = AuthCodeTimeout();
      },
    );
    return response;
  }

  Future<bool> verifyOtp(String smsCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!, smsCode: smsCode);

    var result = await _auth.signInWithCredential(credential);

    if (result.user != null) {
      return true;
    }

    return false;
  }
}
