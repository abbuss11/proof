import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration({
    required String hint,
    required IconData icon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon, size: 21),
      prefixIconColor: const Color(0xFF6B7470),
      suffixIcon: suffixIcon,
      suffixIconColor: const Color(0xFF6B7470),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 17,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: Color(0xFFE0E5E2),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: Color(0xFFE0E5E2),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: Color(0xFF2FA66A),
          width: 1.5,
        ),
      ),
      filled: true,
      fillColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Retour
              IconButton(
                onPressed: () => context.go('/login'),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Color(0xFF17211E),
                ),
              ),

              const SizedBox(height: 30),

              // Logo
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2FA66A),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: const Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'PROOF',
                      style: TextStyle(
                        color: Color(0xFF123B32),
                        fontSize: 21,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 2.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 42),

              const Text(
                'Créez votre compte',
                style: TextStyle(
                  color: Color(0xFF17211E),
                  fontSize: 29,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.7,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Créez votre espace PROOF pour enregistrer '
                'et suivre vos propriétés.',
                style: TextStyle(
                  color: Color(0xFF6B7470),
                  fontSize: 15,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Nom complet',
                style: TextStyle(
                  color: Color(0xFF17211E),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 9),

              TextField(
                controller: _nameController,
                textCapitalization: TextCapitalization.words,
                decoration: _inputDecoration(
                  hint: 'Votre nom complet',
                  icon: Icons.person_outline,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Téléphone ou email',
                style: TextStyle(
                  color: Color(0xFF17211E),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 9),

              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: _inputDecoration(
                  hint: 'Ex. nom@email.com',
                  icon: Icons.alternate_email,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Mot de passe',
                style: TextStyle(
                  color: Color(0xFF17211E),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 9),

              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: _inputDecoration(
                  hint: 'Votre mot de passe',
                  icon: Icons.lock_outline,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 21,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Confirmer le mot de passe',
                style: TextStyle(
                  color: Color(0xFF17211E),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 9),

              TextField(
                controller: _confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                decoration: _inputDecoration(
                  hint: 'Répétez votre mot de passe',
                  icon: Icons.lock_outline,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword =
                            !_obscureConfirmPassword;
                      });
                    },
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 21,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF123B32),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Créer mon compte',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 22),

              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    const Text(
                      'Vous avez déjà un compte ? ',
                      style: TextStyle(
                        color: Color(0xFF6B7470),
                        fontSize: 13,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => context.go('/login'),
                      child: const Text(
                        'Se connecter',
                        style: TextStyle(
                          color: Color(0xFF176B87),
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              Center(
                child: Text(
                  'Vos données restent protégées.',
                  style: TextStyle(
                    color: const Color(0xFF6B7470).withValues(alpha: 0.75),
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


