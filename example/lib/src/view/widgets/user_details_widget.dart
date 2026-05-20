import 'dart:convert';

import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserDetailsWidget extends StatefulWidget {
  final ApphudUser? user;

  const UserDetailsWidget({
    super.key,
    required this.user,
  });

  @override
  State<UserDetailsWidget> createState() => _UserDetailsWidgetState();
}

class _UserDetailsWidgetState extends State<UserDetailsWidget> {
  late Future<bool> _hasPremiumAccessFuture;

  @override
  void initState() {
    super.initState();
    _reloadPremiumAccess();
  }

  @override
  void didUpdateWidget(UserDetailsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.user?.userId != widget.user?.userId) {
      _reloadPremiumAccess();
    }
  }

  void _reloadPremiumAccess() {
    _hasPremiumAccessFuture = Apphud.hasPremiumAccess();
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    if (user == null) {
      return Center(
        child: Text(
          'User is not loaded yet',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    }

    final remoteConfig = user.remoteConfig();
    final remoteConfigPretty = remoteConfig.isEmpty
        ? '{}'
        : const JsonEncoder.withIndent('  ').convert(remoteConfig);

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: [
        _CopyableFieldCard(
          label: 'User ID',
          value: user.userId,
          onCopy: () => _copyAndToast(context, user.userId, 'User ID copied'),
        ),
        const SizedBox(height: 12),
        _InfoFieldCard(
          label: 'Targeting name',
          value: user.targetingName ?? '—',
          muted: user.targetingName == null,
        ),
        if (user.experimentName != null) ...[
          const SizedBox(height: 12),
          _InfoFieldCard(
            label: 'Experiment name',
            value: user.experimentName!,
          ),
        ],
        if (user.variationName != null) ...[
          const SizedBox(height: 12),
          _InfoFieldCard(
            label: 'Variation name',
            value: user.variationName!,
          ),
        ],
        const SizedBox(height: 12),
        _InfoFieldCard(
          label: 'Total devices count',
          value: user.totalDevicesCount.toString(),
        ),
        const SizedBox(height: 12),
        FutureBuilder<bool>(
          future: _hasPremiumAccessFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const _InfoFieldCard(
                label: 'Has premium access',
                value: 'Loading…',
                muted: true,
              );
            }
            final hasAccess = snapshot.data ?? false;
            return _PremiumAccessCard(hasPremiumAccess: hasAccess);
          },
        ),
        const SizedBox(height: 12),
        _RemoteConfigCard(prettyJson: remoteConfigPretty),
      ],
    );
  }

  void _copyAndToast(BuildContext context, String text, String message) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

class _CopyableFieldCard extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onCopy;

  const _CopyableFieldCard({
    required this.label,
    required this.value,
    required this.onCopy,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 1,
      child: InkWell(
        onTap: onCopy,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      value,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontFamily: 'monospace',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Tap to copy',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.outline,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.copy_rounded,
                color: theme.colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoFieldCard extends StatelessWidget {
  final String label;
  final String value;
  final bool muted;

  const _InfoFieldCard({
    required this.label,
    required this.value,
    this.muted = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: theme.textTheme.labelLarge?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: muted ? theme.colorScheme.outline : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PremiumAccessCard extends StatelessWidget {
  final bool hasPremiumAccess;

  const _PremiumAccessCard({required this.hasPremiumAccess});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = hasPremiumAccess ? Colors.green.shade700 : Colors.red.shade700;
    final bg = hasPremiumAccess
        ? Colors.green.withValues(alpha: 0.12)
        : Colors.red.withValues(alpha: 0.12);

    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Has premium access',
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Apphud.hasPremiumAccess()',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.outline,
                      fontFamily: 'monospace',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: bg,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    hasPremiumAccess
                        ? Icons.check_circle_rounded
                        : Icons.cancel_rounded,
                    color: color,
                    size: 20,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    hasPremiumAccess ? 'Yes' : 'No',
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
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

class _RemoteConfigCard extends StatelessWidget {
  final String prettyJson;

  const _RemoteConfigCard({required this.prettyJson});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 1,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'Remote config',
              style: theme.textTheme.labelLarge?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: theme.dividerColor.withValues(alpha: 0.5),
              ),
            ),
            child: SelectableText(
              prettyJson,
              style: theme.textTheme.bodySmall?.copyWith(
                fontFamily: 'monospace',
                height: 1.45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
