import 'package:flutter/material.dart';
import 'package:flutterlab/models/product.dart';
import 'package:flutterlab/modules/dashboard/dashboard_controller.dart';
import 'package:flutterlab/modules/dashboard/mock_products.dart';
import '../../core/widgets/app_drawer.dart';

enum SortType { az, highestPrice, newest }

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DashboardController controller = DashboardController();
  final ScrollController scrollController = ScrollController();
  List<Product> products = List.from(mockProducts);
  SortType currentSort = SortType.az;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 100) {
        controller.loadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard - Lógica Dart')),
      drawer: const AppDrawer(),
      body: AnimatedBuilder(
        animation: controller,
        builder: (_, _) {
          return Column(
            children: [
              _summaryCard(),
              _search(),
              _actions(),
              Expanded(child: _list()),
            ],
          );
        },
      ),
    );
  }

  Widget _summaryCard() {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Text(
        'Total de  itens: ${controller.totalItems}\n, valor total: R\$ ${controller.totalValue.toStringAsFixed(2)}',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _search() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Buscar produto',
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: controller.search,
      ),
    );
  }

  Widget _actions() {
    return Wrap(
      spacing: 8,
      children: [
        ElevatedButton(
          onPressed: () => controller.toggleGroupByCategory,
          child: Text(
            controller.isGrouped ? 'Lista simples' : 'Agrupar por categoria',
          ),
        ),
        ElevatedButton(
          onPressed: () => controller.sort(.highestPrice),
          child: const Text('Maior preço'),
        ),
        ElevatedButton(
          onPressed: () => controller.sort(.az),
          child: const Text('A-Z'),
        ),
        ElevatedButton(
          onPressed: () => controller.removeDuplicates,
          child: const Text('Remover duplicatas'),
        ),
        ElevatedButton(
          onPressed: () => controller.sort(.newest),
          child: const Text('Mais recente'),
        ),

        ElevatedButton(onPressed: controller.reset, child: const Text('Reset')),
      ],
    );
  }

  Widget _list() {
    if (controller.isGrouped) {
      final grouped = controller.groupByCategory();

      return ListView(
        controller: scrollController,
        children: grouped.entries.map((entry) {
          final category = entry.key;
          final products = entry.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  category,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ...products.map(
                (product) => ListTile(
                  title: Text(product.name),
                  subtitle: Text('R\$ ${product.price}'),
                  trailing: product.active
                      ? const Icon(Icons.check, color: Colors.green)
                      : const Icon(Icons.close, color: Colors.red),
                ),
              ),
            ],
          );
        }).toList(),
      );
    }

    return ListView.builder(
      controller: scrollController,
      itemCount: controller.products.length,
      itemBuilder: (_, index) {
        final product = controller.products[index];

        return ListTile(
          title: Text(product.name),
          subtitle: Text('${product.category} • R\$ ${product.price}'),
          trailing: product.active
              ? const Icon(Icons.check, color: Colors.green)
              : const Icon(Icons.close, color: Colors.red),
        );
      },
    );
  }
}
