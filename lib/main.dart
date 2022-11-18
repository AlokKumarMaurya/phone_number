import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:libphonenumber/libphonenumber.dart';
import 'package:phone_number/newFile.dart';

void main() => runApp(new MaterialApp(
  home: MyApp(),
  darkTheme:ThemeData.dark(),
  debugShowCheckedModeBanner: false,
));

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final TextEditingController _textController = TextEditingController();
//   bool _isValid = false;
//   String _normalized = '';
//   RegionInfo? _regionInfo;
//   String _carrierName = '';
//   String _exampleNumber = '';
//   var phone;
//   Map<PhoneNumberType, String> _numberMap = <PhoneNumberType, String>{};
//
//   @override
//   void dispose() {
//     _textController.dispose();
//     super.dispose();
//   }
//
//
//
//
//
//   submit()async
//   {
//
//       var s = phone;
//       bool? isValid =
//       await PhoneNumberUtil.isValidPhoneNumber(phoneNumber: s, isoCode: 'IN');
//       String? normalizedNumber = await PhoneNumberUtil.normalizePhoneNumber(
//           phoneNumber: s, isoCode: 'IN');
//       RegionInfo regionInfo =
//       await PhoneNumberUtil.getRegionInfo(phoneNumber: s, isoCode: 'IN-UP',);
//       String? carrierName =
//       await PhoneNumberUtil.getNameForNumber(phoneNumber: s, isoCode: 'IN');
//
//       setState(() {
//         _isValid = isValid??false;
//         _normalized = normalizedNumber??"N/A";
//         _regionInfo = regionInfo;
//         _carrierName = carrierName??"N/A";
//       });
//
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     var phoneText = Padding(
//       padding: EdgeInsets.all(16.0),
//       child: TextFormField(
//         onChanged: (val){
//           phone=val;
//         },
//         decoration: InputDecoration(
//           hintText: "Phone Number",
//         ),
//         controller: _textController,
//         keyboardType: TextInputType.phone,
//       ),
//     );
//
//     var submitButton = MaterialButton(
//       color: Colors.blueAccent,
//       textColor: Colors.white,
//       onPressed: (){
//         submit();
//       },
//       child: Text('Show Details'),
//     );
//
//     var outputTexts = Column(
//       children: <Widget>[
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('Is Valid?'),
//             Padding(
//               padding: EdgeInsets.only(left: 12.0),
//               child: Text(
//                 _isValid ? 'YES' : 'NO',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('Normalized:'),
//             Padding(
//               padding: EdgeInsets.only(left: 12.0),
//               child: Text(
//                 _normalized,
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//         Column(
//           children: _numberMap.entries
//               .map<Widget>(
//                 (MapEntry<PhoneNumberType, String> entry) =>
//                 _NumberFormatEntry(
//                   format: entry.key,
//                   formattedNumber: entry.value,
//                 ),
//           )
//               .toList(),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('Region Info:'),
//             Padding(
//               padding: EdgeInsets.only(left: 12.0),
//               child: Text(
//                 'Prefix=${_regionInfo?.regionPrefix}, \nISO=${_regionInfo?.isoCode},\n'
//                     ' Formatted=${_regionInfo?.formattedPhoneNumber}',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('Carrier'),
//             Padding(
//               padding: EdgeInsets.only(left: 12.0),
//               child: Text(
//                 'Carrier Name=$_carrierName',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('Example'),
//             Padding(
//               padding: EdgeInsets.only(left: 12.0),
//               child: Text(
//                 '${_exampleNumber}',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Plugin example app'),
//         ),
//         body: Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               phoneText,
//               submitButton,
//               Padding(padding: EdgeInsets.all(10.0)),
//               Padding(
//                 padding: EdgeInsets.all(10.0),
//                 child: Text(
//                   'Details for ${_textController.text}',
//                   style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               outputTexts,
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class _NumberFormatEntry extends StatelessWidget {
//    _NumberFormatEntry({Key? key, required this.format, required this.formattedNumber})
//       : super(key: key);
//   final PhoneNumberType format;
//   final String formattedNumber;
//
//   @override
//   Widget build(BuildContext context) {
//     final String rawEnumString = format.toString();
//     final String formatDisplayValue =
//     rawEnumString.substring(rawEnumString.lastIndexOf('.') + 1);
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text('$formatDisplayValue Format:'),
//           Padding(
//             padding: EdgeInsets.only(left: 12.0),
//             child: Text(
//               formattedNumber ?? '',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }