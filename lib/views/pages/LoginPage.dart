import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ic_coding_challange/controllers/LoginBloc.dart';
import 'package:ic_coding_challange/models/FirebaseAuthResponse.dart';
import 'package:ic_coding_challange/views/widgets/CustomButton.dart';
import 'package:ic_coding_challange/views/widgets/CustomTextField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _phoneController, _passwordController;
  final GlobalKey<FormState> _loginFormKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.cover,
              ),
              Expanded(
                child: BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    //listen for otpCode sent,error,verified
                    if (state is OtpSentState) {
                      Navigator.of(context).pushReplacementNamed("/otpPage");
                      return;
                    }

                    if (state is OtpError) {
                      _showErrorMsg(state.msg);
                      BlocProvider.of<LoginCubit>(context).resetState();
                    }
                  },
                  builder: (context, state) => Form(
                    key: _loginFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "SIGN IN",
                          style: Theme.of(context).textTheme.titleMedium!,
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Text(
                          "Phone Number",
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextField(
                          controller: _phoneController,
                          validator: (value) {
                            return _isValidPhone(value)
                                ? null
                                : "Invalid Phone";
                          },
                          onChange: (val) {
                            (state as InitState).phone = val ?? "";
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Enter Password",
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextField(
                          controller: _passwordController,
                          obscureText: true,
                          validator: (value) {
                            return _isValidPassword(value ?? "")
                                ? null
                                : "Password min length is 5";
                          },
                          onChange: (val) {
                            (state as InitState).password = val ?? "";
                          },
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forget Password?",
                            style: Theme.of(context).textTheme.titleSmall!,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        state is OtpSendingState
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                ),
                              )
                            : CustomButon(
                                txt: "LOGIN",
                                onPressed: () {
                                  if (_loginFormKey.currentState!.validate()) {
                                    BlocProvider.of<LoginCubit>(context)
                                        .login((state as InitState).phone);
                                    print(_phoneController.text);
                                  }
                                },
                              ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: Theme.of(context).textTheme.labelMedium!,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed("/register");
                              },
                              child: Text("Register",
                                  style:
                                      Theme.of(context).textTheme.titleSmall!),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showErrorMsg(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black,
        content: Text(
          msg,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.red,
              ),
        ),
      ),
    );
  }

  _isValidPhone(String? phone) {
    return RegExp(r"^(^\+251|^0)?9\d{8}$").hasMatch(phone ?? "");
  }

  _isValidPassword(String pass) {
    return pass.trim().length >= 5;
  }
}
