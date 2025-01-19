// import 'package:flutter/material.dart';
// import 'package:flutter_bakong_khqr/core/khqr_curency.dart';
// import 'package:flutter_bakong_khqr/flutter_bakong_khqr.dart';
// import 'package:flutter_bakong_khqr/view/bakong_khqr.dart';
// import 'package:movie/screens/booking/components/pay_button.dart';
// class QrPay extends StatefulWidget {
//   const QrPay({Key? key}) : super(key: key);
//
//   @override
//   State<QrPay> createState() => _QrPayState();
// }
//
// class _QrPayState extends State<QrPay> {
//
//   String _qrCode = '';
//   String _md5Hash = '';
//   final bakong = FlutterBakongKhqr();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   Future<void> QrPay()async{
//     final response = await bakong.generateKhqrIndividual(
//         bakongAccountId: 'sreynoch_dot@aclb',
//         amount: 20.00,
//         merchantName: 'Sreynoch Dot'
//     );
//     setState(() {
//       _qrCode = response.qrCode;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(_qrCode),
//         BakongKhqrView(
//             receiverName: 'Sreynoch Dot',
//             currency: KhqrCurrency.usd,
//             qr: _qrCode)
//       ],
//     );
//   }
// }
//
//
