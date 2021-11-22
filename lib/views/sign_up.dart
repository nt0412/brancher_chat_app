import 'package:chat_app_nnt/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'sign_in.dart';
import 'package:the_validator/the_validator.dart';
import 'package:date_format/date_format.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

bool _passwordVisible = true;
var isValidDOB = RegExp(
    r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$');

TextEditingController userFullnameController = TextEditingController();
TextEditingController userDOBController = TextEditingController();
TextEditingController userEmailController = TextEditingController();
TextEditingController userPasswordController = TextEditingController();
TextEditingController userConfirmPassController = TextEditingController();

class SignUpSreen extends StatefulWidget {
  const SignUpSreen({Key? key}) : super(key: key);

  @override
  _SignUpSreenState createState() => _SignUpSreenState();
}

class _SignUpSreenState extends State<SignUpSreen> {
  late DateTime _myDateTime;
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  AuthMethods authMethods = AuthMethods();

  signUp() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      authMethods
          .signInWithEmailAndPassword(
              userEmailController.text, userPasswordController.text)
          // ignore: avoid_print
          .then((value) => print("$value"));
    }
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: screenHeight,
              width: screenWidth,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xfffb9109),
                    Color(0xffb73c41),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Text(
                        'BRANCHER',
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(
                            fontSize: screenWidth * 0.2,
                            fontFamily: 'MADE Waffle Soft',
                            color: const Color(0xfffff0dd).withOpacity(0.08)),
                      ),
                      Text(
                        'BRANCHER',
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(
                            fontSize: screenWidth * 0.2,
                            fontFamily: 'MADE Waffle Soft',
                            color: const Color(0xfffff0dd).withOpacity(0.08)),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: (screenHeight - statusBarHeight) * 0.07),
                        child: Align(
                          alignment: FractionalOffset.topCenter,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: const Color(0xffffeddf),
                              fontSize: screenWidth * 0.12,
                              fontFamily: 'Hiragino Sans',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: (screenHeight - statusBarHeight) * 0.22),
                        width: screenWidth,
                        decoration: const BoxDecoration(
                          color: Color(0xffffeddf),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(100.0),
                              bottomLeft: Radius.circular(0.0)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: (screenHeight - statusBarHeight) * 0.28,
                          bottom: (screenHeight - statusBarHeight) * 0.05,
                        ),
                        padding: EdgeInsets.only(
                          top: statusBarHeight * 0.5,
                          left: screenWidth * 0.14,
                          right: screenWidth * 0.14,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 26),
                                      child: TextFormField(
                                        validator: FieldValidator.required(
                                            message: 'Let us know your name'),
                                        controller: userFullnameController,
                                        style: const TextStyle(
                                          fontFamily: 'Arial Rounded MT Bold',
                                          fontSize: 18,
                                          color: Color(0xff685374),
                                        ),
                                        cursorWidth: 2,
                                        cursorColor: const Color(0xff685374),
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          hintStyle: const TextStyle(
                                            color: Color(0xff685374),
                                            fontFamily: 'Harabara Mais Demo',
                                          ),
                                          hintText: "Fullname",
                                          fillColor: const Color(0xfff4cbab),
                                          contentPadding: const EdgeInsets.only(
                                            top: 0,
                                            left: 10,
                                            right: 10,
                                            bottom: 14,
                                          ),
                                          suffix: IconButton(
                                            onPressed: () {},
                                            icon: LineIcon(
                                              LineIcons.userCheck,
                                              color: const Color(0xff685374),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 26),
                                      child: TextFormField(
                                        validator:
                                            FieldValidator.regExp(isValidDOB),
                                        controller: userDOBController,
                                        keyboardType: TextInputType.datetime,
                                        style: const TextStyle(
                                          fontFamily: 'Arial Rounded MT Bold',
                                          fontSize: 18,
                                          color: Color(0xff685374),
                                        ),
                                        cursorWidth: 2,
                                        cursorColor: const Color(0xff685374),
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(
                                            top: 0,
                                            left: 10,
                                            right: 10,
                                            bottom: 14,
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          hintStyle: const TextStyle(
                                            color: Color(0xff685374),
                                            fontFamily: 'Harabara Mais Demo',
                                          ),
                                          labelStyle: const TextStyle(
                                            color: Color(0xff685374),
                                            fontFamily: 'Harabara Mais Demo',
                                          ),
                                          hintText: "DD/MM/YYYY",
                                          fillColor: const Color(0xfff4cbab),
                                          suffix: IconButton(
                                            onPressed: () async {
                                              _myDateTime =
                                                  (await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1920),
                                                lastDate: DateTime(2025),
                                              ))!;
                                              setState(() {
                                                userDOBController.text =
                                                    formatDate(_myDateTime, [
                                                  dd,
                                                  '/',
                                                  mm,
                                                  '/',
                                                  yyyy
                                                ]);
                                              });
                                            },
                                            icon: LineIcon(
                                              LineIcons.calendarAlt,
                                              color: const Color(0xff685374),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 26),
                                      child: TextFormField(
                                        autofillHints: const [
                                          AutofillHints.email
                                        ],
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: FieldValidator.email(
                                          message:
                                              "Please, input a valid email !",
                                        ),
                                        controller: userEmailController,
                                        style: const TextStyle(
                                          fontFamily: 'Arial Rounded MT Bold',
                                          fontSize: 18,
                                          color: Color(0xff685374),
                                        ),
                                        cursorWidth: 2,
                                        cursorColor: const Color(0xff685374),
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(
                                            top: 0,
                                            left: 10,
                                            right: 10,
                                            bottom: 14,
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          hintStyle: const TextStyle(
                                            color: Color(0xff685374),
                                            fontFamily: 'Harabara Mais Demo',
                                          ),
                                          hintText: "Email",
                                          fillColor: const Color(0xfff4cbab),
                                          suffix: IconButton(
                                            onPressed: () {},
                                            icon: LineIcon(
                                              LineIcons.mailBulk,
                                              color: const Color(0xff685374),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 26),
                                      child: TextFormField(
                                        validator: (val) {
                                          return val!.length > 7
                                              ? null
                                              : "Password must have at least 8 characters !";
                                        },
                                        controller: userPasswordController,
                                        style: const TextStyle(
                                          fontFamily: 'Arial Rounded MT Bold',
                                          fontSize: 18,
                                          color: Color(0xff685374),
                                        ),
                                        cursorWidth: 2,
                                        cursorColor: const Color(0xff685374),
                                        obscureText: !_passwordVisible,
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          hintStyle: const TextStyle(
                                            color: Color(0xff685374),
                                            fontFamily: 'Harabara Mais Demo',
                                          ),
                                          hintText: "Password",
                                          fillColor: const Color(0xfff4cbab),
                                          suffix: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _passwordVisible =
                                                    !_passwordVisible;
                                              });
                                            },
                                            icon: LineIcon(
                                              _passwordVisible
                                                  ? LineIcons.eye
                                                  : LineIcons.eyeSlash,
                                              color: const Color(0xff685374),
                                            ),
                                          ),
                                          contentPadding: const EdgeInsets.only(
                                            top: 0,
                                            left: 10,
                                            right: 10,
                                            bottom: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 26),
                                      child: TextFormField(
                                        validator: FieldValidator.equalTo(
                                            userPasswordController,
                                            message: "Password do not match !"),
                                        controller: userConfirmPassController,
                                        style: const TextStyle(
                                          fontFamily: 'Arial Rounded MT Bold',
                                          fontSize: 18,
                                          color: Color(0xff685374),
                                        ),
                                        cursorWidth: 2,
                                        cursorColor: const Color(0xff685374),
                                        obscureText: !_passwordVisible,
                                        textInputAction: TextInputAction.done,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          hintStyle: const TextStyle(
                                            color: Color(0xff685374),
                                            fontFamily: 'Harabara Mais Demo',
                                          ),
                                          hintText: "Confirm password",
                                          fillColor: const Color(0xfff4cbab),
                                          suffix: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _passwordVisible =
                                                    !_passwordVisible;
                                              });
                                            },
                                            icon: LineIcon(
                                              _passwordVisible
                                                  ? LineIcons.eye
                                                  : LineIcons.eyeSlash,
                                              color: const Color(0xff685374),
                                            ),
                                          ),
                                          contentPadding: const EdgeInsets.only(
                                            top: 0,
                                            left: 10,
                                            right: 10,
                                            bottom: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 30),
                                  height: 63,
                                  child: ElevatedButton(
                                    child: const Text('Sign Up'),
                                    onPressed: () {
                                      signUp();
                                      final form = formKey.currentState!;
                                      if (form.validate()) {
                                        final userName =
                                            userFullnameController.text;
                                        ScaffoldMessenger.of(context)
                                          ..removeCurrentSnackBar()
                                          ..showSnackBar(
                                            SnackBar(
                                              duration: const Duration(
                                                  milliseconds: 3000),
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(45),
                                              ),
                                              backgroundColor:
                                                  const Color(0xFFF7B663),
                                              content: Text(
                                                  'We are brother now $userName'),
                                            ),
                                          );
                                      }
                                      if (!form.validate()) {
                                        ScaffoldMessenger.of(context)
                                          ..removeCurrentSnackBar()
                                          ..showSnackBar(SnackBar(
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              duration: const Duration(
                                                  milliseconds: 4000),
                                              backgroundColor:
                                                  const Color(0xFFFA4F55),
                                              content: const Text(
                                                  'Check your information again :( ')));
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            15), // <-- Radius
                                      ),
                                      primary: const Color(0xffB63d42),
                                      onPrimary: const Color(0xFFFFF0DD),
                                      textStyle: const TextStyle(
                                          fontFamily: 'Hiragino Sans',
                                          fontSize: 19),
                                      minimumSize:
                                          const Size(double.infinity, 50),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: screenWidth * 0.01,
                                  right: screenWidth * 0.01,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'Already have any account ?',
                                      style: TextStyle(
                                        fontFamily: 'Harabara Mais Demo',
                                        fontSize: screenWidth * 0.04,
                                      ),
                                    ),
                                    const Spacer(),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignInSreen()),
                                        );
                                      },
                                      child: Text(
                                        'Sign in',
                                        style: TextStyle(
                                          fontFamily: 'Harabara Mais Demo',
                                          fontSize: screenWidth * 0.04,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
