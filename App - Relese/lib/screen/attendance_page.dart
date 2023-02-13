import 'dart:async';

import 'package:attendancewithfingerprint/model/attendance.dart';
import 'package:attendancewithfingerprint/screen/main_menu_page.dart';
import 'package:attendancewithfingerprint/utils/strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trust_location/trust_location.dart';

import '../database/db_helper.dart';
import '../model/settings.dart';
import '../utils/utils.dart';

class AttendancePage extends StatefulWidget {
  final String query;
  final String title;

  AttendancePage({this.query, this.title});

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  // Progress dialog
  ProgressDialog pr;

  final LocalAuthentication _localAuthentication = LocalAuthentication();

  // Database
  DbHelper dbHelper = DbHelper();

  // Utils
  Utils utils = Utils();

  // Model settings
  Settings settings;

  // Global key scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // String
  String getUrl,
      getKey,
      getQrId,
      getQuery,
      getPath = 'api/attendance/apiSaveAttendance',
      mAccuracy,
      getPathArea = 'api/area/index';

  var getId, _value;
  bool _isMockLocation, clickButton = false;

  // Geolocation
  Position _currentPosition;
  final Geolocator geoLocator = Geolocator();
  var subscription;
  double setAccuracy = 200.0;

  // Arr area
  List dataArea = [];

  @override
  void initState() {
    super.initState();
    getPref();
    _getCurrentLocation();
    getSettings();
    TrustLocation.start(5);
    checkMockInfo();
  }

  @override
  void dispose() {
    TrustLocation.stop();
    super.dispose();
  }

  // Getting area via API
  getAreaApi() async {
    pr.show();
    final uri = utils.getRealUrl(getUrl, getPathArea);
    Dio dio = Dio();
    final response = await dio.get(uri);

    var data = response.data;

    if (data['message'] == 'success') {
      dataArea = data['area'];
    } else {
      dataArea = [
        {"id": 0, "name": "No Data Area"}
      ];
    }

    setState(() {
      pr.hide();
    });
  }

  // Checking Mock (fake GPS)
  checkMockInfo() async {
    try {
      TrustLocation.onChange
          .listen((values) => _isMockLocation = values.isMockLocation);
    } on PlatformException catch (e) {
      print('PlatformException $e');
    }
  }

  // Get latitude longitude
  _getCurrentLocation() {
    subscription = Geolocator.getPositionStream().listen((position) {
      if (mounted) {
        setState(() {
          _currentPosition = position;
        });

        _getAddressFromLatLng(_currentPosition.accuracy);
      }
    });
  }

  // Get address
  _getAddressFromLatLng(double accuracy) async {
    String strAccuracy = accuracy.toStringAsFixed(1);
    if (accuracy > setAccuracy) {
      mAccuracy = '$strAccuracy $attendance_not_accurate';
    } else {
      mAccuracy = '$strAccuracy $attendance_accurate';
    }
  }

  // Get settings data
  void getSettings() async {
    var getSettings = await dbHelper.getSettings(1);
    setState(() {
      getUrl = getSettings.url;
      getKey = getSettings.key;
      getAreaApi();
    });
  }

