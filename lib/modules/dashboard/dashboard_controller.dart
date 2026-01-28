import 'package:flutter/material.dart';
import '../../models/product.dart';
import 'mock_products.dart';

enum SortType { az, highestPrice, newest }

class DashboardController extends ChangeNotifier {
  final List<Product> _allProducts = List.from(mockProducts);

  List<Product> _visibleProducts = [];
  List<Product> get products => _visibleProducts;

  SortType _currentSort = SortType.az;

  int _page = 1;
  final int _pageSize = 5;

  String _searchQuery = '';
  String? _selectedCategory;

  DashboardController() {
    _applyFilters();
  }

  bool _groupByCategory = false;
  bool get isGrouped => _groupByCategory;

  void toggleGroupByCategory() {
    _groupByCategory = !_groupByCategory;
    notifyListeners();
  }

  double get totalValue =>
      _visibleProducts.fold(0, (sum, p) => sum + p.totalValue);

  int get totalItems => _visibleProducts.length;

  void search(String query) {
    _searchQuery = query.toLowerCase();
    _page = 1;
    _applyFilters();
  }

  Map<String, List<Product>> groupByCategory() {
    final Map<String, List<Product>> map = {};

    for (final product in _visibleProducts) {
      map.putIfAbsent(product.category, () => []);
      map[product.category]!.add(product);
    }

    return map;
  }

  void filterByCategory(String? category) {
    _selectedCategory = category;
    _page = 1;
    _applyFilters();
  }

  void showOnlyActive() {
    _page = 1;
    _visibleProducts = _allProducts.where((p) => p.active).toList();
    notifyListeners();
  }

  void sort(SortType type) {
    _currentSort = type;
    _applyFilters();
  }

  void removeDuplicates() {
    _visibleProducts = _visibleProducts.toSet().toList();
    notifyListeners();
  }

  void loadMore() {
    _page++;
    _applyFilters();
  }

  void reset() {
    _page = 1;
    _searchQuery = '';
    _selectedCategory = null;
    _applyFilters();
  }

  void _applyFilters() {
    List<Product> filtered = List.from(_allProducts);

    if (_searchQuery.isNotEmpty) {
      filtered = filtered
          .where((p) => p.name.toLowerCase().contains(_searchQuery))
          .toList();
    }

    if (_selectedCategory != null) {
      filtered = filtered
          .where((p) => p.category == _selectedCategory)
          .toList();
    }

    filtered.sort((a, b) {
      switch (_currentSort) {
        case SortType.highestPrice:
          return b.price.compareTo(a.price);
        case SortType.newest:
          return b.createdAt.compareTo(a.createdAt);
        case SortType.az:
        default:
          return a.compareTo(b);
      }
    });

    _visibleProducts = filtered.take(_page * _pageSize).toList();

    notifyListeners();
  }
}
