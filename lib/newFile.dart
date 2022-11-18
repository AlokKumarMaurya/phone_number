import 'package:flutter/material.dart';
import 'package:libphonenumber/libphonenumber.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var phone;
  bool? isValid = false;
  var normalize;
  var region;
  var name;
  var type;

  verifyPhoneNumber(String num) async {
    var isValid1 = await PhoneNumberUtil.isValidPhoneNumber(
        phoneNumber: num, isoCode: "IN");
    var normalize1 = await PhoneNumberUtil.normalizePhoneNumber(
        phoneNumber: num, isoCode: "IN");
    var region1 =
        await PhoneNumberUtil.getRegionInfo(phoneNumber: num, isoCode: "IN");
    var name1 =
        await PhoneNumberUtil.getNameForNumber(phoneNumber: num, isoCode: "IN");
    var type1 =
        await PhoneNumberUtil.getNumberType(phoneNumber: num, isoCode: "IN");
    setState(() {
      phone = num;
      isValid = isValid1;
      normalize = normalize1;
      region = region1;
      name = name1;
      type = type1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Verify phone number"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              height: 40,
              padding: EdgeInsets.all(20),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: TextFormField(
                onChanged: (val) {
                  setState(() {
                    phone = val;
                  });
                },
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText: "Enter number", border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  verifyPhoneNumber(phone);
                },
                child: Text("Get Details")),
            SizedBox(
              height: 30,
            ),
            Text("phone :" + phone.toString()),
            Text("isvalid " + isValid.toString()),
            Text("normalize no. :" + normalize.toString()),
            Text("region :" + region.toString()),
            Text("name :" + name.toString()),
            Text("type :" + type.toString())
          ],
        ),
      ),
    );
  }
}
