
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8F6),
        elevation: 0,
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Color(0xFF17211E),
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.go('/home');
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF17211E),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
        children: [
          _NotificationItem(
            icon: Icons.swap_horiz_outlined,
            iconBackground: const Color(0xFFEAF5EF),
            iconColor: const Color(0xFF238452),
            title: 'Transfert de propriété',
            message:
                'La demande de transfert du terrain LAND-002 est en attente de confirmation.',
            time: 'Il y a 20 min',
            isNew: true,
          ),
          const SizedBox(height: 12),
          _NotificationItem(
            icon: Icons.verified_outlined,
            iconBackground: const Color(0xFFEAF5EF),
            iconColor: const Color(0xFF238452),
            title: 'Terrain vérifié',
            message:
                'La vérification du terrain LAND-001 a été effectuée avec succès.',
            time: 'Il y a 2 h',
            isNew: true,
          ),
          const SizedBox(height: 12),
          _NotificationItem(
            icon: Icons.description_outlined,
            iconBackground: const Color(0xFFFFF2DF),
            iconColor: const Color(0xFFC57A20),
            title: 'Certificat disponible',
            message:
                'Le certificat numérique du terrain LAND-003 est maintenant disponible.',
            time: 'Hier',
            isNew: true,
          ),
          const SizedBox(height: 12),
          _NotificationItem(
            icon: Icons.warning_amber_outlined,
            iconBackground: const Color(0xFFFDECEC),
            iconColor: const Color(0xFFD94B4B),
            title: 'Signalement de litige',
            message:
                'Un signalement concernant le terrain LAND-003 a été enregistré.',
            time: 'Il y a 2 jours',
          ),
        ],
      ),
    );
  }
}

class _NotificationItem extends StatelessWidget {
  final IconData icon;
  final Color iconBackground;
  final Color iconColor;
  final String title;
  final String message;
  final String time;
  final bool isNew;

  const _NotificationItem({
    required this.icon,
    required this.iconBackground,
    required this.iconColor,
    required this.title,
    required this.message,
    required this.time,
    this.isNew = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE2E7E4),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconBackground,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 22,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Color(0xFF17211E),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    if (isNew)
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFF2FA66A),
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  message,
                  style: const TextStyle(
                    color: Color(0xFF6B7470),
                    fontSize: 12,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  time,
                  style: const TextStyle(
                    color: Color(0xFF9AA39F),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

