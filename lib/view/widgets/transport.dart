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

  void datePickerr() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        date = pickedDate;
      });
    });
    print('...');
  }

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
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      final newTransaction = Transaction(
                          details: detailController.text,
                          montant: double.parse(montantController.text),
                          date: DateTime.now());
                      setState(() {
                        transaction.add(newTransaction);
                        Navigator.of(context).pop();
                      });
                    },
                    child: const Text("Ajouter une transaction")),
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
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
              child: Row(
                children: [Text("Historique Depenses")],
              ),
            ),
            SizedBox(
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
                        trailing: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    transaction.removeWhere((element) =>
                                        element.details ==
                                        transaction[index].details);
                                  });
                                },
                                icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    transaction.removeWhere((element) =>
                                        element.details ==
                                        transaction[index].details);
                                  });
                                },
                                icon: const Icon(Icons.delete)),
                          ],
                        ),
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




  

