
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_controller/screens/weather/weatherinfo.dart';

import 'brokers_module/edit_broker_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> roomNames = ["Living Room", "Bedroom", "Study Room", "Kitchen"];
  final List<String> Device = ["06 Device", "05 Device", "07 Device", "08 Device"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height/10,
                        width: MediaQuery.of(context).size.width/8,
                        child: Image.asset("assets/icon/menu.png",color: Colors.white,)),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(35),

                      child: CircleAvatar(
                        maxRadius: 30,
                        minRadius: 20,

                        backgroundColor: Colors.black38,
                          child: Image.asset("assets/images/profile.png",fit: BoxFit.fill,)),
                    ),

                ],),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(  'Hello Maria 👋',style: TextStyle(color: Colors.white,fontSize: 30),),
                    SizedBox(height: 10,),
                    Text("Welcome To Home",style: TextStyle(color: Colors.white,fontSize: 20),)
                  ],
                ),
                SizedBox(height: 10),

                Hero(
                    tag: 'TAG',
                    child: Material(
                        color: Colors.transparent,
                        child: InfoCard())),
               // SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Your Rooms",style: TextStyle(color: Colors.white,fontSize: 25),),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Add"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // Set the desired border radius here
                        ),
                      ),
                    ),
                  )

                ],),



                Expanded(
                  child: Stack(
                    children: [
                      GridView.builder(
                        padding: const EdgeInsets.all(10.0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: roomNames.length, // Replace with your dynamic room count
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 30, // Adjust the size as needed
                                    backgroundImage: AssetImage('assets/images/room.png'), // Replace with your image path
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    roomNames[index],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    Device[index],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => EditBroker()));
                        },
                        child: Positioned(
                          bottom: 0,
                          right: 150,
                          child: CircleAvatar(
                            minRadius: 20,
                            maxRadius: 30,
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ]),
        ),
      ),
    );
  }
}



