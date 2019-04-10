import 'package:flutter/material.dart';
import 'package:access_settings_menu/access_settings_menu.dart';

Widget loadingDialog = WillPopScope(
  onWillPop: () async {
    return new Future(() => false);
  },
  child: AlertDialog(
    content: Row(
      children: <Widget>[
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreenAccent),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            "Prosimo počakajte",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20.0,
            ),
          ),
        ),
      ],
    ),
  ),
);

Widget locationDialog = WillPopScope(
  onWillPop: () async {
    return new Future(() => false);
  },
  child: AlertDialog(
    content: Row(
      children: <Widget>[
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreenAccent),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            "Iskanje lokacije ...",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20.0,
            ),
          ),
        ),
      ],
    ),
  ),
);

Widget exitDialog(BuildContext context) {
  return WillPopScope(
    onWillPop: () async {
      return new Future(() => false);
    },
    child: AlertDialog(
      title: Text('Izhod'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              'Želite zapreti aplikacijo?',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'PREKLIČI',
            style: TextStyle(color: Colors.lightGreenAccent),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text(
            'POTRDI',
            style: TextStyle(color: Colors.lightGreenAccent),
          ),
          onPressed: () {
          },
        ),
      ],
    ),
  );
}

Widget openSettings(BuildContext context) {

  openSettingsMenu() async {
    var resultSettingsOpening = false;
    try {
      resultSettingsOpening = await AccessSettingsMenu.openSettings(settingsType: 'ACTION_LOCATION_SOURCE_SETTINGS');
    } catch (e) {
      resultSettingsOpening = false;
    }
    return resultSettingsOpening;
  }

  return WillPopScope(
    onWillPop: () async {
      return new Future(() => false);
    },
    child: AlertDialog(
      title: Text('Lokacija onemogočena'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              'Želite odpreti nastavitve lokacije?',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'PREKLIČI',
            style: TextStyle(color: Colors.lightGreenAccent),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text(
            'ODPRI',
            style: TextStyle(color: Colors.lightGreenAccent),
          ),
          onPressed: () {
            openSettingsMenu();
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}


