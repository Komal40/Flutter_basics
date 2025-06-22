import 'package:first_app/expensetracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;



  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountCOntroller = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectedCategory=Category.leisure;

  void _datePicker() async {
    final now = DateTime.now();
    final firstdate = DateTime(now.year - 1, now.month, now.day);
    var selectedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstdate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = selectedDate;
    });
  }



  void _submitExpenseData(){
    final enterAmount=int.tryParse(_amountCOntroller.text);
    final isInvalidAmount=enterAmount==null || enterAmount<=0;
    if(_titleController.text.trim().isEmpty ||isInvalidAmount || _selectedDate==null){
      showDialog(context: context, builder: (ctx)=> AlertDialog(
        title: Text("Invalid input"),
        content: Text("Please enter correct values.."),
        actions: [TextButton(onPressed: (){Navigator.pop(ctx);}, child: Text("Okay"))],
      ),);
      return;
    }
    widget.onAddExpense(Expense(title: _titleController.text, amount: enterAmount, date: _selectedDate!, category: _selectedCategory!));

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountCOntroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16,48,16,16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountCOntroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: '\$ ',
                    label: Text("Amount"),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? ("Select Date")
                          : formatter.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: _datePicker,
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16,),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (item) =>
                        DropdownMenuItem(value: item, child: Text(item.name.toUpperCase())),
                    )
                    .toList(),
                onChanged: (val) {
                  if(val==null){
                    return;
                  }
                  setState(() {
                  _selectedCategory=val;
                  });
                },
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                 _submitExpenseData();
                },
                child: Text("Save Expense"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
