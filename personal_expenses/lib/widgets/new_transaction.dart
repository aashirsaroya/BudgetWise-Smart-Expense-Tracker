import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class NewTransaction extends StatefulWidget {
  final Function addtx;
  NewTransaction(this.addtx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  DateTime _selectedDate;


  void submitData()
  {
    if(amountController.text.isEmpty)
      return;
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if(enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null)
      return null;
    widget.addtx(
      enteredTitle,
      enteredAmount,
      _selectedDate
    );
    Navigator.of(context).pop();
  }
  void _presentDatePicker()
  {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime.now(),
    ).then((pickedDate){
      if(pickedDate == null)
        {
          return;
        }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              controller: amountController,
              // onChanged: (amt){
              // amountInput = amt;
              //},
              decoration: InputDecoration(labelText:'Amount'),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(_selectedDate == null ? 'No Date Chosen!':
                    'Picked Date: ${DateFormat.yMMMd().format(_selectedDate)}'),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text('Choose Date',
                    style:TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _presentDatePicker ,
                  )
                ],
              ),
            ),
            RaisedButton(
              child: Text('Add Transaction'),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
