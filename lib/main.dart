import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: MainPage(),)
  );
}

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Column(
        children: [

          Container(
            color: Colors.blueAccent,
            height: MediaQuery.of(context).size.height/2,
            width: double.infinity,
            child: Center(
            child: MaterialButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>GamePage()));
            },
            color: Colors.white,
            shape: CircleBorder(),
            height: 150,
            minWidth: 150,
            child: Text("START"),
            ),
            ),
          
          ),

          Container(
            color: Colors.redAccent,
            height: MediaQuery.of(context).size.height/2,
            width: double.infinity,
            child: Center(
            child: MaterialButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>GamePage()));
            },
            color: Colors.white,
            shape: CircleBorder(),
            height: 150,
            minWidth: 150,
            child: Text("START"),
            ),
            ),)

        ],),
   );
  }
}


class GamePage extends StatefulWidget{
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
double blueCardHeight = 0;
double redCardHeight = 0;
bool initialized = false;
int playerA=0;
int playerB=0;


  @override
  Widget build(BuildContext context) {

   if(initialized==false){
   blueCardHeight = MediaQuery.of(context).size.height/2;
   redCardHeight = MediaQuery.of(context).size.height/2;
   initialized = true;
   }

    return Scaffold(
      body: Column(
      children: [
        MaterialButton (
          onPressed: () {
            
            setState(() {
              blueCardHeight = blueCardHeight+30;
              redCardHeight = redCardHeight - 30;
              playerB = playerB+5;
            });
            double maxHeight = MediaQuery.of(context).size.height-60;
           

            if(blueCardHeight>maxHeight){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>resultPage(playerB , "b")));
            }
          },
          padding: EdgeInsets.zero,
          child: Container(
            color: Colors.blueAccent,
            height: blueCardHeight,
            width: double.infinity,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10),
            child: Row(
            children: [
              Expanded(
                child: 
                Text("Player B",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
              Text((playerB).toString())
            ],),
          ),
        ),
        MaterialButton
        (onPressed: (){
          setState(() {
             blueCardHeight = blueCardHeight-30;
              redCardHeight = redCardHeight + 30;
              playerA = playerA+5;
          });
          
            double maxHeight = MediaQuery.of(context).size.height-60;
            if(redCardHeight>maxHeight){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>resultPage(playerA,"a")));
            }
        },
        padding: EdgeInsets.zero,
          child: Container(
            color: Colors.redAccent,
            height: redCardHeight,
            width: double.infinity,
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.all(10),
             child: Row(
            children: [
              Expanded(
                child: 
                Text("Player A",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
              Text((playerA).toString())
            ],),
          ),
        )
      ],),
    );
  }
}

class resultPage extends StatelessWidget{
int score = 0;
String player = "";
resultPage(this.score,this.player);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: player =="a"?Colors.redAccent:Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(score.toString(),style: TextStyle(fontSize: 65,fontWeight: FontWeight.bold),),
          Text(player=="a"?"Player A won":"Player B won",style: TextStyle(fontSize: 40),),
          MaterialButton(onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          color: Colors.white,
          child: Text("Restart")
          ),
        
        ],),
      ),
    );
  }
}