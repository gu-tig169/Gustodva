
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
 @override
  Widget build(BuildContext context) {
   return MaterialApp(
   home: MainView()
   );
  }
}
class MainView extends StatelessWidget {
  @override 

  Widget build(BuildContext context){
    return Scaffold (
    
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("TIG169 TODO", style: 
        TextStyle(color: Colors.black,fontSize: 26)),
        actions: [
          IconButton(icon: Icon(Icons.more_vert, color: Colors.black)
          , onPressed: () { 
            Navigator.push (
              context,
              MaterialPageRoute(builder: (context) => SecondView()));

        
          }
          )
        ]
      ),
     
      body: 
          _list(),
          floatingActionButton: FloatingActionButton(
        onPressed: (){},
      child: Icon(Icons.add, color: Colors.white, size: 56,), backgroundColor: Colors.grey,
    ),
   );
    
  }


  Widget _list(){
    var names = [
      "Plugga",
      "Handla",
      "Laga mat",
      "Städa",
      "Köpa blommor",
      "Äta middag",

    ];
    var list = List.generate(1000, (index) => "${names [index%6]}");

    return ListView.builder(itemBuilder: (context, index) => _item(list[index]),
    itemCount: 6,
    );

  }

  Widget _item(text) {
  return CheckboxListTile(
    title: Text (text, style: TextStyle (fontSize: 26)),
   secondary: Icon(Icons.cancel),
    onChanged: (val) {  }, value: false, 
    controlAffinity: ListTileControlAffinity.leading,
  );
  }
 

}
class SecondView extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
       appBar:AppBar(backgroundColor: Colors.grey, title: Text
       ("TIG169 TODO",
        style: TextStyle(color: Colors.black, fontSize: 26))),
         body: Center (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

       // _nameLabel(),   
       Container (height: 24),      
        _nameinputField(),
         Container (height: 24),
        //  _checkBoxRow(),
         _iconRow(),
        //  Container(height: 32),
         //_buttonAdd(),
          ]
         ),
          
         ),
          
    );
          
}


Widget _nameLabel() {
  return  Container (
    margin: EdgeInsets.only(left: 20, top: 24),
       child: Text("Name"),
      ); 
} 


  }
  Widget _nameinputField() {

    return Container (
           margin: EdgeInsets.only(left: 16, right: 16 ,top: 40),
           child:TextField(decoration: InputDecoration(hintText: "What are you going to do?"), 
            ),
    );
  }

 Widget _iconRow() {
   return Row (
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
       Container( 
       //  margin: EdgeInsets.only(left: 16, right: 20),
         child: Icon(Icons.add),
       ),
Column (
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Text("add", style: TextStyle(fontSize: 16),),
  ],
)
     ]
   );
     
 }
Widget _checkBoxRow() {
  return Row(
    children: [
      Checkbox(value: false, onChanged: (val) {},
      
      ),
      Text(
        "Plugga", style: TextStyle(color: Colors.black,fontSize: 24)),
    ],
  );
}
