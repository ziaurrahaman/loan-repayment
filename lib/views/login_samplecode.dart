// import 'package:flutter/material.dart';
// import 'package:responsive_app_demo_project/screens/home_screen.dart';
// import 'package:responsive_app_demo_project/utils/images.dart';
// import 'package:responsive_app_demo_project/utils/size_configue.dart';
// import 'package:responsive_app_demo_project/utils/strings.dart';
// import 'package:responsive_app_demo_project/utils/styling.dart';

// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Expanded(
//               flex: 4,
//               child: Align(
//                   alignment: Alignment.center, child: WelcomeContentWidget())),
//           ButtonWidget()
//         ],
//       ),
//     );
//   }
// }

// class WelcomeContentWidget extends StatelessWidget {
//   const WelcomeContentWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Column(
//         mainAxisSize: MainAxisSize.max,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Expanded(
//             flex: 1,
//             child: Align(
//               alignment: Alignment.bottomCenter,
//               child: FittedBox(
//                 child: Text(
//                   Strings.welcomeScreenTitle,
//                   style: Theme.of(context).textTheme.title,
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: Image.asset(
//               Images.homeImage,
//               fit: BoxFit.fill,
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Align(
//               alignment: Alignment.topCenter,
//               child: FittedBox(
//                 child: Text(
//                   Strings.welcomeScreenSubTitle,
//                   style: Theme.of(context).textTheme.subtitle,
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class ButtonWidget extends StatelessWidget {
//   const ButtonWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => HomeScreen()));
//       },
//       child: Container(
//         constraints: BoxConstraints(
//             minHeight: 6.5 * SizeConfigue.heightMultiplier,
//             maxHeight: 7.9 * SizeConfigue.heightMultiplier),
//         height: 7 * SizeConfigue.heightMultiplier,
//         decoration: BoxDecoration(
//             color: AppTheme.topBarBackgroundColor,
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(2 * SizeConfigue.heightMultiplier),
//                 topRight: Radius.circular(2 * SizeConfigue.heightMultiplier))),
//         child: Row(
//           children: [
//             Expanded(
//               child: Text(
//                 Strings.getStartedButton,
//                 style: Theme.of(context).textTheme.button,
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
