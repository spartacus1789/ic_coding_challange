import 'package:flutter/material.dart';
import 'package:ic_coding_challange/views/widgets/CustomTextField.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _firstNameController,
      _lastNameController,
      _passwordController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: "");
    _lastNameController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 35,
              ),
              Expanded(
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "REGISTER",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 24,
                                ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Text(
                        "First Name",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        controller: _firstNameController,
                        validator: (value) {
                          return null;
                        },
                        onChange: (val) {},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Last Name",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        controller: _lastNameController,
                        validator: (value) {
                          return null;
                        },
                        onChange: (val) {},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Enter Password",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        validator: (value) {
                          return null;
                        },
                        onChange: (value) {
                          print(value);
                        },
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          child: const Text("REGISTER"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: Theme.of(context).textTheme.labelMedium!,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed("/login");
                            },
                            child: Text("Login here",
                                style: Theme.of(context).textTheme.titleSmall!),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
