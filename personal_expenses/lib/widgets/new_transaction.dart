import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addtx;
  NewTransaction(this.addtx);
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
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
              onPressed: (){
                addtx(titleController.text,double.parse(amountController.text));
              } ,
            )
          ],
        ),
      ),
    );
  }
}
