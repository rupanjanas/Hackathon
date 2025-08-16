import 'package:flutter/material.dart';
import '../data/mock_transactions.dart';
import '../widgets/transaction_list.dart';
import '../models/transaction.dart';

class TransactionsScreen extends StatefulWidget {
  @override
  _TransactionsScreenState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  String searchQuery = "";
  String selectedCategory = "All";
  DateTime? startDate;
  DateTime? endDate;

  Future<void> _pickDateRange() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        startDate = picked.start;
        endDate = picked.end;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<TransactionModel> filteredTransactions = mockTransactions.where((tx) {
      final matchesSearch = tx.category
              .toLowerCase()
              .contains(searchQuery.toLowerCase()) ||
          tx.amount.toString().contains(searchQuery);
      final matchesCategory =
          selectedCategory == "All" || tx.category == selectedCategory;

      final txDate = DateTime.parse(tx.date);
      final matchesDate = (startDate == null || txDate.isAfter(startDate!.subtract(Duration(days: 1)))) &&
          (endDate == null || txDate.isBefore(endDate!.add(Duration(days: 1))));

      return matchesSearch && matchesCategory && matchesDate;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text("Transactions")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Search",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() => searchQuery = value),
            ),
          ),
          DropdownButton<String>(
            value: selectedCategory,
            items: ["All", "Travel", "Food", "Supplies", "Marketing"]
                .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                .toList(),
            onChanged: (value) =>
                setState(() => selectedCategory = value ?? "All"),
          ),
          ElevatedButton.icon(
            onPressed: _pickDateRange,
            icon: Icon(Icons.date_range),
            label: Text(startDate == null
                ? "Select Date Range"
                : "${startDate!.toLocal()} → ${endDate!.toLocal()}"),
          ),
          Expanded(
            child: TransactionList(transactions: filteredTransactions),
          ),
        ],
      ),
    );
  }
}
