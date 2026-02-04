import 'package:flutter/material.dart';
import 'package:flutterlab/l10n/app_localizations.dart';
import 'package:flutterlab/modules/numbers/currency_controller.dart';
import 'package:flutterlab/modules/numbers/currency_utils.dart';

final controller = CurrencyController();

class NumbersPage extends StatelessWidget {
  const NumbersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(l10n.currencyConverter, style: TextStyle(fontSize: 18)),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: AnimatedBuilder(
              animation: controller,
              builder: (_, _) {
                final locale = Localizations.localeOf(context).toString();

                final result = controller.convert();

                return Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: controller.setAmount,
                      decoration: const InputDecoration(labelText: 'valor'),
                    ),

                    Row(
                      children: [
                        DropdownButton<String>(
                          value: controller.from,
                          items: ['BRL', 'USD', 'EUR']
                              .map(
                                (e) =>
                                    DropdownMenuItem(value: e, child: Text(e)),
                              )
                              .toList(),
                          onChanged: controller.setFrom,
                        ),
                        const SizedBox(width: 12),
                        DropdownButton<String>(
                          value: controller.to,
                          items: ['BRL', 'USD', 'EUR']
                              .map(
                                (e) =>
                                    DropdownMenuItem(value: e, child: Text(e)),
                              )
                              .toList(),
                          onChanged: controller.setTo,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      formatCurrency(
                        result,
                        locale: locale,
                        symbol: controller.to,
                      ),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
