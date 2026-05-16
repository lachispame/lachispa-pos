import 'package:flutter/material.dart';
import '../l10n/generated/app_localizations.dart';
import '../core/theme/app_theme.dart';
import '../core/constants/app_constants.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(title: Text(l10n.about_title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.bolt,
                      size: 64,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    l10n.login_title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${l10n.about_version} ${AppConstants.appVersion}',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      l10n.about_description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _SectionHeader(title: l10n.features_title),
            const SizedBox(height: 16),
            _FeatureItem(
              icon: Icons.point_of_sale,
              title: l10n.sale_title,
              description: l10n.about_sale_desc,
            ),
            _FeatureItem(
              icon: Icons.qr_code,
              title: l10n.scan_qr_button,
              description: l10n.invoice_key_qr_title,
            ),
            _FeatureItem(
              icon: Icons.attach_money,
              title: l10n.currency_settings,
              description: l10n.about_multicurrency_desc,
            ),
            _FeatureItem(
              icon: Icons.currency_exchange,
              title: l10n.about_exchange_rates,
              description: l10n.about_exchange_desc,
            ),
            _FeatureItem(
              icon: Icons.cloud_sync,
              title: l10n.pending_sale_title,
              description: l10n.pending_sale_message,
            ),
            _FeatureItem(
              icon: Icons.history,
              title: l10n.history_title,
              description: l10n.view_history_subtitle,
            ),
            _FeatureItem(
              icon: Icons.file_upload,
              title: l10n.export_sales,
              description: l10n.about_export_desc,
            ),
            _FeatureItem(
              icon: Icons.file_download,
              title: l10n.import_button,
              description: l10n.about_import_desc,
            ),
            _FeatureItem(
              icon: Icons.inventory_2,
              title: l10n.catalog_title,
              description: l10n.about_catalog_desc,
            ),
            _FeatureItem(
              icon: Icons.nfc,
              title: l10n.pay_with_nfc,
              description: l10n.about_nfc_desc,
            ),
            _FeatureItem(
              icon: Icons.table_restaurant,
              title: l10n.tables_title,
              description: l10n.about_tables_desc,
            ),
            _FeatureItem(
              icon: Icons.bar_chart,
              title: l10n.stats_title,
              description: l10n.about_stats_desc,
            ),
            _FeatureItem(
              icon: Icons.receipt_long,
              title: l10n.receipt_title,
              description: l10n.about_receipt_desc,
            ),
            _FeatureItem(
              icon: Icons.language,
              title: l10n.language_settings,
              description: l10n.about_multilang_desc,
            ),
            const SizedBox(height: 32),
            _SectionHeader(title: l10n.roles_title),
            const SizedBox(height: 16),
            _FeatureItem(
              icon: Icons.person,
              title: l10n.employee_role,
              description: l10n.employee_panel_title,
            ),
            _FeatureItem(
              icon: Icons.admin_panel_settings,
              title: l10n.boss_role,
              description: l10n.boss_panel_title,
            ),
            const SizedBox(height: 32),
            _SectionHeader(title: l10n.how_to_connect),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.steps_title, style: const TextStyle(fontSize: 13)),
                  const SizedBox(height: 12),
                  _StepItem(number: '1', text: l10n.step_connect_1),
                  _StepItem(number: '2', text: l10n.step_connect_2),
                  _StepItem(number: '3', text: l10n.step_connect_3),
                  _StepItem(number: '4', text: l10n.step_connect_4),
                  const SizedBox(height: 12),
                  Text(
                    l10n.steps_subtitle,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: Column(
                children: [
                  Text(
                    l10n.developed_with,
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Flutter'),
                      Text(' + ', style: TextStyle(color: Colors.grey[500])),
                      const Text('LNBits'),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'lachispa.me',
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppTheme.primaryColor,
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppTheme.primaryColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: TextStyle(color: Colors.grey[400], fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StepItem extends StatelessWidget {
  final String number;
  final String text;

  const _StepItem({required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 13))),
        ],
      ),
    );
  }
}
