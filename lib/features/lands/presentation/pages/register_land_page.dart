
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterLandPage extends StatefulWidget {
  const RegisterLandPage({super.key});

  @override
  State<RegisterLandPage> createState() => _RegisterLandPageState();
}

class _RegisterLandPageState extends State<RegisterLandPage> {
  final _formKey = GlobalKey<FormState>();

  final _referenceController = TextEditingController();
  final _typeController = TextEditingController();
  final _addressController = TextEditingController();
  final _surfaceController = TextEditingController();
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();

  @override
  void dispose() {
    _referenceController.dispose();
    _typeController.dispose();
    _addressController.dispose();
    _surfaceController.dispose();
    _latitudeController.dispose();
    _longitudeController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Les informations sont prêtes à être enregistrées.',
        ),
      ),
    );
  }

  String? _requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Ce champ est obligatoire';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8F6),
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.go('/home'),
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF17211E),
          ),
        ),
        title: const Text(
          'Enregistrer un terrain',
          style: TextStyle(
            color: Color(0xFF17211E),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: [
            const Text(
              'Informations du terrain',
              style: TextStyle(
                color: Color(0xFF17211E),
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Renseignez les informations nécessaires pour enregistrer votre terrain.',
              style: TextStyle(
                color: Color(0xFF6B7470),
                fontSize: 13,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),

            _buildLabel('Référence du terrain'),
            const SizedBox(height: 8),
            _buildTextField(
              controller: _referenceController,
              hintText: 'Ex. REF-001',
              icon: Icons.tag_outlined,
            ),

            const SizedBox(height: 18),

            _buildLabel('Type de terrain'),
            const SizedBox(height: 8),
            _buildTextField(
              controller: _typeController,
              hintText: 'Ex. résidentiel',
              icon: Icons.home_work_outlined,
            ),

            const SizedBox(height: 18),

            _buildLabel('Adresse / localisation'),
            const SizedBox(height: 8),
            _buildTextField(
              controller: _addressController,
              hintText: 'Adresse ou description de la localisation',
              icon: Icons.location_on_outlined,
              maxLines: 2,
            ),

            const SizedBox(height: 18),

            _buildLabel('Superficie'),
            const SizedBox(height: 8),
            _buildTextField(
              controller: _surfaceController,
              hintText: 'Ex. 500',
              icon: Icons.square_foot_outlined,
              keyboardType: TextInputType.number,
              suffixText: 'm²',
            ),

            const SizedBox(height: 24),

            const Text(
              'Coordonnées géographiques',
              style: TextStyle(
                color: Color(0xFF17211E),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Ces informations permettent de localiser précisément le terrain.',
              style: TextStyle(
                color: Color(0xFF6B7470),
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 14),

            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    controller: _latitudeController,
                    hintText: 'Latitude',
                    icon: Icons.explore_outlined,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                      signed: true,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildTextField(
                    controller: _longitudeController,
                    hintText: 'Longitude',
                    icon: Icons.explore_outlined,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                      signed: true,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFEAF5EF),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Color(0xFF238452),
                    size: 20,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Les documents justificatifs pourront être ajoutés lors de la prochaine étape.',
                      style: TextStyle(
                        color: Color(0xFF27664A),
                        fontSize: 12,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            SizedBox(
              height: 54,
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF123B32),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'Continuer',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF17211E),
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    TextInputType? keyboardType,
    String? suffixText,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      validator: _requiredValidator,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(
          icon,
          color: const Color(0xFF6B7470),
          size: 20,
        ),
        suffixText: suffixText,
        hintStyle: const TextStyle(
          color: Color(0xFF9AA29E),
          fontSize: 13,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: const BorderSide(
            color: Color(0xFF2FA66A),
            width: 1.2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: const BorderSide(
            color: Colors.redAccent,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: const BorderSide(
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}

