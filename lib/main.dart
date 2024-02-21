import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Team Tutors - Login',
      home: LoginPage(title: 'Login'),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 225, 103),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Stack(fit: StackFit.expand, children: <Widget>[
            Container(
              color: const Color.fromARGB(255, 255, 188, 4),
            ),
            Center(
              child: Text(widget.title,
                  style: GoogleFonts.luckiestGuy(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 48))),
            ),
          ])),
      body: const LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  

  @override
  Widget build(BuildContext context) {

    MediaQueryData queryData = MediaQuery.of(context);

    return Form(
      key: _formKey,
      child: Center(
        child: ListView.separated(
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {

          },
          children: <Widget>[

            const Center(child: DefaultText(text: "Email", size: 40.0)),

            const DefaultInput(),

            const Center(child: DefaultText(text: "Password", size: 40.0)),

            const DefaultInput(),

            GestureDetector(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height *
                    0.125,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                      191, 168, 239, 255),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    "Submit",
                    style: GoogleFonts.luckiestGuy(
                      textStyle: const TextStyle(
                      color: Colors.white, fontSize: 40)
                    ),
                  )
                )
              ),
              onTap: () {}
            )
          ]
        )
      )
    );              
  }
}

class DefaultText extends StatelessWidget {
  const DefaultText({super.key, required this.text, required this.size});
  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.luckiestGuy(
        textStyle: TextStyle(
          color: Colors.white, 
          fontSize: size
        )
      )
    );
  }
}

class DefaultInput extends StatelessWidget {
  const DefaultInput({super.key});

  @override
  Widget build(BuildContext context) {
   
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0)
        ),
        hoverColor: Colors.transparent,
        fillColor: const Color.fromARGB(125, 255, 255, 255),
        focusColor: Colors.transparent,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Invalid Email';
        }
        return null;
      },
    );
  }
}