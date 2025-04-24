import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cadastro_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  bool _emailTouched = false;
  bool _passwordTouched = false;
  bool _passwordVisible = false;  // Olinho da senha <0>

  @override
  void initState() {
    super.initState();
    _emailFocus.addListener(() {
      if (!_emailFocus.hasFocus) {
        setState(() {
          _emailTouched = true;
        });
      }
    });
    _passwordFocus.addListener(() {
      if (!_passwordFocus.hasFocus) {
        setState(() {
          _passwordTouched = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _login() {
    setState(() {
      _emailTouched = true;
      _passwordTouched = true;
    });
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;
      print('Email: \$email, Senha: \$password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E2E2E),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFFFFECC4),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'NarrativAI',
                  style: GoogleFonts.medievalSharp(
                    color: const Color(0xFF5B1E0F),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: 400,
                  child: TextFormField(
                    controller: _emailController,
                    focusNode: _emailFocus,
                    style: GoogleFonts.openSans(color: Colors.black87),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: GoogleFonts.openSans(color: Colors.black87),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFFC86A24)),
                      ),
                      errorStyle: const TextStyle(color: Color(0xFFB00020)),
                    ),
                    validator: (value) {
                      if (!_emailTouched) return null;
                      if (value == null || value.isEmpty) {
                        return 'Digite seu email';
                      }
                      if (!value.contains('@')) {
                        return 'Digite um email válido';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 400,
                  child: TextFormField(
                    controller: _passwordController,
                    focusNode: _passwordFocus,
                    obscureText: !_passwordVisible,  // Controla visibilidade
                    style: GoogleFonts.openSans(color: Colors.black87),
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      labelStyle: GoogleFonts.openSans(color: Colors.black87),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFFC86A24)),
                      ),
                      errorStyle: const TextStyle(color: Color(0xFFB00020)),
                      suffixIcon: IconButton(  // Ícone do olhinho
                        icon: Icon(
                          _passwordVisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (!_passwordTouched) return null;
                      if (value == null || value.isEmpty) {
                        return 'Digite sua senha';
                      }
                      if (value.length < 6) {
                        return 'A senha deve ter pelo menos 6 caracteres';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Esqueceu a senha?',
                      style: GoogleFonts.openSans(
                        color: const Color(0xFF5B1E0F),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: 280,
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5B1E0F),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Entrar',
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                     ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
               TextButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CadastroScreen()),
    );
  },
  child: Text(
    'Criar conta',
    style: GoogleFonts.openSans(
      color: const Color(0xFF5B1E0F),
      decoration: TextDecoration.underline,
    ),
  ),
),
                const SizedBox(height: 16),
                Image.asset(
                  'assets/logo.png',
                  height: 180,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
