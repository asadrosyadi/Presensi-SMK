import 'package:attendancewithfingerprint/database/db_helper.dart';
import 'package:attendancewithfingerprint/screen/main_menu_page.dart';
import 'package:attendancewithfingerprint/utils/strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

enum LoginStatus { notSignIn, signIn, doubleCheck }

class _LoginPageState extends State<LoginPage> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String email, pass, isLogged, getUrl, getKey;
  String statusLogged = 'logged';
  String getPath = '/api/login';
  final _key = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _secureText = true;

  // Progress dialog
  ProgressDialog pr;

  // Database
  DbHelper dbHelper = DbHelper();

  @override
  void initState() {
    getSettings();
    super.initState();
    // First init
    // Check is user is logged, or not
  }

  // Function show or not the password
  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  // Check if all data is ok, will submit the form via API
  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      login('clickButton');
    }
  }

  // Get settings data
  void getSettings() async {
    var getSettings = await dbHelper.getSettings(1);
    setState(() {
      getUrl = getSettings.url;
      getKey = getSettings.key;

      getPref();
    });
  }

  // Function communicate with the server via API
  login(String fromWhere) async {
    var urlLogin = getUrl + getPath;
    if (fromWhere == 'clickButton') pr.show();

    Dio dio = new Dio();
   // FormData formData =
     //   new FormData.fromMap({"email": email, "password": pass});
   // final response = await dio.post(urlLogin, data: formData);
    final response =
        await dio.post(urlLogin, data: {"email": email, "password": pass});
        print(response.data);

    // Return the json data
    var data = response.data;

    // Get the message data from json
    String message = data['message'];

    // Check if success
    if (message == "success") {
      int role = data['user']['role'];
      if (role == 1 || role == 4) {
        setState(() {
          getSnackBar(login_wrong_role);
        });
      } else {
        isLogged = statusLogged;
        String email = data['user']['email'];
        int userId = data['user']['id'];

        setState(() {
          _loginStatus = LoginStatus.signIn;
          savePref(isLogged, email, pass, userId);
        });
      }
    } else {
      // Password and email wrong
      if (fromWhere == 'clickButton') {
        setState(() {
          getSnackBar(login_failed);
        });
      } else {
        // Before correct email and password, but maybe user change the email and password
        setState(() {
          getSnackBar(login_double_check);
          _loginStatus = LoginStatus.notSignIn;
          removePref();
        });
      }
    }

    // Hide the loading
    Future.delayed(Duration(seconds: 0)).then((value) {
      if (mounted) {
        setState(() {
          if (fromWhere == 'clickButton') pr.hide();
        });
      }
    });
  }

  removePref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("status", null);
    preferences.setString("email", null);
    preferences.setString("password", null);
    preferences.setInt("id", null);
  }

  // Show snackBar
  getSnackBar(String messageSnackBar) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(messageSnackBar)));
  }

  // Save the data from json data
  savePref(String getStatus, String getEmployeeId, String getPassword,
      int getUserId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("status", getStatus);
      preferences.setString("email", getEmployeeId);
      preferences.setString("password", getPassword);
      preferences.setInt("id", getUserId);
    });
  }

  // Check is there any data at Shared Preferences, is any data, means user logged
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      var getStatusSp = preferences.getString("status");
      var getEmail = preferences.getString("email");
      var getPassword = preferences.getString("password");

      if (getStatusSp == statusLogged) {
        _loginStatus = LoginStatus.doubleCheck;
        // if user already login, will check again, if there is any change on web server
        // Like change the role, or the status
        email = getEmail;
        pass = getPassword;
        login('doubleCheck');
      } else {
        _loginStatus = LoginStatus.notSignIn;
      }
    });
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    // Show progress
    pr = new ProgressDialog(context, type: ProgressDialogType.Normal);
    // Style progress
    pr.style(
        message: login_checking_progress,
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        padding: EdgeInsets.all(10.0),
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600));

    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: Color(0xFF0E67B4),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 100.0),
                      child: Image(
                        image: AssetImage('images/skanesba.png'),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: Text(
                        login_subtitle,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.quicksand(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                    child: Form(
                      key: _key,
                      child: ListView(
                        padding: EdgeInsets.all(16.0),
                        children: <Widget>[
                          inputLogin(true, email, login_label_email,
                              login_empty_email),
                          SizedBox(height: 20),
                          inputLogin(false, pass, login_label_password,
                              login_empty_password),
                          Container(
                            margin: EdgeInsets.only(top: 20.0),
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                check();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF003D84),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Color(0xFF003D84)),
                                ),
                              ),
                              child: Text(login_button),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
        break;
      case LoginStatus.signIn:
        return MainMenuPage();
        break;
      case LoginStatus.doubleCheck:
        return Scaffold(
          backgroundColor: Colors.blue,
          key: _scaffoldKey,
          body: Container(
            color: Color(0xFF0E67B4),
            child: Center(
              child: Image(
                image: AssetImage('images/skanesba.png'),
              ),
            ),
          ),
        );
        break;
    }
  }

  TextFormField inputLogin(
      bool isEmail, String value, String label, String messageError) {
    return TextFormField(
      style: GoogleFonts.quicksand(color: Colors.white),
      validator: (e) {
        var message;
        if (e.isEmpty) {
          message = messageError;
        }
        return message;
      },
      onSaved: (e) {
        if (isEmail) email = e;
        if (!isEmail) pass = e;
      },
      obscureText: !isEmail ? _secureText : false,
      decoration: InputDecoration(
        labelText: label,
        hintStyle: GoogleFonts.quicksand(color: Colors.white),
        labelStyle: TextStyle(color: Colors.white),
        suffixIcon: !isEmail
            ? IconButton(
                onPressed: showHide,
                icon:
                    Icon(_secureText ? Icons.visibility_off : Icons.visibility),
              )
            : null,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFDBE2E7),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
