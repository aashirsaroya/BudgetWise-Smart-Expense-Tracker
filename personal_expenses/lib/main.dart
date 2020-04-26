import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses ',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(title: TextStyle(
        fontFamily: 'Open Sans',
        fontSize: 18 ,
        fontWeight: FontWeight.bold,
      )) ,
        appBarTheme: AppBarTheme(textTheme: ThemeData.light().textTheme.copyWith(title: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        )))
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  //String titleInput;
  //String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [
    //Transaction(id: 't1',title: 'New Shoes',amount:3000.0,date: DateTime.now() ),
    //Transaction(id: 't2',title: 'Groceries',amount: 220.50,date: DateTime.now())
  ];
  List<Transaction> get _recentTransactions
  {
       return _userTransaction.where((tx){
         return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
  }).toList();
  }
  void _addNewTransaction(String txTitle,double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: chosenDate,
        id: DateTime.now().toString()
    );
    setState(() {
      _userTransaction.add(newTx);
    });
  }
  void _startNewTransaction(BuildContext ctx)
  {
    showModalBottomSheet(
        context: ctx,
        builder: (_){
         return GestureDetector(
           onTap: (){},
           child: NewTransaction(_addNewTransaction),
           behavior: HitTestBehavior.opaque,
         );
    } );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Personal Expenses ',
      ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add),
          onPressed: () => _startNewTransaction(context),
          )
        ],

      ),
      body:SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_userTransaction),
          ],
        ),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
          onPressed: () => _startNewTransaction(context),
    ),
    );
  }
}

