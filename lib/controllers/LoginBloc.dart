import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ic_coding_challange/common/FirebaseUtils.dart';

abstract class LoginState extends Equatable {}

class InitState extends LoginState {
  String phone;
  String password;

  InitState({this.phone = "", this.password = ""});

  @override
  List<Object?> get props => [];
}

class OtpSendingState extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class OtpSentState extends LoginState {
  final String verifId;
  final int? resendCode;
  final String phone;

  OtpSentState(this.verifId, this.resendCode, this.phone);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class OtpVerifiedState extends LoginState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class OtpError extends LoginState {
  final String msg;

  OtpError(this.msg);
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitState());

  var auth = FirebaseAuth.instance;
  login(String phone) {
    emit(OtpSendingState());
    auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        emit(OtpVerifiedState());
      },
      verificationFailed: (FirebaseAuthException e) {
        emit(OtpError(e.message ?? "Otp failed"));
      },
      codeSent: (String verificationId, int? resendToken) async {
        emit(OtpSentState(verificationId, resendToken, phone));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  verifyOtp(String smsCode, String id) async {
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: id, smsCode: smsCode);

    var result = await auth.signInWithCredential(credential);

    if (result.user != null) {
      emit(OtpVerifiedState());
    } else {
      emit(OtpError("Invalid OTP code"));
    }
  }

  resetState() {
    emit(InitState());
  }
}
