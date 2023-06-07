import 'package:app/models/class_transaction.dart';
import 'package:flutter/material.dart';

class CategorieTransport extends StatefulWidget {
  const CategorieTransport({
    super.key,
  });

  @override
  State<CategorieTransport> createState() => _CategorieTransportState();

  void addTx(String detailsEntrer, double montantEntrer) {}
}

class _CategorieTransportState extends State<CategorieTransport> {
  final detailController = TextEditingController();
  final montantController = TextEditingController();
  DateTime? date;

  final List<Transaction> transaction = [
    Transaction(details: "shopping", montant: 222, date: DateTime.now()),
    Transaction(details: "food", montant: 232, date: DateTime.now()),
  ];

  void ajouDeTransaction(
    BuildContext ctx,
  ) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: Column(
              children: [
                TextField(
                  decoration:
                      const InputDecoration(labelText: 'Detail Transaction'),
                  controller: detailController,
                  onSubmitted: (_) {},
                ),
                TextField(
                  decoration:
                      const InputDecoration(labelText: 'preciser le montant'),
                  controller: montantController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => (),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              decoration:
                  const InputDecoration(labelText: 'Detail Transaction'),
              controller: detailController,
              onSubmitted: (_) {},
            ),
            TextField(
              decoration:
                  const InputDecoration(labelText: 'preciser le montant'),
              controller: montantController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => (),
            ),
            TextButton(
                onPressed: () {
                  final newTransaction = Transaction(
                      details: detailController.text,
                      montant: double.parse(montantController.text),
                      date: DateTime.now());
                  setState(() {
                    transaction.add(newTransaction);
                  });
                },
                child: const Text("Ajouter une transaction")),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              child: ListView.separated(
                  itemBuilder: (context, int index) {
                    return Card(
                      elevation: 5,
                      child: ListTile(
                        title: Text(transaction[index].details),
                        leading: CircleAvatar(
                          child: Text('${transaction[index].montant}'),
                        ),
                        subtitle: Text('${transaction[index].date}'),
                      ),
                    );
                  },
                  separatorBuilder: ((context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  }),
                  itemCount: transaction.length),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ajouDeTransaction(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

/// Flutter code sample for [showDialog].




  

