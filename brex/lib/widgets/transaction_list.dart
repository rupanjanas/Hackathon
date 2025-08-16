import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<TransactionModel> transactions;

  TransactionList({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final tx = transactions[index];
        return Card(
          child: ListTile(
            title: Text("${tx.category} - \$${tx.amount}"),
            subtitle: Text(tx.date),
          ),
        );
      },
    );
  }
}
