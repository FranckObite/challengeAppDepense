class Transaction {
  final String details;
  final String id;
  final double montant;
  final DateTime date;
  Transaction(
      {required this.id,
      required this.details,
      required this.montant,
      required this.date});
}
