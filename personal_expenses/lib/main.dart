import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './widgets/user_transaction.dart';

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
  //String titleInput;
  //String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Personal Expenses App'
      ),centerTitle: true,
      ),
      body:Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            color: Colors.blue,
            child: Container(width: double.infinity,child: Text('Chart!!')),
            elevation: 5,
          ),
          UserTransactions(),
        ],
      )
    );
  }
}

