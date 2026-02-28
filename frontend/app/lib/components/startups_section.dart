import 'package:flutter/material.dart';

class Startup {
  final String id;
  final String name;
  final String stage;
  final String description;
  final String tokensEmitidos;
  final String capitalCaptado;
  final String symbol;
  final Color bgColor;
  final Color textColor;
  final String emoji;

  Startup({
    required this.id,
    required this.name,
    required this.stage,
    required this.description,
    required this.tokensEmitidos,
    required this.capitalCaptado,
    required this.symbol,
    required this.bgColor,
    required this.textColor,
    required this.emoji,
  });
}

class StartupsSection extends StatefulWidget {
  final Function(String)? onViewDetails;

  const StartupsSection({super.key, this.onViewDetails});

  @override
  State<StartupsSection> createState() => _StartupsSectionState();
}

class _StartupsSectionState extends State<StartupsSection> {
  String activeFilter = 'Todas';

  final filters = ['Todas', 'Nova', 'Em Operação', 'Em Expansão'];

  final startups = [
    Startup(
      id: "1",
      name: "---------",
      stage: "Nova",
      description: "---------",
      tokensEmitidos: "%%%%",
      capitalCaptado: "R\$ %%%%",
      symbol: "---",
      bgColor: const Color(0xFFFF5722),
      textColor: Colors.white,
      emoji: " ",
    ),
    Startup(
      id: "2",
      name: "---------",
      stage: "Em Operação",
      description: "---------",
      tokensEmitidos: "%%%%",
      capitalCaptado: "R\$ %%%%",
      symbol: "---",
      bgColor: const Color(0xFF4CAF50),
      textColor: Colors.white,
      emoji: " ",
    ),
    Startup(
      id: "3",
      name: "---------",
      stage: "Em Operação",
      description: "---------",
      tokensEmitidos: "%%%%",
      capitalCaptado: "R\$ %%%%",
      symbol: "---",
      bgColor: const Color(0xFF3F51B5),
      textColor: Colors.white,
      emoji: " ",
    ),
    Startup(
      id: "4",
      name: "---------",
      stage: "Em Expansão",
      description: "---------",
      tokensEmitidos: "%%%%",
      capitalCaptado: "R\$ %%%%",
      symbol: "---",
      bgColor: const Color(0xFF212121),
      textColor: Colors.white,
      emoji: " ",
    ),
    Startup(
      id: "5",
      name: "---------",
      stage: "Nova",
      description: "---------",
      tokensEmitidos: "%%%%",
      capitalCaptado: "R\$ %%%%",
      symbol: "---",
      bgColor: const Color(0xFF00BCD4),
      textColor: Colors.white,
      emoji: " ",
    ),
    Startup(
      id: "6",
      name: "---------",
      stage: "Em Expansão",
      description: "---------",
      tokensEmitidos: "%%%%",
      capitalCaptado: "R\$ %%%%",
      symbol: "---",
      bgColor: const Color(0xFF388E3C),
      textColor: Colors.white,
      emoji: " ",
    ),
  ];

  final stageBadge = {
    'Nova': {'bg': const Color(0xFFFFF3E0), 'text': const Color(0xFFFF5722)},
    'Em Operação': {'bg': const Color(0xFFE8F5E9), 'text': const Color(0xFF388E3C)},
    'Em Expansão': {'bg': const Color(0xFFEDE7F6), 'text': const Color(0xFF6A5ACD)},
  };

  @override
  Widget build(BuildContext context) {
    final filtered = activeFilter == 'Todas'
        ? startups
        : startups.where((s) => s.stage == activeFilter).toList();

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
                'Startups do Ecossistema',
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
          // Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: filters.map((f) {
                final isActive = activeFilter == f;
                return GestureDetector(
                  onTap: () => setState(() => activeFilter = f),
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: isActive ? const Color(0xFF6A5ACD) : const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      f,
                      style: TextStyle(
                        color: isActive ? Colors.white : const Color(0xFF555555),
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 12),
          // Startup Cards
          Column(
            children: filtered.map((startup) {
              final badgeStyle = stageBadge[startup.stage]!;
              return Container(
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
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Avatar
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: startup.bgColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            startup.emoji,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    startup.name,
                                    style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF333333),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: badgeStyle['bg'],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      startup.stage,
                                      style: TextStyle(
                                        color: badgeStyle['text'],
                                        fontFamily: 'Inter',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Text(
                                startup.description,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  color: Color(0xFF777777),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.more_horiz, size: 16, color: Color(0xFFCCCCCC)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Stats
                    Container(height: 1, color: const Color(0xFFEEEEEE)),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Tokens Emitidos',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 10,
                                color: Color(0xFF777777),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              startup.tokensEmitidos,
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                color: Color(0xFF333333),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Capital Captado',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 10,
                                color: Color(0xFF777777),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              startup.capitalCaptado,
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                color: Color(0xFF333333),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => widget.onViewDetails?.call(startup.id),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF0EEFF),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'Ver Detalhes',
                              style: TextStyle(
                                color: Color(0xFF6A5ACD),
                                fontFamily: 'Inter',
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
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
