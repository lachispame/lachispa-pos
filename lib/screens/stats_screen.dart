import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../l10n/generated/app_localizations.dart';
import '../core/theme/app_theme.dart';
import '../providers/sales_provider.dart';
import '../providers/auth_provider.dart';
class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  Map<String, dynamic>? _todayStats;
  Map<String, dynamic>? _weekStats;
  Map<String, dynamic>? _monthStats;
  List<Map<String, dynamic>> _salesPerDay = [];
  List<Map<String, dynamic>> _topProducts = [];
  List<Map<String, dynamic>> _employeeSummary = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadStats();
  }

  Future<void> _loadStats() async {
    setState(() => _loading = true);

    final salesProvider = context.read<SalesProvider>();
    final auth = context.read<AuthProvider>();
    final userId = auth.isDependiente ? auth.currentUser!.id : null;

    final results = await Future.wait([
      salesProvider.getTodayStats(userId: userId),
      salesProvider.getWeekStats(userId: userId),
      salesProvider.getMonthStats(userId: userId),
      salesProvider.getSalesPerDay(7),
      salesProvider.getTopProducts(),
      if (auth.isJefe) salesProvider.getEmployeeSummary(),
    ]);

    if (!mounted) return;

    setState(() {
      _todayStats = results[0] as Map<String, dynamic>;
      _weekStats = results[1] as Map<String, dynamic>;
      _monthStats = results[2] as Map<String, dynamic>;
      _salesPerDay = results[3] as List<Map<String, dynamic>>;
      _topProducts = results[4] as List<Map<String, dynamic>>;
      _employeeSummary = results.length > 5
          ? results[5] as List<Map<String, dynamic>>
          : [];
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final auth = context.watch<AuthProvider>();

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(title: Text(l10n.stats_title)),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _loadStats,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildKpiRow(l10n),
                    const SizedBox(height: 24),
                    _buildSectionTitle(l10n.stats_last_7_days),
                    const SizedBox(height: 12),
                    _buildBarChart(),
                    const SizedBox(height: 24),
                    _buildSectionTitle(l10n.stats_top_products),
                    const SizedBox(height: 12),
                    _buildTopProducts(l10n),
                    if (auth.isJefe && _employeeSummary.isNotEmpty) ...[
                      const SizedBox(height: 24),
                      _buildSectionTitle(l10n.stats_by_employee),
                      const SizedBox(height: 12),
                      _buildEmployeeSummary(l10n),
                    ],
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildKpiRow(AppLocalizations l10n) {
    return Row(
      children: [
        Expanded(child: _buildKpiCard(l10n.stats_today, _todayStats, l10n)),
        const SizedBox(width: 12),
        Expanded(child: _buildKpiCard(l10n.stats_week, _weekStats, l10n)),
        const SizedBox(width: 12),
        Expanded(child: _buildKpiCard(l10n.stats_month, _monthStats, l10n)),
      ],
    );
  }

  Widget _buildKpiCard(String label, Map<String, dynamic>? stats, AppLocalizations l10n) {
    final count = (stats?['count'] as int?) ?? 0;
    final totalSats = (stats?['totalSats'] as int?) ?? 0;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 13, color: Colors.grey[400]),
          ),
          const SizedBox(height: 8),
          Text(
            '$totalSats',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
          ),
          Text(
            l10n.stats_sats_unit,
            style: TextStyle(fontSize: 11, color: Colors.grey[500]),
          ),
          const SizedBox(height: 4),
          Text(
            '$count ${l10n.stats_sales_unit}',
            style: TextStyle(fontSize: 12, color: Colors.grey[400]),
          ),
        ],
      ),
    );
  }

  Widget _buildBarChart() {
    final maxSats = _salesPerDay.fold<int>(
      0,
      (max, day) => (day['totalSats'] as int) > max
          ? (day['totalSats'] as int)
          : max,
    );

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        height: 160,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(_salesPerDay.length, (i) {
            final day = _salesPerDay[i];
            final date = day['date'] as DateTime;
            final sats = day['totalSats'] as int;
            final height = maxSats > 0 ? (sats / maxSats) * 120.0 : 0.0;
            final dayLabel = DateFormat('E').format(date).substring(0, 1);

            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (sats > 0)
                      Text(
                        _formatSats(sats),
                        style: const TextStyle(fontSize: 9, color: Colors.grey),
                      ),
                    const SizedBox(height: 4),
                    Container(
                      width: 20,
                      height: height.clamp(4.0, 120.0),
                      decoration: BoxDecoration(
                        color: sats > 0
                            ? AppTheme.primaryColor
                            : Colors.grey[800],
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(4),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      dayLabel,
                      style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildTopProducts(AppLocalizations l10n) {
    if (_topProducts.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            l10n.stats_no_data,
            style: TextStyle(color: Colors.grey[500]),
          ),
        ),
      );
    }

    final maxQty =
        _topProducts.fold<int>(
          0,
          (max, p) => (p['cantidad'] as int) > max ? (p['cantidad'] as int) : max,
        );

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: List.generate(_topProducts.length, (i) {
          final p = _topProducts[i];
          final nombre = p['nombre'] as String;
          final qty = p['cantidad'] as int;
          final sats = p['totalSats'] as int;
          final barWidth = maxQty > 0 ? (qty / maxQty) : 0.0;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        '${i + 1}. $nombre',
                        style: const TextStyle(fontSize: 13),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${qty}x  ${_formatSats(sats)} ${l10n.stats_sats_unit}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: LinearProgressIndicator(
                    value: barWidth.clamp(0.0, 1.0),
                    backgroundColor: Colors.grey[800],
                    color: AppTheme.primaryColor,
                    minHeight: 6,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildEmployeeSummary(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: List.generate(_employeeSummary.length, (i) {
          final e = _employeeSummary[i];
          final nombre = e['userNombre'] as String;
          final count = e['count'] as int;
          final sats = e['totalSats'] as int;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.person,
                    color: AppTheme.primaryColor,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    nombre,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  '$count ${l10n.stats_sales_unit}',
                  style: TextStyle(fontSize: 13, color: Colors.grey[400]),
                ),
                const SizedBox(width: 16),
                Text(
                  '${_formatSats(sats)} ${l10n.stats_sats_unit}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  String _formatSats(int sats) {
    if (sats >= 1000000) {
      return '${(sats / 1000000).toStringAsFixed(1)}M';
    } else if (sats >= 1000) {
      return '${(sats / 1000).toStringAsFixed(1)}k';
    }
    return sats.toString();
  }
}
