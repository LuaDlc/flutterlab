import 'package:flutter_test/flutter_test.dart';
import 'package:flutterlab/modules/dashboard/dashboard_controller.dart';

void main() {
  late DashboardController controller;

  setUp(() {
    controller = DashboardController();
    controller.loadMore();
  });

  test('initial state should have products', () {
    expect(controller.visibleProducts.isNotEmpty, true);
  });

  test('filter by category should filter products correctly', () {
    final categories = controller.categories;
    expect(categories.isNotEmpty, isTrue);

    final category = controller.categories.first;
    controller.filterByCategory(category);

    expect(
      controller.visibleProducts.every((p) => p.category == category),
      true,
    );
  });

  test('filterByCategory with null should reset filter', () {
    final category = controller.categories.first;

    controller.filterByCategory(category);

    expect(
      controller.visibleProducts.every((p) => p.category == category),
      true,
    );

    controller.filterByCategory(null);

    final categoriesAfterReset = controller.visibleProducts
        .map((p) => p.category)
        .toSet();

    expect(categoriesAfterReset.length > 1, true);
  });

  test('groupByCategory should group visible products correctly', () {
    final grouped = controller.groupByCategory();

    expect(grouped.isNotEmpty, true);

    for (final entry in grouped.entries) {
      expect(entry.value.every((p) => p.category == entry.key), true);
    }
  });
}
