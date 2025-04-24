import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:narrativia/theme/app_colors.dart';

class MenuPrincipalScreen extends StatelessWidget {
  const MenuPrincipalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: AppColors.primary,  // Fundo escuro do Drawer
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                ),
                child: Text(
                  'NarrativIA                           Seu Mestre Virtual',
                  style: GoogleFonts.medievalSharp(
                    fontSize: 25,
                    color: AppColors.textLight,
                  ),
                ),
              ),
              _buildDrawerItem(Icons.map, 'Campanhas'),
              _buildDrawerItem(Icons.people, 'Amigos'),
              _buildDrawerItem(Icons.person, 'Perfil'),
              const Divider(color: AppColors.border),
              _buildDrawerItem(Icons.settings, 'Configurações'),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Minhas Campanhas',
          style: GoogleFonts.medievalSharp(
            fontSize: 24,
            color: AppColors.textLight,
          ),
        ),
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(
    color: AppColors.textLight,  // Cor do ícone (menu)
    size: 30,                    // Tamanho do ícone
  ),
      ),
      body: Container(
  width: double.infinity,
  height: double.infinity,
  color: AppColors.backgroundLight,
  child: Center(
    child: SizedBox(
      width: 600,  // Largura máxima para os cards
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _buildCampanhaCard('A Cidadela Perdida', '8 Jogadores', 'Mestre: PedroVikk'),
          _buildCampanhaCard('Cyberpunk 2077', '5 Jogadores', 'Mestre: AnaGamer'),
          _buildCampanhaCard('Dungeon of Doom', '6 Jogadores', 'Mestre: LucasGM'),
        ],
      ),
    ),
  ),
),
    );

  }

  // Drawer item (ícone + texto)
  Widget _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textLight),
      title: Text(
        title,
        style: const TextStyle(color: AppColors.textLight),
      ),
      onTap: () {
        // Navegação futura
      },
    );
  }

  // Card de campanha mock
  Widget _buildCampanhaCard(String nome, String jogadores, String mestre) {
    return Card(
      color: AppColors.backgroundDark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(
          nome,
          style: GoogleFonts.openSans(color: AppColors.textLight, fontSize: 18),
        ),
        subtitle: Row(
          children: [
            const Icon(Icons.people, size: 16, color: AppColors.textLight),
            const SizedBox(width: 4),
            Text(jogadores, style: GoogleFonts.openSans(color: AppColors.textLight)),
            const SizedBox(width: 12),
            const Icon(Icons.person, size: 16, color: AppColors.textLight),
            const SizedBox(width: 4),
            Text(mestre, style: GoogleFonts.openSans(color: AppColors.textLight)),
          ],
        ),
      ),
    );
  }
}
