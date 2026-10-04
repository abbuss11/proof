import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8F6),
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.go('/profile'),
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF17211E),
          ),
        ),
        title: const Text(
          'Paramètres',
          style: TextStyle(
            color: Color(0xFF17211E),
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          _buildSectionTitle('Préférences'),
          const SizedBox(height: 10),
          _buildSettingsCard(
            icon: Icons.language_outlined,
            title: 'Langue',
            subtitle: 'Français',
            onTap: () {
              _showMessage(
                context,
                'Le changement de langue sera disponible prochainement.',
              );
            },
          ),
          const SizedBox(height: 10),
          _buildSettingsCard(
            icon: Icons.notifications_none_outlined,
            title: 'Notifications',
            subtitle: 'Gérer mes notifications',
            onTap: () {
              _showMessage(
                context,
                'Les paramètres de notifications seront disponibles prochainement.',
              );
            },
          ),
          const SizedBox(height: 24),
          _buildSectionTitle('Sécurité'),
          const SizedBox(height: 10),
          _buildSettingsCard(
            icon: Icons.lock_outline,
            title: 'Mot de passe',
            subtitle: 'Modifier mon mot de passe',
            onTap: () {
              _showMessage(
                context,
                'La modification du mot de passe sera disponible prochainement.',
              );
            },
          ),
          const SizedBox(height: 10),
          _buildSettingsCard(
            icon: Icons.privacy_tip_outlined,
            title: 'Confidentialité',
            subtitle: 'Gérer mes données et permissions',
            onTap: () {
              _showMessage(
                context,
                'Les paramètres de confidentialité seront disponibles prochainement.',
              );
            },
          ),
          const SizedBox(height: 24),
          _buildSectionTitle('À propos'),
          const SizedBox(height: 10),
          _buildSettingsCard(
            icon: Icons.info_outline,
            title: 'À propos de PROOF',
            subtitle: 'Version 1.0.0',
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'PROOF',
                applicationVersion: '1.0.0',
                applicationLegalese:
                    'Plateforme de vérification et de traçabilité foncière.',
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xFF17211E),
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildSettingsCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF5EF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: const Color(0xFF2FA66A),
                  size: 21,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFF17211E),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Color(0xFF6B7470),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Color(0xFF8A938F),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}