import 'package:flutter/material.dart';
import 'package:newprovider/model/mymodel.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Counter(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: ""),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({this.title});

  void _incrementCounter(BuildContext context) {
    Provider.of<Counter>(context, listen: false).incrementCounter();
  }
  void _decrementcounter(BuildContext context){
    Provider.of<Counter>(context, listen: false). decrementConter();
  }

  @override
  Widget build(BuildContext context) {
    var counter = Provider
        .of<Counter>(context)
        .getCounter;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$counter',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold
              )
            ),
            RaisedButton(onPressed: (){_incrementCounter(context);},child: Text('Add',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.white
            ),
            ),
              color: Colors.orange,
            ),
            RaisedButton(onPressed: (){ _decrementcounter(context);},child: Text('Substract',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.white
            ),

            ),
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}