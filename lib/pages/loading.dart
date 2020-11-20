import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  

  void setupWorldTime() async {
     WorldTime instance = WorldTime(location: 'Kuala_Lumpur', flag: 'malaysia.png', url: 'Asia/Kuala_Lumpur');
     await instance.getTime();
     Navigator.pushReplacementNamed(context, '/home', arguments: {
       'location': instance.location,
       'flag': instance.flag,
       'isDaytime': instance.isDaytime,
       'time': instance.time,
     });     
}
  @override
  void initState(){
      super.initState();
      setupWorldTime();
  } 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: Center(
        child: SpinKitFoldingCube(
               color: Colors.white,
               size: 80.0,
        ),
      ),
    );
  }
}