import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ic_coding_challange/common/FirebaseUtils.dart';
import 'package:ic_coding_challange/controllers/LoginBloc.dart';
import 'package:ic_coding_challange/main.dart';
import 'package:ic_coding_challange/views/widgets/CustomButton.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is OtpVerifiedState) {
          Navigator.of(context).pushReplacementNamed("/home");
        }
      },
      builder: (context, state) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 45,
                ),
                Text(
                  "OTP Verification",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 22,
                      ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Insert the otp sent to your number",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (state is OtpSentState)
                  Text(
                    (state as OtpSentState).phone,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                const SizedBox(
                  height: 10,
                ),
                OTPTextField(
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 40,
                  style: const TextStyle(fontSize: 17),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  onChanged: (value) {},
                  onCompleted: (pin) async {
                    if (state is OtpSentState) {
                      await BlocProvider.of<LoginCubit>(context)
                          .verifyOtp(pin, (state).verifId);
                    }
                  },
                ),
                const SizedBox(
                  height: 45,
                ),
                CustomButon(onPressed: () {}, txt: "VERIFY")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
