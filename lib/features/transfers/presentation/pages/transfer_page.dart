import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TransferPage extends StatefulWidget {
  final String landId;

  const TransferPage({
    super.key,
    required this.landId,
  });

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  int _currentStep = 0;

  final _buyerNameController =
      TextEditingController(text: 'Alain Martin');

  final _buyerPhoneController =
      TextEditingController(text: '+XXX XXX XXX XXX');

  String get _landTitle {
    switch (widget.landId) {
      case 'LAND-002':
        return 'Terrain commercial';
      case 'LAND-003':
        return 'Terrain familial';
      default:
        return 'Terrain résidentiel';
    }
  }

  String get _landArea {
    switch (widget.landId) {
      case 'LAND-002':
        return '800 m²';
      case 'LAND-003':
        return '650 m²';
      default:
        return '500 m²';
    }
  }

  @override
  void dispose() {
    _buyerNameController.dispose();
    _buyerPhoneController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_currentStep < 3) {
      setState(() {
        _currentStep++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8F6),
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.go(
            '/land-detail',
            extra: widget.landId,
          ),
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF17211E),
          ),
        ),
        title: const Text(
          'Transfert de propriété',
          style: TextStyle(
            color: Color(0xFF17211E),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          _buildStepIndicator(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
              child: _buildCurrentStep(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicator() {
    const steps = [
      'Demande',
      'Confirmation',
      'Enregistrement',
      'Certificat',
    ];

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      color: const Color(0xFFF7F8F6),
      child: Row(
        children: List.generate(steps.length, (index) {
          final isActive = index <= _currentStep;

          return Expanded(
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: isActive
                            ? const Color(0xFF2FA66A)
                            : const Color(0xFFE1E6E3),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: index < _currentStep
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16,
                              )
                            : Text(
                                '${index + 1}',
                                style: TextStyle(
                                  color: isActive
                                      ? Colors.white
                                      : const Color(0xFF6B7470),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      steps[index],
                      style: TextStyle(
                        color: isActive
                            ? const Color(0xFF17211E)
                            : const Color(0xFF8A938F),
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                if (index < steps.length - 1)
                  Expanded(
                    child: Container(
                      height: 2,
                      margin: const EdgeInsets.only(
                        left: 5,
                        right: 5,
                        bottom: 20,
                      ),
                      color: index < _currentStep
                          ? const Color(0xFF2FA66A)
                          : const Color(0xFFE1E6E3),
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildCurrentStep() {
    switch (_currentStep) {
      case 0:
        return _buildTransferRequest();
      case 1:
        return _buildBuyerConfirmation();
      case 2:
        return _buildRegistration();
      case 3:
        return _buildCertificate();
      default:
        return const SizedBox();
    }
  }

  Widget _buildTransferRequest() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPageTitle(
          'Demande de transfert',
          'Initiez le transfert de propriété vers un nouvel acquéreur.',
        ),
        const SizedBox(height: 24),
        _buildLandSummary(),
        const SizedBox(height: 22),
        _buildSectionTitle('Nouveau propriétaire'),
        const SizedBox(height: 12),
        _buildTextField(
          controller: _buyerNameController,
          label: 'Nom complet',
          icon: Icons.person_outline,
        ),
        const SizedBox(height: 14),
        _buildTextField(
          controller: _buyerPhoneController,
          label: 'Numéro de téléphone',
          icon: Icons.phone_outlined,
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 20),
        _buildInfoCard(
          icon: Icons.info_outline,
          text:
              'Le nouveau propriétaire devra confirmer cette demande avant son enregistrement.',
        ),
        const SizedBox(height: 24),
        _buildPrimaryButton(
          label: 'Envoyer la demande',
          onPressed: _nextStep,
        ),
      ],
    );
  }

  Widget _buildBuyerConfirmation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPageTitle(
          'Confirmation de l’acquéreur',
          'Le nouveau propriétaire doit confirmer son identité et accepter le transfert.',
        ),
        const SizedBox(height: 24),
        _buildBuyerCard(),
        const SizedBox(height: 20),
        _buildLandSummary(),
        const SizedBox(height: 24),
        _buildInfoCard(
          icon: Icons.verified_user_outlined,
          text:
              'La confirmation permet de poursuivre la procédure d’enregistrement du transfert.',
        ),
        const SizedBox(height: 28),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Demande de transfert refusée.'),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(52),
                  side: const BorderSide(
                    color: Color(0xFFD8DEDA),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'Refuser',
                  style: TextStyle(
                    color: Color(0xFF6B7470),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: _buildPrimaryButton(
                label: 'Confirmer',
                onPressed: _nextStep,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRegistration() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPageTitle(
          'Enregistrement',
          'La nouvelle propriété est en cours d’enregistrement.',
        ),
        const SizedBox(height: 24),
        _buildBuyerCard(),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              const Icon(
                Icons.sync_outlined,
                color: Color(0xFF2FA66A),
                size: 34,
              ),
              const SizedBox(height: 14),
              const Text(
                'Enregistrement du transfert',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF17211E),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Les informations du nouveau propriétaire sont enregistrées dans le dossier du terrain.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF6B7470),
                  fontSize: 12,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const LinearProgressIndicator(
                  value: 1,
                  minHeight: 7,
                  color: Color(0xFF2FA66A),
                  backgroundColor: Color(0xFFEAF5EF),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Enregistrement terminé',
                style: TextStyle(
                  color: Color(0xFF238452),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        _buildInfoCard(
          icon: Icons.history_outlined,
          text:
              'Le transfert sera conservé dans l’historique des propriétaires du terrain.',
        ),
        const SizedBox(height: 28),
        _buildPrimaryButton(
          label: 'Générer le nouveau certificat',
          onPressed: _nextStep,
        ),
      ],
    );
  }

  Widget _buildCertificate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPageTitle(
          'Nouveau certificat',
          'Le transfert de propriété est enregistré.',
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: const Color(0xFF123B32),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            children: [
              const Icon(
                Icons.verified_outlined,
                color: Colors.white,
                size: 42,
              ),
              const SizedBox(height: 14),
              const Text(
                'CERTIFICAT DE PROPRIÉTÉ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 22),
              _buildCertificateRow(
                'Terrain',
                _landTitle,
              ),
              _buildCertificateRow(
                'Référence',
                widget.landId,
              ),
              _buildCertificateRow(
                'Propriétaire',
                _buyerNameController.text,
              ),
              _buildCertificateRow(
                'Statut',
                'Propriétaire enregistré',
              ),
              _buildCertificateRow(
                'Certificat',
                'CERT-2026-001',
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
        _buildBuyerCard(),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: _buildCertificateAction(
                icon: Icons.visibility_outlined,
                label: 'Voir',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Aperçu du certificat.'),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildCertificateAction(
                icon: Icons.download_outlined,
                label: 'Télécharger',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Téléchargement du certificat.'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildCertificateAction(
          icon: Icons.share_outlined,
          label: 'Partager le certificat',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Partage du certificat.'),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPageTitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF17211E),
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          subtitle,
          style: const TextStyle(
            color: Color(0xFF6B7470),
            fontSize: 13,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xFF17211E),
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildLandSummary() {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE5EAE7),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF5EF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.landscape_outlined,
              color: Color(0xFF238452),
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _landTitle,
                  style: const TextStyle(
                    color: Color(0xFF17211E),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${widget.landId} • $_landArea',
                  style: const TextStyle(
                    color: Color(0xFF6B7470),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          const Text(
            'Disponible',
            style: TextStyle(
              color: Color(0xFF238452),
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBuyerCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF5EF),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person_outline,
              color: Color(0xFF238452),
              size: 25,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Nouveau propriétaire',
                  style: TextStyle(
                    color: Color(0xFF6B7470),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  _buyerNameController.text,
                  style: const TextStyle(
                    color: Color(0xFF17211E),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _buyerPhoneController.text,
                  style: const TextStyle(
                    color: Color(0xFF6B7470),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String text,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F4F1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: const Color(0xFF238452),
            size: 20,
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF58635E),
                fontSize: 12,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrimaryButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2FA66A),
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(52),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildCertificateRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFFB8C9C3),
                fontSize: 11,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCertificateAction({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 18,
      ),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFF17211E),
        minimumSize: const Size.fromHeight(48),
        side: const BorderSide(
          color: Color(0xFFD8DEDA),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
      ),
    );
  }
}