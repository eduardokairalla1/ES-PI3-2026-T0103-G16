import 'package:flutter/material.dart';

class QuickStats extends StatelessWidget {
  const QuickStats({super.key});

  @override
  Widget build(BuildContext context) {
    const stats = [
      {'label': 'Startups', 'value': '24', 'sub': 'disponíveis', 'color': Color(0xFF6A5ACD)},
      {'label': 'Rentabilidade', 'value': '+8,4%', 'sub': 'este mês', 'color': Color(0xFF4CAF50)},
      {'label': 'Investidores', 'value': '1.2K', 'sub': 'ativos', 'color': Color(0xFFFF9800)},
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Row(
        children: stats.map((s) => Expanded(
          child: Container(
            margin: EdgeInsets.only(
              left: s == stats.first ? 0 : 6,
              right: s == stats.last ? 0 : 6
            ),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFEEEEEE)),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0A000000),
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  s['value'] as String,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: s['color'] as Color,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  s['label'] as String,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF777777),
                  ),
                ),
                Text(
                  s['sub'] as String,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 9,
                    color: Color(0xFFAAAAAA),
                  ),
                ),
              ],
            ),
          ),
        )).toList(),
      ),
    );
  }
}
