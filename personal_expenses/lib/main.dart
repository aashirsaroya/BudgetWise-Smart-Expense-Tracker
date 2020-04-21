import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

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
    Transaction(id: 't1',title: 'New Shoes',amount:3000.0,date: DateTime.now() ),
    Transaction(id: 't2',title: 'Groceries',amount: 220.50,date: DateTime.now())
  ];
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
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    controller: titleController,
                    //onChanged: (value){
                     // titleInput = value;
                   // },
                    decoration: InputDecoration(labelText:'Title'),
                  ),
                  TextField(
                    controller: amountController,
                   // onChanged: (amt){
                     // amountInput = amt;
                    //},
                    decoration: InputDecoration(labelText:'Amount'),
                  ),
                  FlatButton(
                    child: Text('Add Transaction'),
                    textColor: Colors.purple,
                    onPressed: (){} ,
                  )
                ],
              ),
            ),
          ),
          Column(
            children: transactions.map((tx){
              return Card(
                child: Row(
              children: <Widget>[
                Container(
                  margin:EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                      color: Colors.purple,
                      width: 2,
                  )
                  ),
                  child: Text(
                    "\u20B9" + tx.amount.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18 ,
                      color: Colors.purple ,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(tx.title,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                      ) ,
                    ),
                    Text(
                      DateFormat.yMMMd().format(tx.date),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )

                  ],
                ),
              ],
              ),
              );
            }).toList(),
          ),
        ],
      )
    );
  }
}

