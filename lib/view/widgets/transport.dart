import 'package:app/models/class_transaction.dart';
import 'package:flutter/material.dart';

import '../../controllers/container_card.dart';

class CategorieTransport extends StatefulWidget {
  const CategorieTransport({
    super.key,
  });

  @override
  State<CategorieTransport> createState() => _CategorieTransportState();
}

class _CategorieTransportState extends State<CategorieTransport> {
  final detailController = TextEditingController();
  final montantController = TextEditingController();
  DateTime? date;

  final List<Transaction> transaction = [
    /* Transaction(
        details: "shopping",
        montant: 222,
        date: DateFormat.yM().format(DateTime.now()),
        id: 't1'),
    Transaction(details: "food", montant: 232, date: DateTime.now(), id: 't2'), */
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

  void delete(index) {
    setState(() {
      transaction.removeWhere(
          (element) => element.details == transaction[index].details);
    });
  }

  void ajoutons({required String leTitre, required String leMontant}) {
    final newTransaction = Transaction(
        details: leTitre,
        montant: double.parse(leMontant),
        date: DateTime.now(),
        id: DateTime.now().toString());
    /* DateFormat.yMd().format */
    setState(() {
      transaction.add(newTransaction);
      Navigator.of(context).pop();
    });
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                        labelText: '  Detail Transaction'),
                    controller: detailController,
                    onSubmitted: (_) => ajoutons(
                        leMontant: montantController.text,
                        leTitre: detailController.text),
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        labelText: '  preciser le montant'),
                    controller: montantController,
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) => ajoutons(
                        leMontant: montantController.text,
                        leTitre: detailController.text),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple),
                      onPressed: () => ajoutons(
                          leMontant: montantController.text,
                          leTitre: detailController.text),
                      child: const Text(
                        "Ajouter une transaction",
                      )),
                ],
              ),
            ),
          );
        });
  }

  void suprimer(String id) {
    setState(() {
      transaction.removeWhere((Element) => Element.id == id);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    detailController.dispose();
    montantController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/ccp.png",
                    ),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.purple[500],
                  child: IconButton(
                    icon: const Icon(
                      Icons.add,
                    ),
                    onPressed: () => ajouDeTransaction(context),
                  ),
                ),
              ],
            ),
          )
        ]),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            "Historiques des depenses",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.orange),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ContainerCard(
          transaction: transaction,
          deleteTr: suprimer,
        )
      ]),
    );
  }
}



/// Flutter code sample for [showDialog].


/* ListView.builder(
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
                              element.details == transaction[index].details);
                        });
                      },
                      icon: const Icon(Icons.edit)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          transaction.removeWhere((element) =>
                              element.details == transaction[index].details);
                        });
                      },
                      icon: const Icon(Icons.delete)),
                ],
              ),
            ),
          );
        },
        itemCount: transaction.length) 

  
 */
