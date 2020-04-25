import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
class TransactionList extends StatelessWidget {
final List<Transaction> transactions;
TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 300 ,
      child: SingleChildScrollView(
        child: Column(
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
      ),
    );
  }
}
