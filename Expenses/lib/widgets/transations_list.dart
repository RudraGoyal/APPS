import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  const TransactionsList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar();
    final maxHeight = (MediaQuery.of(context).size.height -
        appbar.preferredSize.height -
        MediaQuery.of(context).padding.top);
    return transactions.isEmpty
        ? Container(
            height: (MediaQuery.of(context).size.height -
                    appbar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.65,
            child: Column(children: [
              Text(
                'no transactions added yet!!',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontFamily: 'Quicksand', fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height -
                        appbar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.02,
              ),
              Image.asset(
                'assets/images/waiting.png',
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? maxHeight * 0.13
                        : maxHeight * 0.40,
              ),
            ]),
          )
        : Container(
            height: (MediaQuery.of(context).size.height -
                    appbar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.60,
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: FittedBox(
                          child: Text(
                              '₹ ' +
                                  transactions[index].amount.toStringAsFixed(1),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: Colors.white)),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6!.copyWith(),
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].time)),
                    trailing: MediaQuery.of(context).size.width > 420
                        ? FlatButton.icon(
                            onPressed: () => deleteTx(transactions[index].id),
                            label: const Text(
                              'Delete',
                              style: TextStyle(fontFamily: 'OpenSans'),
                            ),
                            textColor: Colors.red,
                            icon: const Icon(Icons.delete),
                          )
                        : IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => deleteTx(transactions[index].id),
                            color: Colors.red,
                          ),
                  ),
                );
              },
            ),
          );
  }
}

/*
Card(
                  color: Theme.of(context).primaryColorLight,
                  margin: EdgeInsets.all(5),
                  elevation: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(
                          '₹ ' + transactions[index].amount.toStringAsFixed(1),
                          style: const TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                          width: 2,
                          color: Theme.of(context).primaryColor,
                          style: BorderStyle.solid,
                        )),
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactions[index].title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                              DateFormat.yMMMd()
                                  .format(transactions[index].time),
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ))
                    ],
                  ),
                );
                */