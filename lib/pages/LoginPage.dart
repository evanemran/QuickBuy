import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickbuy/pages/HomePage.dart';

import '../utils/SocialButton.dart';

bool _passwordVisible = false;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? isChecked = false;

  Widget _buildTextField({
    required bool obscureText,
    Widget? prefixedIcon,
    String? hintText,
  }) {
    return Card(
      color: Colors.transparent,
      elevation: 8,
      // shape: const StadiumBorder(
      //   side: BorderSide(
      //     color: Colors.black,
      //     width: 2.0,
      //   ),
      // ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        cursorColor: Colors.black,
        keyboardType: TextInputType.emailAddress,
        cursorWidth: 2,
        enableSuggestions: false,
        autocorrect: false,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: prefixedIcon,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontFamily: 'PTSans',
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required bool obscureText,
    Widget? prefixedIcon,
    String? hintText,
  }) {
    return Card(
      color: Colors.transparent,
      elevation: 8,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        cursorColor: Colors.black,
        keyboardType: TextInputType.visiblePassword,
        cursorWidth: 2,
        enableSuggestions: false,
        autocorrect: false,
        obscureText: !_passwordVisible,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: prefixedIcon,
          hintText: hintText,
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              _passwordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: Colors.black,
            ),
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          hintStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontFamily: 'PTSans',
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordButton() {
    return Container(
      alignment: Alignment.centerLeft,
      child: TextButton(
        child: const Text(
          'Forgot Password?',
          style: TextStyle(
            fontFamily: 'PT-Sans',
            fontSize: 14,
            color: Colors.blueAccent,
          ),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _buildRemeberMe() {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value;
            });
          },
          checkColor: Colors.blue,
          fillColor: MaterialStateProperty.all(Colors.white),
        ),
        const Text(
          'Remember me',
          style: TextStyle(
            fontFamily: 'PT-Sans',
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.black,
          ),
          elevation: MaterialStateProperty.all(6),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Sign in',
            style: TextStyle(
              fontFamily: 'PT-Sans',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage(title: "Quick Buy")));
        },
      ),
    );
  }

  Widget _buildSocialImageButtons({
    required String title,
    required String image,
    required Color color
  }) {
    return SocialButton(texto: title, imagem: image, cor: color,);
  }

  Widget _buildLogoButton({
    required String image,
    required String title,
    required VoidCallback onPressed,
  }) {

    return FloatingActionButton(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))
      ),
      onPressed: onPressed,
      child: SizedBox(
          height: 30,
          child: Row(
            children: [
              Image.asset(image),
              Text(title)
            ],
          )
      ),
    );
  }

  Widget _buildSocialButtons() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSocialImageButtons(
            title: 'Sign in With Google',
            image: 'assets/images/google_logo.png',
            color: Colors.transparent
        ),
        _buildSocialImageButtons(
            title: 'Sign in'
                ' With Facebook',
            image: 'assets/images/facebook_logo.png',
            color: Colors.transparent
        )
      ],
    );
  }

  Widget _buildSignUpQuestion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          'Don\t have an Account? ',
          style: TextStyle(
            fontFamily: 'PT-Sans',
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        InkWell(
          child: const Text(
            'Sign Up',
            style: TextStyle(
              fontFamily: 'PT-Sans',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => RegistrationPage()),
            // );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ).copyWith(top: 60),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Sign in',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'PT-Sans',
                        fontSize: 26,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  _buildSocialButtons(),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    '- OR -',
                    style: TextStyle(
                      fontFamily: 'PT-Sans',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Email',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'PT-Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildTextField(
                    hintText: 'Enter your email',
                    obscureText: false,
                    prefixedIcon: const Icon(Icons.mail, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Password',
                      style: TextStyle(
                        fontFamily: 'PT-Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildPasswordField(
                    hintText: 'Enter your password',
                    obscureText: true,
                    prefixedIcon: const Icon(Icons.lock, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildForgotPasswordButton(),
                  // _buildRemeberMe(),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildLoginButton(),

                  const SizedBox(
                    height: 30,
                  ),
                  _buildSignUpQuestion()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}