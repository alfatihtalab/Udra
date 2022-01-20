// import 'package:flutter/material.dart';
// import 'package:flutter_hosham_app/models/udra_service.dart';
// import 'package:flutter_hosham_app/responsive.dart';
// import 'package:flutter_hosham_app/theme_app.dart';

// class UrdaServiceCard extends StatelessWidget {
//   const UrdaServiceCard({Key? key, required this.udraService})
//       : super(key: key);

//   final UdraService udraService;

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig sizeConfig = SizeConfig();

//     sizeConfig.initilize(context);
//     return Container(
//         margin: EdgeInsets.all(10.0),
//         decoration: BoxDecoration(
//           color: udraService.color,
//           shape: BoxShape.rectangle,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Flexible(
//               // fit: FlexFit.tight,
//               child: Text(
//                 udraService.name,
//                 overflow: TextOverflow.fade,
//                 softWrap: true,
//                 style: DemoTheme.lightTextTheme.headline2,
//               ),
//             ),
//           ],
//         ));
//   }
// }
