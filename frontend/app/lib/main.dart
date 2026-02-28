import 'package:flutter/material.dart';

import 'components/top_bar.dart';
import 'components/patrimonio_section.dart';
import 'components/quick_stats.dart';
import 'components/startups_section.dart';
import 'components/posicoes_section.dart';
import 'components/portfolio_page.dart';
import 'components/balcao_page.dart';
import 'components/perfil_page.dart';
import 'components/bottom_nav.dart';

void main() {
  runApp(const MesclaInvestApp());
}

class MesclaInvestApp extends StatelessWidget {
  const MesclaInvestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MesclaInvest Prototype',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: const Color(0xFFF8F8FA),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6A5ACD)),
        useMaterial3: true,
      ),
      home: const MainLayout(),
    );
  }
}

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  String activeTab = 'home';

  Widget _buildBody() {
    switch (activeTab) {
      case 'home':
        return SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            children: const [
              PatrimonioSection(),
              QuickStats(),
              StartupsSection(),
              PosicoesSection(),
            ],
          ),
        );
      case 'portfolio':
        return const PortfolioPage();
      case 'balcao':
        return const BalcaoPage();
      case 'perfil':
        return const PerfilPage();
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FA),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const TopBar(),
            Expanded(
              child: _buildBody(),
            ),
            BottomNav(
              activeTab: activeTab,
              onChange: (tab) => setState(() => activeTab = tab),
            ),
          ],
        ),
      ),
    );
  }
}
