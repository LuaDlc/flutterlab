// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DynamicRichText extends StatelessWidget {
  final String username;
  final double amount;

  const DynamicRichText({
    super.key,
    required this.username,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = amount >= 0;

    return Semantics(
      label: 'Economia de R\$ ${amount.toStringAsFixed(2)}',
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyLarge,
          children: [
            TextSpan(text: 'Olá, $username! '),
            const TextSpan(text: 'voce economizou '),
            TextSpan(
              text: 'R\$ ${amount.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isPositive ? Colors.green : Colors.red,
              ),
            ),
            TextSpan(text: ' este mes'),
          ],
        ),
      ),
    );
  }
}
