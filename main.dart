

import 'package:bimwprovider/model/model.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CalculateBmi())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {

 var hcon= TextEditingController();
 var wcon=TextEditingController();

 void Bmi(BuildContext context)
 {
   var height1=double.parse(hcon.text);
   var weight1=double.parse(wcon.text);
   Provider.of<CalculateBmi>(context, listen: false). cal(height1,weight1);
 }

  @override
  Widget build(BuildContext context) {


    var result = Provider
        .of<CalculateBmi>(context).getres;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator',style: TextStyle(
          color: Colors.black
        ),),
        backgroundColor: Colors.greenAccent,
      ),
      body:Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            Padding(padding: const EdgeInsets.all(10),
              child:TextField(
                controller: hcon,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter height',
                  icon: Icon(Icons.height_rounded),
                ),
              ),

            ),

            Padding(padding:const EdgeInsets.all(10),
            child:TextField(
              controller: wcon,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter weight',
                icon: Icon(Icons.line_weight_rounded),
              ),
            ),

            ),
           Padding(padding: const EdgeInsets.all(10),
           child:  RaisedButton(onPressed: (){ Bmi(context); },color: Colors.greenAccent,
             child: Text('click'),),),
            Text(
                ' Result : $result',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                )
            ),

          ],
        ),
      ) ,


    );
  }
}