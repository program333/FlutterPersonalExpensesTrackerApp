import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenser_app/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final deleteTx;

  TransactionList(this.transactions,this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 20, //distance between title and image
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ), //for this change in pubspec.yaml
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin:  const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                    ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text('\$${transactions[index].amount}')),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    subtitle:
                        Text(DateFormat.yMMMd().format(transactions[index].date)
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                         onPressed: () => deleteTx(transactions[index].id),
                        ),
                  ),

                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
