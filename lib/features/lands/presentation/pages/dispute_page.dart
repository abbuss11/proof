import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DisputePage extends StatefulWidget {
  final String landId;

  const DisputePage({
    super.key,
    required this.landId,
  });

  @override
  State<DisputePage> createState() => _DisputePageState();
}

class _DisputePageState extends State<DisputePage> {
  final _formKey = GlobalKey<FormState>();

  final _reasonController = TextEditingController();
  final _descriptionController = TextEditingController();

  String _selectedReason = 'Problème de propriété';

  final List<String> _reasons = [
    'Problème de propriété',
    'Vente contestée',
    'Limites du terrain',
    'Document contesté',
    'Autre',
  ];

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
    _reasonController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitDispute() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Votre signalement est prêt à être enregistré.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Signaler un litige',
          style: TextStyle(
            color: Color(0xFF17211E),
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go(
              '/land-detail',
              extra: widget.landId,
            );
          },
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              _buildLandSummary(),
              const SizedBox(height: 24),
              _buildIntro(),
              const SizedBox(height: 24),
              _buildSectionTitle('Motif du litige'),
              const SizedBox(height: 10),
              _buildReasonDropdown(),
              const SizedBox(height: 24),
              _buildSectionTitle('Description'),
              const SizedBox(height: 10),
              _buildDescriptionField(),
              const SizedBox(height: 24),
              _buildInfoCard(),
              const SizedBox(height: 30),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLandSummary() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE3E7E4),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF5EF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.landscape_outlined,
              color: Color(0xFF2FA66A),
            ),
          ),
          const SizedBox(width: 14),
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

  Widget _buildIntro() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Déclarer un litige',
          style: TextStyle(
            color: Color(0xFF17211E),
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Signalez un problème lié à ce terrain afin qu’il puisse être examiné par les personnes compétentes.',
          style: TextStyle(
            color: Color(0xFF6B7470),
            fontSize: 14,
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
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildReasonDropdown() {
    return DropdownButtonFormField<String>(
      initialValue: _selectedReason,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
      items: _reasons.map((reason) {
        return DropdownMenuItem(
          value: reason,
          child: Text(reason),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) {
          setState(() {
            _selectedReason = value;
          });
        }
      },
    );
  }

  Widget _buildDescriptionField() {
    return TextFormField(
      controller: _descriptionController,
      maxLines: 6,
      decoration: InputDecoration(
        hintText: 'Décrivez le problème rencontré...',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Veuillez décrire le litige.';
        }

        if (value.trim().length < 10) {
          return 'La description doit contenir au moins 10 caractères.';
        }

        return null;
      },
    );
  }

  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF5EF),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline,
            color: Color(0xFF2FA66A),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Les informations fournies seront associées à la référence du terrain.',
              style: TextStyle(
                color: Color(0xFF36564A),
                fontSize: 12,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      height: 52,
      child: ElevatedButton(
        onPressed: _submitDispute,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2FA66A),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: const Text(
          'Envoyer le signalement',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}