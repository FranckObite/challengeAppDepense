// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../models/class_transaction.dart';
import 'package:intl/intl.dart';

class ContainerCard extends StatefulWidget {
  const ContainerCard({
    Key? key,
    required this.transaction,
    required this.deleteTr,
  }) : super(key: key);

  final List<Transaction> transaction;
  final Function deleteTr;

  @override
  State<ContainerCard> createState() => _ContainerCardState();
}

class _ContainerCardState extends State<ContainerCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: widget.transaction.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 6,
            color: Colors.purple[100],
            child: ListTile(
              title: Text(
                widget.transaction[index].details,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                DateFormat.yMMMMd().format(widget.transaction[index].date),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.black,
                child: Text(
                  '\$${widget.transaction[index].montant.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 13),
                ),
              ),
              trailing: IconButton(
                  onPressed: () =>
                      widget.deleteTr(widget.transaction[index].id),
                  icon: const Icon(Icons.delete, color: Colors.red)),
            ),
          );
        },
      ),
    );
  }
}