  // Check is there any data at Shared Preferences, is any data, means user logged
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      getId = preferences.getInt("id");
    });
  }

  // Send data post via http
  sendData() async {
    pr.show();

    // Get info for attendance
    var dataKey = getKey;
    var dataQuery = getQuery;

    // Add data to map
    Map<String, dynamic> body = {
      'key': dataKey,
      'worker_id': getId,
      'q': dataQuery,
      'lat': _currentPosition.latitude,
      'longt': _currentPosition.longitude,
      'area_id': _value,
    };

    // Sending the data to server
    final uri = utils.getRealUrl(getUrl, getPath);
    Dio dio = Dio();
    FormData formData = FormData.fromMap(body);
    final response = await dio.post(uri, data: formData);

    var data = response.data;

    // Show response from server via snackBar
    if (data['message'] == 'Success!') {
      // Set the url and key
      Attendance attendance = Attendance(
          date: data['date'],
          time: data['time'],
          location: data['location'],
          type: data['query']);

      // Insert the settings
      insertAttendance(attendance);

      // Hide the loading
      Future.delayed(Duration(seconds: 0)).then((value) {
        if (mounted) {
          setState(() {
            subscription.cancel();
            pr.hide();
            Alert(
              context: _scaffoldKey.currentContext,
              type: AlertType.success,
              title: "Success",
              desc: "$attendance_show_alert-$dataQuery $attendance_success_ms",
              buttons: [
                DialogButton(
                  child: Text(
                    ok_text,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MainMenuPage()),
                    (Route<dynamic> route) => false,
                  ),
                  width: 120,
                )
              ],
            ).show();
          });
        }
      });
    } else if (data['message'] == 'cannot attend') {
      Future.delayed(Duration(seconds: 0)).then((value) {
        setState(() {
          pr.hide();

          utils.showAlertDialog(
              outside_area, "warning", AlertType.warning, _scaffoldKey, true);
        });
      });
    } else if (data['message'] == 'location not found') {
      Future.delayed(Duration(seconds: 0)).then((value) {
        setState(() {
          pr.hide();

          utils.showAlertDialog(location_not_found, "warning",
              AlertType.warning, _scaffoldKey, true);
        });
      });
    } else if (data['message'] == 'already check-in') {
      Future.delayed(Duration(seconds: 0)).then((value) {
        setState(() {
          pr.hide();

          utils.showAlertDialog(already_check_in, "warning", AlertType.warning,
              _scaffoldKey, true);
        });
      });
    } else if (data['message'] == 'check-in first') {
      Future.delayed(Duration(seconds: 0)).then((value) {
        setState(() {
          pr.hide();

          utils.showAlertDialog(
              check_in_first, "warning", AlertType.warning, _scaffoldKey, true);
        });
      });
    } else if (data['message'] == 'Error! Something Went Wrong!') {
      Future.delayed(Duration(seconds: 0)).then((value) {
        setState(() {
          pr.hide();

          utils.showAlertDialog(attendance_error_server, "Error",
              AlertType.error, _scaffoldKey, true);
        });
      });
    } else {
      Future.delayed(Duration(seconds: 0)).then((value) {
        setState(() {
          pr.hide();

          utils.showAlertDialog(response.data.toString(), "Error",
              AlertType.error, _scaffoldKey, true);
        });
      });
    }
  }

  insertAttendance(Attendance object) async {
    await dbHelper.newAttendances(object);
  }

  // To check if any type of biometric authentication
  // hardware is available.
  Future<bool> _isBiometricAvailable() async {
    bool isAvailable = false;
    try {
      isAvailable = await _localAuthentication.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return isAvailable;

    return isAvailable;
  }

  // To retrieve the list of biometric types
  // (if available).
  /*Future<void> _getListOfBiometricTypes() async {
    try {
      await _localAuthentication.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;
  }*/

  // Process of authentication user using
  // biometrics.
  /*Future<void> _authenticateUser() async {
    bool isAuthenticated = false;
    try {
      isAuthenticated = await _localAuthentication.authenticate(
        localizedReason: "Authenticate to attending",
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
         // biometricOnly: true,
        ),
      );
    } on PlatformException catch (e) {
      print(e);
      Future.delayed(Duration(seconds: 0)).then((value) {
        setState(() {
          pr.hide();

          //utils.showAlertDialog(empty_fingerprint, "warning", AlertType.warning,
            //  _scaffoldKey, true);
        });
      });

      return false;
    }

    if (!mounted) return;

    if (isAuthenticated) {
      sendData();
    }
  }*/

  // This function is about checking if the user uses Mock (Fake GPS) to make attendance
  checkMockIsNull() async {
    // Check if user click button attendance
    if (clickButton) {
      // Check mock is already get status
      if (_isMockLocation == null) {
        Future.delayed(Duration(seconds: 0)).then((value) {
          // Check if pr is showing or not
          if (!pr.isShowing()) {
            pr.show();
            pr.update(
              progress: 50.0,
              message: check_mock,
              progressWidget: Container(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator()),
              maxProgress: 100.0,
              progressTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w400),
              messageTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 19.0,
                  fontWeight: FontWeight.w600),
            );
          }
        });
      } else if (_isMockLocation == true) {
        Future.delayed(Duration(seconds: 0)).then((value) {
          // Detect mock is true, mean user use fake gps
          setState(() {
            clickButton = false;
            if (pr.isShowing()) {
              pr.hide();
            }
          });

          utils.showAlertDialog(
              fake_gps, "warning", AlertType.warning, _scaffoldKey, true);
        });
      } else {
        Future.delayed(Duration(seconds: 0)).then((value) async {
          setState(() {
            clickButton = false;
            if (pr.isShowing()) {
              pr.hide();
            }
          });

          // Check if area is not empty
          if (_value == null) {
            Future.delayed(Duration(seconds: 0)).then((value) {
              setState(() {
                pr.hide();

                utils.showAlertDialog(select_area, "warning", AlertType.warning,
                    _scaffoldKey, true);
              });
            });

            return;
          }

          // If already get mock will continue show biometric
          //if (await _isBiometricAvailable()) {
            //await _getListOfBiometricTypes();
            //await _authenticateUser();
            sendData();
         // } else {
         //   Future.delayed(Duration(seconds: 0)).then((value) {
         //     setState(() {
         //       pr.hide();

         //       utils.showAlertDialog(not_support_fingerprint, "warning",
         //           AlertType.warning, _scaffoldKey, true);
         //     });
         //   });

         //   return;
         // }
        });
      }
    }
  }

  // Show snackBar
  getSnackBar(String messageSnackBar) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(messageSnackBar)));
  }

  @override
  Widget build(BuildContext context) {
    // Show progress
    pr = ProgressDialog(context,
        isDismissible: false, type: ProgressDialogType.Normal);
    // Style progress
    pr.style(
      message: attendance_sending,
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
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    );

    // Init the query
    getQuery = widget.query;

    // Check if user use fake gps
    checkMockIsNull();

    return Scaffold(
      backgroundColor: Color(0xFFF1F4F8),
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(60.0, 20.0, 60.0, 20.0),
              child: Column(
                children: [
                  Text(
                    attendance_select_area,
                    style: GoogleFonts.quicksand(
                        color: Colors.grey[600],
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  DropdownButton(
                    items: dataArea.map((item) {
                      return DropdownMenuItem(
                        child: Text(item['name']),
                        value: item['id'].toString(),
                      );
                    }).toList(),
                    onChanged: (newVal) {
                      setState(() {
                        _value = newVal;
                      });
                    },
                    value: _value,
                    isExpanded: true,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              width: double.infinity,
              height: 60.0,
              child: ElevatedButton(
                onPressed: () {
                  clickButton = true;
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF003D84),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                child: Text(button_scan_attend),
              ),
            ),
            Text(
              '$attendance_button_info-$getQuery.',
              style: GoogleFonts.quicksand(color: Colors.grey, fontSize: 12.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '$attendance_accurate_info $mAccuracy $attendance_on_gps',
              style: GoogleFonts.quicksand(
                  color: Colors.grey[800], fontSize: 14.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
