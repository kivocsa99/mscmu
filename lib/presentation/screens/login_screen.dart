import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mscmu/constants.dart';
import 'package:mscmu/infrastructure/messaging/services/messaging.repository.dart';
import '../../application/provider/sharedpref/pref_provider.dart';
import '../../application/provider/years.repository.provider.dart';
import 'home_screen.dart';
import 'signup_screen.dart';
import '../widgets/shimmer_affect.dart';
import '../../domain/models/adminmodel.dart';
import '../widgets/field.dart';
import '../../application/auth/use_cases/sign_in_with_email_and_password/sign_in_with_email_and_password.input.dart';
import '../../application/auth/use_cases/sign_in_with_email_and_password/sign_in_with_email_and_password.use_case.dart';
import '../../navigate.dart';

class Login extends HookWidget {
  const Login({Key? key}) : super(key: key);

  @override
  // ignore: avoid_renaming_method_parameters
  Widget build(BuildContext ctx) {
    final _formKey = useState(GlobalKey<FormState>());
    final _password = useTextEditingController(text: '');
    final _user = useState(const AdminModel());
    final scaffolkey = useState(GlobalKey<ScaffoldState>());
    final years = useProvider(allYearsProvider);
    final yearName = useState("Wateen");
    final yearId = useState(15);
    final isclinical = useState(false);
    final role = useState("Major");
    final disableButton = useState(false);
    final yearId2 = useState(9);
    return Scaffold(
      key: scaffolkey.value,
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
                  label: 'Email',
                  iconData: Icons.mail,
                  validator: MultiValidator([
                    RequiredValidator(errorText: "This field is required"),
                    EmailValidator(errorText: "please type a valid Email"),
                  ]),
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
                const SizedBox(height: 16),
                years.when(
                  data: (years) => Column(children: [
                    SizedBox(
                      height: 250,
                      child: CupertinoPicker(
                        looping: true,
                        children: years.classes!
                            .map((e) => Center(
                                  child: Text(e.name!),
                                ))
                            .toList(),
                        itemExtent: 46,
                        onSelectedItemChanged: (index) async {
                          isclinical.value = years.classes![index].isclinical!;
                          yearId.value = years.classes![index].id!;
                          yearName.value = years.classes![index].name!;
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
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      color: Colors.blue,
                      onPressed: () async {
                        FocusScope.of(ctx).unfocus();
                        if (_formKey.value.currentState!.validate()) {
                          if (isclinical.value == false) {
                            ctx
                                .read(prefChangeNotifierProvider)
                                .setYearName(yearName.value);
                            ctx
                                .read(prefChangeNotifierProvider)
                                .setYearId(yearId.value);
                            ctx
                                .read(prefChangeNotifierProvider)
                                .setIsWelcome(true);
                            ctx
                                .read(prefChangeNotifierProvider)
                                .setYearName(yearName.value);

                            await ctx
                                .read(signInWithEmailAndPasswordUseCaseProvider)
                                .execute(
                                  SignInWithEmailAndPasswordUseCaseInput(
                                    email: _user.value.email,
                                    password: _password.text,
                                  ),
                                )
                                .then(
                                  (result) => result.fold(
                                    (failure) async {
                                      displayWarningMotionToast(
                                          ctx,
                                          failure
                                              .toString()
                                              .replaceAll("AuthFailure.", "")
                                              .replaceAll("()", ""),
                                          "Login Failed");
                                    },
                                    (unit) async {
                                      displaySuccessMotionToast(
                                          ctx,
                                          "Welcome back to MSC-MU Family",
                                          "Loggedin successfully");
                                       ctx
                                          .read(msgprovider)
                                          .subsribe(yearName.value);

                                              changeScreenReplacement(
                                                  ctx, const HomeScreen());
                                    },
                                  ),
                                );
                          } else {
                            showDialog(
                              context: ctx,
                              builder: (context) {
                                return StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter setState) {
                                  return AlertDialog(
                                    title: const Center(
                                        child: Text('Select your class')),
                                    content: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                            child: Container(
                                              height: 80,
                                              width: 80,
                                              margin:
                                                  const EdgeInsets.all(15.0),
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
                                              margin:
                                                  const EdgeInsets.all(15.0),
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
                                          Navigator
                                              .pop(context);
                                          await ctx
                                              .read(
                                                  signInWithEmailAndPasswordUseCaseProvider)
                                              .execute(
                                                SignInWithEmailAndPasswordUseCaseInput(
                                                  email: _user.value.email,
                                                  password: _password.text,
                                                ),
                                              )
                                              .then(
                                                (result) => result.fold(
                                                  (failure) async {
                                                    displayWarningMotionToast(
                                                        ctx,
                                                        failure
                                                            .toString()
                                                            .replaceAll(
                                                                "AuthFailure.",
                                                                "")
                                                            .replaceAll(
                                                                "()", ""),
                                                        "Login Failed");
                                                  },
                                                  (unit) async {
                                                    ctx
                                                        .read(
                                                            prefChangeNotifierProvider)
                                                        .setYearName(
                                                            yearName.value);
                                                    ctx
                                                        .read(
                                                            prefChangeNotifierProvider)
                                                        .setYearId(
                                                            yearId.value);
                                                    ctx
                                                        .read(
                                                            prefChangeNotifierProvider)
                                                        .setIsWelcome(true);
                                                    ctx
                                                        .read(
                                                            prefChangeNotifierProvider)
                                                        .setisclinical(true);
                                                    ctx
                                                        .read(
                                                            prefChangeNotifierProvider)
                                                        .setYearId2(
                                                            yearId2.value);
                                                    displaySuccessMotionToast(
                                                        ctx,
                                                        "Welcome back to MSC-MU Family",
                                                        "Loggedin successfully");
                                                     ctx
                                                        .read(msgprovider)
                                                        .subsribe(
                                                            yearName.value);
                                                    changeScreenReplacement(
                                                        ctx,
                                                        const HomeScreen());

                                                  },
                                                ),
                                              );
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
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.blue[100],
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      color: Colors.blue,
                      onPressed: () async {
                        changeScreen(ctx, const Scaffold(body: SignUpSCreen()));
                      },
                      child: Text(
                        "SignUp",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.blue[100],
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
