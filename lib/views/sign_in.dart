import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'sign_up.dart';

bool _passwordVisible = true;

class SignInSreen extends StatefulWidget {
  const SignInSreen({Key? key}) : super(key: key);

  @override
  _SignInSreenState createState() => _SignInSreenState();
}

class _SignInSreenState extends State<SignInSreen> {
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xffffeddf),
      appBar: NewGradientAppBar(
        leading: IconButton(
          icon: const FaIcon(
            FontAwesomeIcons.angleLeft,
            size: 30,
          ),
          onPressed: () =>
              Navigator.of(context).popUntil((route) => route.isFirst),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xffffeddf), //change your color here
        ),
        centerTitle: true,
        title: const Text(
          'Sign in',
          style: TextStyle(
            color: Color(0xffffeddf),
            fontSize: 22,
            fontFamily: 'MADE Waffle Soft',
            fontWeight: FontWeight.bold,
          ),
        ),
        gradient: const LinearGradient(
          colors: [
            Color(0xfffb9109),
            Color(0xffb73c41),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: 130,
              left: -330,
              right: 0,
              child: Container(
                height: 400,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xfffbe8d7),
                      Color(0xFFFFE6D1),
                      Color(0xFFF7B663),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 50, right: 40, left: 40, bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hello.',
                    style: TextStyle(
                      fontSize: 73,
                      fontFamily: 'MADE Waffle Soft',
                      fontWeight: FontWeight.bold,
                      color: Color(0xffB63d42),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 65),
                    child: Column(
                      children: [
                        TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(' ')
                          ],
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(
                            fontFamily: 'Arial Rounded MT Bold',
                            fontSize: 20,
                            color: Color(0xff685374),
                          ),
                          cursorWidth: 2,
                          cursorColor: const Color(0xff685374),
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              fontFamily: 'Harabara Mais Demo',
                              color: Color(0xff685374),
                              fontSize: 19,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 0.5,
                                color: Color(0xff685374),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 0.5,
                                color: Color(0xff685374),
                              ),
                            ),
                            contentPadding: EdgeInsets.only(top: 0),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          style: const TextStyle(
                            fontFamily: 'Arial Rounded MT Bold',
                            fontSize: 20,
                            color: Color(0xff685374),
                          ),
                          cursorWidth: 2,
                          cursorColor: const Color(0xff685374),
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                              fontFamily: 'Harabara Mais Demo',
                              color: Color(0xff685374),
                              fontSize: 19,
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 0.5,
                                color: Color(0xff685374),
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 0.5,
                                color: Color(0xff685374),
                              ),
                            ),
                            suffix: IconButton(
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              icon: FaIcon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash,
                                color: const Color(0xff685374),
                              ),
                            ),
                            contentPadding: const EdgeInsets.only(top: 0),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 70, bottom: 80),
                          child: Row(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Sign in',
                                  style: TextStyle(
                                    fontFamily: 'Harabara Mais Demo',
                                    fontSize: 28,
                                    color: Color(0xffdb8b56),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Icon(
                                  LineIcons.angleRight,
                                  color: Color(0xffffeddf),
                                  size: 35,
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    const CircleBorder(),
                                  ),
                                  padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(15),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                    const Color(0xffB63d42),
                                  ),
                                  overlayColor:
                                      MaterialStateProperty.resolveWith<Color?>(
                                    (states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        return const Color(0xffdb8b56);
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 50),
                          child: Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpSreen()),
                                  );
                                },
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                      fontFamily: 'Arial Rounded MT Bold',
                                      fontSize: screenWidth * 0.05,
                                      color: const Color(0xff685374),
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot password ?',
                                  style: TextStyle(
                                      fontFamily: 'Arial Rounded MT Bold',
                                      fontSize: screenWidth * 0.05,
                                      color: const Color(0xff685374),
                                      decoration: TextDecoration.underline),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
