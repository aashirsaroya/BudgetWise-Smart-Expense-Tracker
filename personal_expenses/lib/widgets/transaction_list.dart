import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
class TransactionList extends StatelessWidget {
final List<Transaction> transactions;
TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty ? Column(
      children: <Widget>[
        Text('No transactions added yet!',style:  Theme.of(context).textTheme.title,),
        SizedBox(
          height: 50,
        ),
        Container(
          height: 300,
            child: Image.asset('assets/images/waiting.png',
            fit: BoxFit.cover,
            )
        ),
      ],
    ) : Column(
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
                      color: Theme.of(context).primaryColorDark,
                      //color: Colors.red,
                      width: 2,
                    )
                ),
                child: Text(
                  "\u20B9" + tx.amount.toStringAsFixed(0),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18 ,
                    color: Theme.of(context).primaryColorDark,
                    //color: Colors.red ,
                  ),
                ),
                padding: EdgeInsets.all(10),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(tx.title,
                    style: Theme.of(context).textTheme.copyWith().title,
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
    );
  }
}
