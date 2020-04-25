import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addtx;
  NewTransaction(this.addtx);
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  void submitData()
  {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if(enteredTitle.isEmpty || enteredAmount <= 0)
      return null;
    addtx(
      enteredTitle,
      enteredAmount
    );
  }
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
              onSubmitted: (_) => submitData,
            ),
            TextField(
              controller: amountController,
              // onChanged: (amt){
              // amountInput = amt;
              //},
              decoration: InputDecoration(labelText:'Amount'),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: (){

              } ,
            )
          ],
        ),
      ),
    );
  }
}
