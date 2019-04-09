import 'package:flutter/material.dart';
import 'package:recappture2/helpers/components.dart';
import 'package:recappture2/helpers/my_colors.dart';
import 'package:recappture2/helpers/validators.dart';
import 'package:recappture2/model/my_data.dart';

class ContactSlide extends StatefulWidget {
  @override
  ContactSlideState createState() => ContactSlideState();
}

class ContactSlideState extends State<ContactSlide> with AutomaticKeepAliveClientMixin<ContactSlide> {

  static bool autoValEmail = false;
  static bool autoValPhone = false;
  static GlobalKey<FormState> contactKey = new GlobalKey<FormState>();

  static bool validateContacts() {
    if (contactKey.currentState.validate()) {
      contactKey.currentState.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50),
      child: Form(
        key: contactKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MyImage(
              height: 40,
              asset: 'assets/email.png',
            ),
            MyInputWithLabel(
              label: 'Vnesite email',
              autoVal: autoValEmail,
              onEditingComplete: () =>
              setState(() {
                autoValEmail = true;
              }),
              type: TextInputType.emailAddress,
              validator: MyValidators.validateEmail,
              onSave: (String val) => MyData.email = val,
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: 40),
              child: MyText(
                text: 'in po želji še',
                size: 22,
                color: MyColors.grey,
              ),
            ),
            MyImage(
              height: 40,
              asset: 'assets/call.png',
            ),
            MyInputWithLabel(
              label: 'Vnesite telefon',
              type: TextInputType.phone,
              autoVal: autoValPhone,
              onEditingComplete: () =>
                  setState(() {
                    autoValPhone = true;
                  }),
              validator: MyValidators.validatePhone,
              onSave: (String val) => MyData.phone = val,
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: 2),
              child: MyText(
                text: 'Varnostno opozorilo',
                size: 22,
                color: MyColors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            MyText(
              text: 'Vaši podatki bodo strogo varovani. Uporabili jih bomo le za obveščanje o naši odločitvi in za organizacijo prevoza.',
              size: 16,
              color: MyColors.grey,
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
