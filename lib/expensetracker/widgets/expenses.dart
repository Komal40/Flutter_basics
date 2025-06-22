import 'package:first_app/expensetracker/widgets/expense_list/expense_list.dart';
import 'package:first_app/expensetracker/models/expense.dart';
import 'package:first_app/expensetracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {


  void _overlaymodal(){
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense,));
  }

  final List<Expense> _registeredExpenses=[
    Expense(title: 'title1', amount: 23, date: DateTime.now(), category: Category.food),
    Expense(title: 'title2', amount: 20, date: DateTime.now(), category: Category.work)
  ];



  void _addExpense(Expense expense){
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense){
    final index=_registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });
    //for performing undo operation
    ScaffoldMessenger.of(context).clearSnackBars();
   ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Expense Deleted"),
        duration: Duration(seconds: 3),
        action: SnackBarAction(label: "Undo",
        onPressed: (){
          setState(() {
            _registeredExpenses.insert(index, expense);
          });
        }),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
  Widget mainContent=Center(child: Text("No expense found"),);
    if(_registeredExpenses.isNotEmpty){
      mainContent= Expanded(child: ExpenseList(expenses: _registeredExpenses, onRemoveExpense: _removeExpense,));
  }
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
        IconButton(onPressed: _overlaymodal, icon: Icon(Icons.add)),
      ],),
      body: Column(
      children: [
      Text("chart"),
      mainContent,
      ]),
    );
  }
}
