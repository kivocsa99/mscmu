import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:mscmu/application/provider/sharedpref/pref_provider.dart';
import 'package:mscmu/application/provider/years.repository.provider.dart';
import 'package:mscmu/presentation/widgets/shimmer_affect.dart';
import '../../domain/models/adminmodel.dart';
import '../../navigate.dart';
import 'home_screen.dart';

import '../../application/auth/use_cases/sign_up_with_email_and_password/sign_up_with_email_and_password.input.dart';
import '../../application/auth/use_cases/sign_up_with_email_and_password/sign_up_with_email_and_password.use_case.dart';
import '../widgets/field.dart';

class SignUpSCreen extends HookWidget {
  const SignUpSCreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final years = useProvider(allYearsProvider);
    final yearName = useState("Wateen");
    final yearId = useState(15);
    final role = useState("");
    final disableButton = useState(false);
    final yearId2 = useState(9);
    final isclinical = useState(false);
    final _formKey = useState(GlobalKey<FormState>());
    final _password = useTextEditingController(text: '');
    final _user = useState(const AdminModel());

    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.blue[100],
          child: Form(
            key: _formKey.value,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    "images/logo.png",
                    width: 260,
                  ),
                ),
                const SizedBox(height: 16),
                Field(
                  max: 1,
                  label: "Name",
                  iconData: Icons.person,
                  validator:
                      RequiredValidator(errorText: "This field can't be empty"),
                  onChanged: (value) =>
                      _user.value = _user.value.copyWith(name: value),
                ),
                const SizedBox(height: 16),
                Field(
                  max: 1,
                  label: 'Email',
                  iconData: Icons.mail,
                  validator:
                      EmailValidator(errorText: "please type a valid Email"),
                  onChanged: (value) =>
                      _user.value = _user.value.copyWith(email: value),
                ),
                const SizedBox(height: 16),
                Field(
                  max: 1,
                  controller: _password,
                  obscureText: true,
                  label: 'Password',
                  iconData: Icons.lock,
                  validator:
                      MinLengthValidator(8, errorText: "Minimum length is 8"),
                ),
                years.when(
                  data: (years) => Column(children: [
                    SizedBox(
                      height: 250,
                      child: CupertinoPicker(
                        looping: true,
                        children: years.classes
                            .map((e) => Center(
                                  child: Text(e.name),
                                ))
                            .toList(),
                        itemExtent: 46,
                        onSelectedItemChanged: (index) async {
                          isclinical.value = years.classes[index].isclinical;
                          yearId.value = years.classes[index].id;
                          yearName.value = years.classes[index].name;
                          _user.value =
                              _user.value.copyWith(yearid: yearId.value);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 210,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.1)),
                      child: Center(
                          child: Text(
                        yearName.value,
                        style: const TextStyle(fontSize: 24),
                      )),
                    )
                  ]),
                  loading: () => const ShimmerAffect(height: 100, width: 100),
                  error: (error, stack) => Center(
                    child: Text("$error"),
                  ),
                ),
                const SizedBox(height: 24),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Colors.blue,
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    if (_formKey.value.currentState!.validate()) {
                      if (isclinical.value == false) {
                        context
                            .read(prefChangeNotifierProvider)
                            .setYearId(yearId.value);
                        context
                            .read(prefChangeNotifierProvider)
                            .setIsWelcome(true);
                        context
                            .read(prefChangeNotifierProvider)
                            .setYearName(yearName.value);

                        Future.delayed(const Duration(milliseconds: 500), () {
                          changeScreenReplacement(context, const HomeScreen());
                        });
                        context
                            .read(signUpWithEmailAndPasswordUseCaseProvider)
                            .execute(
                              SignUpWithEmailAndPasswordUseCaseInput(
                                user: _user.value,
                                password: _password.text,
                              ),
                            )
                            .then(
                              (result) => result.fold(
                                (failure) {
                                  MotionToast.warning(
                                          title: "SignUp Failed",
                                          titleStyle: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                          description: failure
                                              .toString()
                                              .replaceAll("AuthFailure.", "")
                                              .replaceAll("()", ""))
                                      .show(context);
                                },
                                (unit) {
                                  MotionToast.success(
                                    title: "SignedUp successfully",
                                    titleStyle: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                    description: "Welcome to MSC-MU Family",
                                    descriptionStyle:
                                        const TextStyle(fontSize: 12),
                                    width: 300,
                                  ).show(context);
                                  changeScreenReplacement(
                                      context, const HomeScreen());
                                },
                              ),
                            );
                      } else {
                        context
                            .read(prefChangeNotifierProvider)
                            .setYearId(yearId.value);

                        showDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(builder:
                                (BuildContext context, StateSetter setState) {

                              return AlertDialog(
                                title: const Center(
                                    child: Text('Select your class')),
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                        child: Container(
                                          height: 80,
                                          width: 80,
                                          margin: const EdgeInsets.all(15.0),
                                          decoration: BoxDecoration(
                                            color: role.value == "Majors"
                                                ? Colors.lightBlue
                                                : Colors.transparent
                                                    .withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Icon(Icons.medical_services),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Majors",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () async {
                                          setState(() {
                                            disableButton.value = true;
                                            role.value = "Majors";
                                            yearId2.value = 9;
                                          });
                                        }),
                                    GestureDetector(
                                        child: Container(
                                          height: 80,
                                          width: 80,
                                          margin: const EdgeInsets.all(15.0),
                                          decoration: BoxDecoration(
                                            color: role.value == "Minors"
                                                ? Colors.lightBlue
                                                : Colors.transparent
                                                    .withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Icon(Icons.medical_services),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Minors",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () async {
                                          setState(() {
                                            disableButton.value = true;
                                            role.value = "Minors";
                                            yearId2.value = 10;
                                          });
                                        }),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('CANCEL'),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      context
                                          .read(prefChangeNotifierProvider)
                                          .setIsWelcome(true);
                                      context
                                          .read(prefChangeNotifierProvider)
                                          .setisclinical(true);
                                      context
                                          .read(prefChangeNotifierProvider)
                                          .setYearId2(yearId2.value);
                                      context
                                          .read(prefChangeNotifierProvider)
                                          .setYearName(yearName.value);
                                      context
                                          .read(
                                              signUpWithEmailAndPasswordUseCaseProvider)
                                          .execute(
                                            SignUpWithEmailAndPasswordUseCaseInput(
                                              user: _user.value,
                                              password: _password.text,
                                            ),
                                          )
                                          .then(
                                            (result) => result.fold(
                                              (failure) {
                                                MotionToast.warning(
                                                        title: "SignUp Failed",
                                                        titleStyle:
                                                            const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                        description: failure
                                                            .toString()
                                                            .replaceAll(
                                                                "AuthFailure.",
                                                                "")
                                                            .replaceAll(
                                                                "()", ""))
                                                    .show(context);
                                              },
                                              (unit) {
                                                MotionToast.success(
                                                  title:
                                                      "SignedUp successfully",
                                                  titleStyle: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  description:
                                                      "Welcome to MSC-MU Family",
                                                  descriptionStyle:
                                                      const TextStyle(
                                                          fontSize: 12),
                                                  width: 300,
                                                ).show(context);
                                                changeScreenReplacement(context,
                                                    const HomeScreen());
                                              },
                                            ),
                                          );
                                      Future.delayed(
                                          const Duration(milliseconds: 500),
                                          () {
                                        changeScreenReplacement(
                                            context, const HomeScreen());
                                      });
                                    },
                                    child: const Text('ACCEPT'),
                                  ),
                                ],
                              );
                            });
                          },
                        );
                      }
                    }
                  },
                  child: Text(
                    "Signup",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.blue[100], fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
