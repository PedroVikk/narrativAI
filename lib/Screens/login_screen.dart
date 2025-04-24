import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cadastro_screen.dart';
import 'package:narrativia/theme/app_colors.dart';

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
  bool _passwordVisible = false;

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
      print('Email: $email, Senha: $password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(24),
          color: AppColors.backgroundLight,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'NarrativAI',
                  style: GoogleFonts.medievalSharp(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: 400,
                  child: TextFormField(
                    controller: _emailController,
                    focusNode: _emailFocus,
                    decoration: const InputDecoration(
                      labelText: 'Email',
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
                    style: const TextStyle(color: AppColors.inputText),

                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 400,
                  child: TextFormField(
                    controller: _passwordController,
                    focusNode: _passwordFocus,
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible ? Icons.visibility : Icons.visibility_off,
                          color: Theme.of(context).colorScheme.onPrimary,
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
                    style: const TextStyle(color: AppColors.inputText),
                  ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {},
                  child: const Text('Esqueceu a senha?'),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: 280,
                  child: ElevatedButton(
                    onPressed: _login,
                    child: const Text('Entrar'),
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
                  child: const Text('Criar conta'),
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
