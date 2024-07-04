// import 'package:flutter/material.dart';
// import 'package:mqtt_controller/components/color_components.dart';
// import 'package:mqtt_controller/providers/auth_provider.dart';
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final authProvider = AuthProvider();
//      var myHeight = MediaQuery.of(context).size.height;
//      var myWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: AppColors.primaryColor,
//
//       // appBar: AppBar(
//       //   title: Text('Home'),
//       // ),
//
//       body: Column(
//
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//               Icon(Icons.menu, color: Colors.white,),
//               Icon(Icons.perm_identity_outlined, color: Colors.white,)
//             ],),
//           ),
//
//           Center(
//             child: Container(
//               height: myHeight*0.3,
//               width: myWidth-50,
//               child: Card(
//                 color: AppColors.secondaryColora,
//                 child: Text('Welcome to the Home Screen!',
//                  style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.only(bottom: 20.0),
//         child: FloatingActionButton(
//           onPressed: () {
//             authProvider.signOut();
//           },
//           child: Icon(Icons.add),
//           backgroundColor: Colors.blue,
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }
