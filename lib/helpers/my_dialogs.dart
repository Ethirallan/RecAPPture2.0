import 'package:flutter/material.dart';
import 'package:access_settings_menu/access_settings_menu.dart';
import 'package:recappture2/helpers/my_colors.dart';
import 'package:recappture2/model/my_data.dart';
import 'dart:io';

Widget loadingDialog = WillPopScope(
  onWillPop: () async {
    return new Future(() => false);
  },
  child: AlertDialog(
    content: Row(
      children: <Widget>[
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(MyColors.green),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            "Prosimo počakajte ...",
            style: TextStyle(
              color: MyColors.grey,
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
          valueColor: AlwaysStoppedAnimation<Color>(MyColors.green),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            "Iskanje lokacije ...",
            style: TextStyle(
              color: MyColors.grey,
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
              'Želite zapreti aplikacijo?', style: TextStyle(color: MyColors.green, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'PREKLIČI',
            style: TextStyle(color: MyColors.green),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text(
            'POTRDI',
            style: TextStyle(color: MyColors.green),
          ),
          onPressed: () {
            exit(0);
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
      title: Text('Lokacija onemogočena', style: TextStyle(color: MyColors.green, fontWeight: FontWeight.bold),),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              'Želite odpreti nastavitve lokacije?',
              style: TextStyle(color: MyColors.grey),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'PREKLIČI',
            style: TextStyle(color: MyColors.green),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text(
            'ODPRI',
            style: TextStyle(color: MyColors.green),
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


