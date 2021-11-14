import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(Sargam());
 class Sargam extends StatelessWidget {

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: Sargam(),
     );
   }
 }

 class Sargam extends StatefulWidget {
   @override
   _SargamState createState() => _SargamState();
 }

 class _SargamState extends State<Sargam> {
   // at beginning we r not playing
   bool playing = false;
   // main state of play btn
   IconData playBtn = Icon(
     Icons.play_arrow;
   ) as IconData;
   //Audioplayer objects
   late AudioPlayer _player;
   late AudioPlayer cache;
   Duration position = new Duration();
   Duration musicLength = new Duration();
   //creating a custom slider
   Widget Slider() {
     return Container(
       width: 300,
       child: Slider.adaptive(
         activeColor: Colors.deepPurple,
         inactiveColor: Colors.blueGrey,
         value: position.inSeconds.toDouble(),
         max: musicLength.inSeconds.toDouble(),
         onChanged: (value) {
           setState(() {
             value = value.toInt();
           });
         }
       )
     );
   }
   //initialising audioiplayer
   @override
   void initState() {
     super.initState();
     _player = AudioPlayer();
     cache = AudioCache(fixedPlayer: _player) as AudioPlayer;
     //function to get audioplayer time
     // this allows us to get duration of song
//     _player.durationHandler = (d) {
//       setState(() {
//         musicLength = d;
//       });
//     };
   }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text(
           'SARGAM Music'
         ),
         centerTitle: true,
         backgroundColor: Colors.black,
       ),
     );
   }
 }


