import 'package:flutter/material.dart';

class PatrimonioSection extends StatefulWidget {
  const PatrimonioSection({super.key});

  @override
  State<PatrimonioSection> createState() => _PatrimonioSectionState();
}

class _PatrimonioSectionState extends State<PatrimonioSection> {
  bool visible = true;

  final actions = [
    {'icon': Icons.add, 'label': 'Depositar', 'primary': true},
    {'icon': Icons.trending_up, 'label': 'Comprar', 'primary': false},
    {'icon': Icons.trending_down, 'label': 'Vender', 'primary': false},
    {'icon': Icons.account_balance, 'label': 'Sacar', 'primary': false},
    {'icon': Icons.description, 'label': 'Extrato', 'primary': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 16),
      padding: const EdgeInsets.all(20),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          const Text(
            'MEU PATRIMÔNIO SIMULADO',
            style: TextStyle(
              color: Color(0xFF777777),
              fontFamily: 'Inter',
              fontSize: 11,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 6),
          // Value + Eye
          Row(
            children: [
              Text(
                visible ? 'R\$ %%%%' : 'R\$ ••••••••••',
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF333333),
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () => setState(() => visible = !visible),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    visible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                    size: 16,
                    color: const Color(0xFF777777),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          // Variation
          Row(
            children: [
              const Icon(Icons.trending_up, size: 12, color: Color(0xFF4CAF50)),
              const SizedBox(width: 6),
              const Text(
                '+R\$ %%%%',
                style: TextStyle(
                  color: Color(0xFF4CAF50),
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 6),
              const Text(
                '(+ %%%%%) hoje',
                style: TextStyle(
                  color: Color(0xFF777777),
                  fontFamily: 'Inter',
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Divider
          Container(height: 1, color: const Color(0xFFEEEEEE)),
          const SizedBox(height: 16),
          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: actions.map((action) {
              final isPrimary = action['primary'] as bool;
              final color = isPrimary ? const Color(0xFF6A5ACD) : const Color(0xFFF0EEFF);
              final iconColor = isPrimary ? Colors.white : const Color(0xFF6A5ACD);

              return Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        action['icon'] as IconData,
                        size: 16,
                        color: iconColor,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      action['label'] as String,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF555555),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
