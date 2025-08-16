class BudgetModel {
  final String name;
  final double amount;
  final String category;
  final DateTime? startDate;
  final DateTime? endDate;

  BudgetModel({
    required this.name,
    required this.amount,
    required this.category,
    this.startDate,
    this.endDate,
  });
}
