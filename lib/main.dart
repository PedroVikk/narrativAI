import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/login_screen.dart';
import 'screens/menu_principal_screen.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const NarrativIA());
}

class NarrativIA extends StatelessWidget {
  const NarrativIA({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NarrativIA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundDark,  // Fundo global

        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          background: AppColors.backgroundDark,
          primary: AppColors.primary,
          error: AppColors.error,
          onPrimary: AppColors.textLight,
          onBackground: AppColors.textLight,
        ),

        textTheme: GoogleFonts.openSansTextTheme().apply(
          bodyColor: AppColors.textLight,
          displayColor: AppColors.textLight,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,  // Fundo do botão
            foregroundColor: AppColors.textLight,  // Texto do botão
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFF5D8A7),  // Fundo dos campos de texto
          labelStyle: TextStyle(color: AppColors.primary),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.border),
          ),
          errorStyle: TextStyle(color: AppColors.error),
        ),
      ),

      home: const MenuPrincipalScreen(),  // Troque para MenuPrincipalScreen se quiser testar
    );
  }
}
