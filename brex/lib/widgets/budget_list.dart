import 'package:flutter/material.dart';
import '../models/budget.dart';

class BudgetList extends StatelessWidget {
  final List<BudgetModel> budgets;

  BudgetList({required this.budgets});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: budgets.length,
      itemBuilder: (context, index) {
        final b = budgets[index];
        return Card(
          child: ListTile(
            title: Text("${b.name} - \$${b.amount}"),
            subtitle: Text(b.category),
          ),
        );
      },
    );
  }
}
