import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutterlab/core/services/analytics_service.dart';
import 'package:flutterlab/core/services/remote_confi_service.dart';
import 'package:flutterlab/l10n/app_localizations.dart';
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
  late final AnalyticsService analytics;
  late RemoteConfigService remoteConfig;
  bool _isReady = false;

  @override
  void initState() {
    super.initState();

    _init();
  }

  Future<void> _init() async {
    analytics = AnalyticsService();
    remoteConfig = RemoteConfigService();

    final userType = 'advanced';

    await analytics.setUserType(userType);

    await FirebaseAnalytics.instance.logEvent(name: 'home_opened');

    await remoteConfig.init();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 100) {
        controller.loadMore();
      }
    });

    setState(() {
      _isReady = true;
    });
    print("varianT ATUAL: ${remoteConfig.featureVariant}");
  }

  @override
  Widget build(BuildContext context) {
    if (!_isReady) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.registerTitle)),
      drawer: const AppDrawer(),
      body: AnimatedBuilder(
        animation: controller,
        builder: (_, _) {
          return Column(
            children: [
              _summaryCard(),
              _search(),
              _actions(),
              _categoryFilter(),
              Expanded(child: _list()),
            ],
          );
        },
      ),
    );
  }

  Widget _summaryCard() {
    final l10n = AppLocalizations.of(context)!;
    return Card(
      margin: const EdgeInsets.all(12),
      child: Text(
        ' ${l10n.totalOfItens} : ${controller.totalItems}\n, valor total: R\$ ${controller.totalValue.toStringAsFixed(2)}',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _search() {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        decoration: InputDecoration(
          labelText: l10n.search,
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: controller.search,
      ),
    );
  }

  Widget _actions() {
    final l10n = AppLocalizations.of(context)!;
    return Wrap(
      spacing: 8,
      children: [
        ElevatedButton(
          onPressed: controller.toggleGroupByCategory,
          child: Text(
            controller.isGrouped ? l10n.simpleList : l10n.groupByCategory,
          ),
        ),
        ElevatedButton(
          onPressed: () => controller.sort(.highestPrice),
          child: Text(l10n.highestPrice),
        ),
        ElevatedButton(
          onPressed: () => controller.sort(.az),
          child: Text(l10n.az),
        ),
        ElevatedButton(
          onPressed: () => controller.removeDuplicates,
          child: Text(l10n.removeDuplicates),
        ),
        ElevatedButton(
          onPressed: () => controller.sort(.newest),
          child: Text(l10n.mostRecent),
        ),

        ElevatedButton(onPressed: controller.reset, child: Text(l10n.reset)),
        _remoteFeatureSection(),
      ],
    );
  }

  Widget _remoteFeatureSection() {
    if (!remoteConfig.isAdvancedFeatureEnabled) {
      return const SizedBox();
    }

    return _buildFeatureButton();
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
      itemCount: controller.allProducts.length,
      itemBuilder: (_, index) {
        final product = controller.allProducts[index];

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

  Widget _categoryFilter() {
    final categories = controller.categories;
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          labelText: 'Categoria',
          border: OutlineInputBorder(),
        ),
        initialValue: controller.selectedCategory,
        items: [
          DropdownMenuItem<String>(value: null, child: Text(l10n.all)),
          ...categories.map(
            (category) =>
                DropdownMenuItem(value: category, child: Text(category)),
          ),
        ],
        onChanged: controller.filterByCategory,
      ),
    );
  }

  Widget _buildFeatureButton() {
    switch (remoteConfig.featureVariant) {
      case 'variant_a':
        return ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          onPressed: () {
            analytics.logEvent(
              'feature_click',
              params: {'variant': 'variant_a'},
            );
          },
          child: const Text('Feature Clássica'),
        );

      case 'variant_b':
        return ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () {
            analytics.logEvent(
              'feature_click',
              params: {'variant': 'variant_b'},
            );
          },
          child: const Text('Nova Experiência'),
        );

      default:
        return const SizedBox();
    }
  }
}
