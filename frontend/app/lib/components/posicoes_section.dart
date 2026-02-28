import 'package:flutter/material.dart';

class TokenPosition {
  final String id;
  final String startup;
  final String symbol;
  final String quantidade;
  final String valorAtual;
  final String variacaoDiaria;
  final String emoji;
  final Color bgColor;

  TokenPosition({
    required this.id,
    required this.startup,
    required this.symbol,
    required this.quantidade,
    required this.valorAtual,
    required this.variacaoDiaria,
    required this.emoji,
    required this.bgColor,
  });
}

class PosicoesSection extends StatelessWidget {
  final Function(String)? onViewDashboard;

  const PosicoesSection({super.key, this.onViewDashboard});

  @override
  Widget build(BuildContext context) {
    final positions = [
      TokenPosition(
        id: "1",
        startup: "---------",
        symbol: "---",
        quantidade: "%%%%",
        valorAtual: "%%%%",
        variacaoDiaria: "%%%%",
        emoji: " ",
        bgColor: const Color(0xFF3F51B5),
      ),
      TokenPosition(
        id: "2",
        startup: "---------",
        symbol: "---",
        quantidade: "%%%%",
        valorAtual: "%%%%",
        variacaoDiaria: "%%%%",
        emoji: " ",
        bgColor: const Color(0xFF212121),
      ),
      TokenPosition(
        id: "3",
        startup: "---------",
        symbol: "---",
        quantidade: "%%%%",
        valorAtual: "%%%%",
        variacaoDiaria: "%%%%",
        emoji: " ",
        bgColor: const Color(0xFF388E3C),
      ),
    ];

    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Meus Investimentos',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF333333),
                ),
              ),
              Row(
                children: const [
                  Text(
                    'Ver todas',
                    style: TextStyle(
                      color: Color(0xFF6A5ACD),
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 2),
                  Icon(Icons.chevron_right, size: 14, color: Color(0xFF6A5ACD)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Cards
          Column(
            children: positions.map((pos) {
              final isPositive = true;
              final varColor = isPositive ? const Color(0xFF4CAF50) : const Color(0xFFFF5722);

              return GestureDetector(
                onTap: () => onViewDashboard?.call(pos.id),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
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
                  child: Row(
                    children: [
                      // Avatar
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: pos.bgColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          pos.emoji,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Info
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  pos.startup,
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF333333),
                                  ),
                                ),
                                Text(
                                  '${pos.quantidade} ${pos.symbol}',
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    color: Color(0xFF777777),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'R\$ ${pos.valorAtual}',
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF333333),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Row(
                                  children: [
                                    Icon(
                                      isPositive ? Icons.trending_up : Icons.trending_down,
                                      size: 12,
                                      color: varColor,
                                    ),
                                    const SizedBox(width: 2),
                                    Text(
                                      '${isPositive ? '+' : ''}${pos.variacaoDiaria}%',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: varColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.chevron_right, size: 18, color: Color(0xFFCCCCCC)),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
