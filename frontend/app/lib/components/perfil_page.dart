import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      {'icon': Icons.account_balance_wallet, 'label': '---------', 'color': const Color(0xFF6A5ACD), 'bg': const Color(0xFFF0EEFF)},
      {'icon': Icons.description, 'label': '---------', 'color': const Color(0xFF4CAF50), 'bg': const Color(0xFFE8F5E9)},
      {'icon': Icons.star, 'label': '---------', 'color': const Color(0xFFFF9800), 'bg': const Color(0xFFFFF3E0)},
      {'icon': Icons.notifications, 'label': '---------', 'color': const Color(0xFF2196F3), 'bg': const Color(0xFFE3F2FD)},
      {'icon': Icons.security, 'label': '---------', 'color': const Color(0xFF9C27B0), 'bg': const Color(0xFFF3E5F5)},
      {'icon': Icons.settings, 'label': '---------', 'color': const Color(0xFF607D8B), 'bg': const Color(0xFFECEFF1)},
      {'icon': Icons.help_outline, 'label': '---------', 'color': const Color(0xFFFF5722), 'bg': const Color(0xFFFBE9E7)},
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFF6A5ACD), Color(0xFF4CAF50)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    ' ',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Text(
                  '---------',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  '---------',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    color: Color(0xFF777777),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    '✓ Verificado',
                    style: TextStyle(
                      color: Color(0xFF388E3C),
                      fontFamily: 'Inter',
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Stats Row
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFEEEEEE)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: const [
                      Text('%%%%', style: TextStyle(fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF6A5ACD))),
                      Text('---------', style: TextStyle(fontFamily: 'Inter', fontSize: 10, color: Color(0xFF777777))),
                    ],
                  ),
                ),
                Container(width: 1, height: 24, color: const Color(0xFFEEEEEE)),
                Expanded(
                  child: Column(
                    children: const [
                      Text('R\$ %%%%', style: TextStyle(fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF4CAF50))),
                      Text('---------', style: TextStyle(fontFamily: 'Inter', fontSize: 10, color: Color(0xFF777777))),
                    ],
                  ),
                ),
                Container(width: 1, height: 24, color: const Color(0xFFEEEEEE)),
                Expanded(
                  child: Column(
                    children: const [
                      Text('%%%%', style: TextStyle(fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFFFF9800))),
                      Text('---------', style: TextStyle(fontFamily: 'Inter', fontSize: 10, color: Color(0xFF777777))),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Menu
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFEEEEEE)),
            ),
            child: Column(
              children: menuItems.asMap().entries.map((entry) {
                final idx = entry.key;
                final item = entry.value;
                return Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      borderRadius: idx == 0 
                        ? const BorderRadius.vertical(top: Radius.circular(16))
                        : (idx == menuItems.length - 1 ? const BorderRadius.vertical(bottom: Radius.circular(16)) : BorderRadius.zero),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        child: Row(
                          children: [
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                color: item['bg'] as Color,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              alignment: Alignment.center,
                              child: Icon(item['icon'] as IconData, size: 18, color: item['color'] as Color),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                item['label'] as String,
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF333333),
                                ),
                              ),
                            ),
                            const Icon(Icons.chevron_right, size: 16, color: Color(0xFFCCCCCC)),
                          ],
                        ),
                      ),
                    ),
                    if (idx < menuItems.length - 1)
                      Container(height: 1, color: const Color(0xFFEEEEEE)),
                  ],
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 16),

          // Logout
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFFFBE9E7),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.logout, size: 16, color: Color(0xFFFF5722)),
                    SizedBox(width: 8),
                    Text(
                      'Sair da Conta',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFF5722),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Version
          const Text(
            'MesclaInvest v1.0.0 — Simulador Educacional',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 11,
              color: Color(0xFFCCCCCC),
            ),
          ),
        ],
      ),
    );
  }
}
