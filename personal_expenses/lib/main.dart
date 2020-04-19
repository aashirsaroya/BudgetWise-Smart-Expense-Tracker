import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses App',
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  final List<Transaction>transactions = [
    Transaction(id: 't1',title: 'New Shoes',amount:3000.0,date: DateTime.now() )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Personal Expenses App'
      ),centerTitle: true,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            color: Colors.blue,
            child: Container(width: double.infinity,child: Text('Chart!!')),
            elevation: 5,
          ),
          Card(
            color: Colors.red,
            child: Container(width: double.infinity,child: Text('List of TX')),
          ),
        ],
      )
    );
  }
}

