
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logueo_2/styles.dart';

class SingIn extends StatefulWidget {
  const SingIn({Key? key}) : super(key: key);

  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  bool _isObscure = true;

  // Toggles the password show status
  void _toggle() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LoginStyle.colorFondo,
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 50),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 80, bottom: 10),
                    child: Text(
                      'Hello Again!',
                      style: LoginStyle.textTittle,
                    ),
                  ),
                  Text(
                    'Wellcome back you´ve',
                    style: LoginStyle.textTittle2,
                  ),
                  Text(
                    'been missed!',
                    style: LoginStyle.textTittle2,
                  ),
                ],
              ),
            ),
            Container(
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Enter Username',
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 6),
                        borderRadius: BorderRadius.circular(15.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 4),
                        borderRadius: BorderRadius.circular(15.0))),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 30),
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
                child: TextFormField(
                obscureText: _isObscure,
                decoration: InputDecoration(
                    labelText: 'Password',
                      suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          }),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 6),
                        borderRadius: BorderRadius.circular(15.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 4),
                        borderRadius: BorderRadius.circular(15.0))),
              ),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width / 1.33,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Recovery Password', style: LoginStyle.textSubTittle,),
                  ],
                ),
            )
          ],
        ),
      ),
    );
  }
}
