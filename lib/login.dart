import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:registration/register_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:registration/home_page.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);
  // static String tag = 'login-page';
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  //Password Field obscureText  Handler
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  String _errorMessage = '';

  void onChange() {
    setState(() {
      _errorMessage = '';
    });
  }

  bool _isHidden = true;
  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //   child: Container(
    //     decoration: BoxDecoration(
    //       image: DecorationImage(
    //         image: AssetImage(
    //           'assets/login.png',
    //         ),
    //         fit: BoxFit.cover,
    //       ),
    //     ),
    //     child: Scaffold(
    //       backgroundColor: Colors.transparent,
    //       body: Stack(
    //         children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Container(
    //                 padding: EdgeInsets.only(
    //                   top: 60.0,
    //                 ),
    //                 child: Text(
    //                   '\n LOGIN',
    //                   textAlign: TextAlign.center,
    //                   style: TextStyle(
    //                     color: Colors.white,
    //                     fontSize: 40.0,
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //           SingleChildScrollView(
    //             child: Container(
    //               padding: EdgeInsets.only(
    //                 top: MediaQuery.of(context).size.height * 0.5,
    //                 left: 35,
    //                 right: 35,
    //               ),
    //               child: Column(
    //                 children: [
    //                   TextField(
    //                     decoration: InputDecoration(
    //                       labelText: 'Email',
    //                       prefixIcon: Icon(Icons.email_outlined),
    //                       fillColor: Colors.grey.shade100,
    //                       filled: true,
    //                       border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(10.0),
    //                       ),
    //                     ),
    //                   ),
    //                   SizedBox(height: 30.0),
    //                   TextFormField(
    //                     validator: (value) {
    //                       if (value == null || value.isEmpty) {
    //                         return 'Please enter the password';
    //                       } else if (value.length <= 6) {
    //                         return 'Password must be greater than 6 digits';
    //                       }
    //                     },
    //                     obscureText: true,
    //                     decoration: InputDecoration(
    //                       labelText: 'Password',
    //                       fillColor: Colors.grey.shade100,
    //                       prefixIcon: Icon(Icons.lock),
    //                       suffixIcon: IconButton(
    //                         onPressed: _toggleVisibility,
    //                         icon: _isHidden
    //                             ? Icon(Icons.visibility)
    //                             : Icon(Icons.visibility_off),
    //                       ),
    //                       filled: true,
    //                       // hintText: 'Password',
    //                       border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(10.0),
    //                       ),
    //                     ),
    //                   ),
    //                   SizedBox(height: 30.0),
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.end,
    //                     children: [
    //                       ElevatedButton(
    //                           style: ElevatedButton.styleFrom(
    //                             maximumSize: Size(170.0, 90.0),
    //                             minimumSize: Size(170.0, 60.0),
    //                             primary: Colors.black,
    //                             shape: StadiumBorder(),
    //                           ),
    //                           onPressed: () {
    //                             Navigator.pushNamed( context, '/setup');
    //                           },
    //                           child: Row(
    //                             mainAxisAlignment:
    //                             MainAxisAlignment.spaceBetween,
    //                             //crossAxisAlignment: CrossAxisAlignment.center,
    //                             children: [
    //                               Text('LOG IN'),
    //                               Icon(
    //                                 Icons.lock,
    //                                 color: Colors.white,
    //                               ),
    //                             ],
    //                           )),
    //                     ],
    //                   ),
    //                   SizedBox(height: 30.0),
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       TextButton(
    //                         onPressed: () {
    //                           Navigator.pushNamed(context, 'register');
    //                         },
    //                         child: Text(
    //                           'Register',
    //                           style: TextStyle(color: Colors.black),
    //                         ),
    //                       ),
    //                       TextButton(
    //                         onPressed: () {
    //                           Navigator.pushNamed(context, '/setup');
    //                         },
    //                         child: Text(
    //                           'Home page',
    //                           style: TextStyle(color: Colors.black),
    //                         ),
    //                       ),
    //                       TextButton(
    //                         onPressed: () {
    //                           Navigator.pushNamed(context, 'forgot');
    //                         },
    //                         child: Text(
    //                           'Forgot password?',
    //                           style: TextStyle(color: Colors.black),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    final node = FocusScope.of(context);

    emailController.addListener(onChange);
    passwordController.addListener(onChange);

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image(
            image: NetworkImage(
                'https://thumbs.dreamstime.com/b/thermometer-symbol-icon-logo-design-template-vector-178784669.jpg')),
      ),
    );

    final errorMessage = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        '$_errorMessage',
        style: TextStyle(fontSize: 14.0, color: Colors.red),
        textAlign: TextAlign.center,
      ),
    );

    final email = TextFormField(
      validator: (value) {
        bool isEmpty = value?.isEmpty ?? true;
        bool containsValue = value?.contains('@') ?? false;
        if (isEmpty || !containsValue) {
          return 'Please enter a valid email.';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: emailController,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      textInputAction: TextInputAction.next,
      onEditingComplete: () => node.nextFocus(),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (v) {
        FocusScope.of(context).requestFocus(node);
      },
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
        ),

        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(24),
        // ),
        onPressed: () {
          if (_formKey.currentState?.validate() == true) {
            signIn(emailController.text, passwordController.text)
                .then((uid) => {Navigator.of(context).pushNamed('welcome')})
                .catchError((error) => {processError(error)});
          }
        },
        // padding: EdgeInsets.all(12),
        // color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = TextButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        Navigator.pushNamed(context, 'forgot');
      },
    );

    final registerButton = Padding(
      padding: EdgeInsets.zero,
      child: TextButton(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(24),
        // ),

        onPressed: () {
          Navigator.of(context).pushNamed('register');
        },
        // padding: EdgeInsets.all(12),
        // color: Colors.lightGreen,
        child: Text('Register', style: TextStyle(color: Colors.black)),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                logo,
                SizedBox(height: 24.0),
                errorMessage,
                SizedBox(height: 12.0),
                email,
                SizedBox(height: 8.0),
                password,
                SizedBox(height: 24.0),
                loginButton,
                registerButton,
                forgotLabel
              ],
            ),
          ),
        ));
  }

  Future<String> signIn(final String email, final String password) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    final User user = userCredential.user!;
    return user.uid;
  }

  void processError(final PlatformException error) {
    if (error.code == "ERROR_USER_NOT_FOUND") {
      setState(() {
        _errorMessage = "Unable to find user. Please register.";
      });
    } else if (error.code == "ERROR_WRONG_PASSWORD") {
      setState(() {
        _errorMessage = "Incorrect password.";
      });
    } else {
      setState(() {
        _errorMessage =
            "There was an error logging in. Please try again later.";
      });
    }
  }
}
