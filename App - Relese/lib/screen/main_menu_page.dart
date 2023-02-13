import 'package:android_intent/android_intent.dart';
import 'package:attendancewithfingerprint/database/db_helper.dart';
import 'package:attendancewithfingerprint/screen/attendance_page.dart';
import 'package:attendancewithfingerprint/screen/login_page.dart';
import 'package:attendancewithfingerprint/screen/report_page.dart';
import 'package:attendancewithfingerprint/screen/scan_qr_page.dart';
import 'package:attendancewithfingerprint/screen/setting_page.dart';
import 'package:attendancewithfingerprint/utils/single_menu.dart';
import 'package:attendancewithfingerprint/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'about_page.dart';

class MainMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Menu();
  }
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String getEmail = "";
  DbHelper dbHelper = DbHelper();

  @override
  void initState() {
    _getPermission();
    getPref();
    super.initState();
  }

  void _getPermission() async {
    getPermissionAttendance();
    _checkGps();
  }

  void getPermissionAttendance() async {
    await [
      Permission.camera,
      Permission.location,
      Permission.locationWhenInUse,
    ].request();
  }

  // Check the GPS is on
  Future _checkGps() async {
    if (!(await Geolocator.isLocationServiceEnabled())) {
      if (Theme.of(context).platform == TargetPlatform.android) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Can't get current location"),
              content:
                  const Text('Please make sure your enable GPS and try again.'),
              actions: <Widget>[
                TextButton(
                  child: Text('Ok'),
                  onPressed: () async {
                    final AndroidIntent intent = AndroidIntent(
                        action: 'android.settings.LOCATION_SOURCE_SETTINGS');

                    await intent.launch();
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  // Function sign out
  _signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await dbHelper.delete();
    setState(() {
      preferences.remove("status");
      preferences.remove("email");
      preferences.remove("password");
      preferences.remove("id");

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ScanQrPage()));
    });
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      getEmail = preferences.getString("email");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F4F8),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: EdgeInsets.only(bottom: 40.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 150.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('images/logo_smk.png'),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            main_menu_title_a + " " + getEmail + ",",
                            style: GoogleFonts.quicksand(
                                fontSize: 13.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            main_menu_title_b,
                            style: GoogleFonts.quicksand(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF0E67B4),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SingleMenu(
                            icon: FontAwesomeIcons.userClock,
                            menuName: main_menu_check_in,
                            color: Colors.blue,
                            action: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => AttendancePage(
                                  query: 'in',
                                  title: main_menu_check_in_title,
                                ),
                              ),
                            ),
                            decName: main_menu_check_in_dec,
                          ),
                          SingleMenu(
                            icon: FontAwesomeIcons.solidClock,
                            menuName: main_menu_check_out,
                            color: Colors.teal,
                            action: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => AttendancePage(
                                  query: 'out',
                                  title: main_menu_check_out_title,
                                ),
                              ),
                            ),
                            decName: main_menu_check_out_dec,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SingleMenu(
                            icon: FontAwesomeIcons.gears,
                            menuName: main_menu_settings,
                            color: Colors.green,
                            action: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => SettingPage()),
                            ),
                            decName: main_menu_settings_dec,
                          ),
                          SingleMenu(
                            icon: FontAwesomeIcons.calendar,
                            menuName: main_menu_report,
                            color: Colors.yellow[700],
                            action: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => ReportPage()),
                            ),
                            decName: main_menu_report_dec,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SingleMenu(
                            icon: FontAwesomeIcons.userLarge,
                            menuName: main_menu_about,
                            color: Colors.purple,
                            action: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => AboutPage()),
                            ),
                            decName: main_menu_about_dec,
                          ),
                          SingleMenu(
                            icon: FontAwesomeIcons.rightFromBracket,
                            menuName: main_menu_logout,
                            color: Colors.red[300],
                            action: () => _signOut(),
                            decName: main_menu_logout_dec,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
