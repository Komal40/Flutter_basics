import 'package:first_app/expensetracker/models/expense.dart';
import 'package:first_app/expensetracker/widgets/expense_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        onDismissed: (direction){
          onRemoveExpense(expenses[index]);
        },
        key: ValueKey(expenses[index]), child: ExpenseItem(expenses[index])),
    );
  }
}
