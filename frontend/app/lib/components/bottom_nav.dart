import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final String activeTab;
  final Function(String) onChange;

  const BottomNav({
    super.key,
    required this.activeTab,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    final navItems = [
      {'id': 'home', 'label': 'Home', 'icon': Icons.home_outlined, 'activeIcon': Icons.home},
      {'id': 'portfolio', 'label': 'Portfólio', 'icon': Icons.pie_chart_outline, 'activeIcon': Icons.pie_chart},
      {'id': 'balcao', 'label': 'Balcão', 'icon': Icons.swap_horiz_outlined, 'activeIcon': Icons.swap_horiz},
      {'id': 'perfil', 'label': 'Perfil', 'icon': Icons.person_outline, 'activeIcon': Icons.person},
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFEEEEEE))),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + 12,
        top: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: navItems.map((item) {
          final id = item['id'] as String;
          final isActive = activeTab == id;
          final color = isActive ? const Color(0xFF6A5ACD) : const Color(0xFFAAAAAA);
          
          return GestureDetector(
            onTap: () => onChange(id),
            behavior: HitTestBehavior.opaque,
            child: SizedBox(
              width: 70,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isActive ? item['activeIcon'] as IconData : item['icon'] as IconData,
                        size: 24,
                        color: color,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item['label'] as String,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 10,
                          fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                          color: color,
                        ),
                      ),
                    ],
                  ),
                  if (isActive)
                    Positioned(
                      top: -12,
                      child: Container(
                        width: 32,
                        height: 2,
                        decoration: BoxDecoration(
                          color: const Color(0xFF6A5ACD),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  if (id == 'portfolio')
                    Positioned(
                      top: -2,
                      right: 14,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFF5722),
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          '3',
                          style: TextStyle(
                            fontSize: 9,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
