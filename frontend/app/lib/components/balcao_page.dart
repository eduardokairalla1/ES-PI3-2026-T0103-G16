import 'package:flutter/material.dart';

class BalcaoPage extends StatefulWidget {
  const BalcaoPage({super.key});

  @override
  State<BalcaoPage> createState() => _BalcaoPageState();
}

class _BalcaoPageState extends State<BalcaoPage> {
  String tab = 'mercado';
  String search = '';

  final orders = [
    {"id": "1", "type": "buy", "startup": "EverTech", "symbol": "EVT", "qty": 100, "price": "R\$ 0,15", "total": "R\$ 15,00", "status": "Aberta", "emoji": "🧬"},
    {"id": "2", "type": "sell", "startup": "FinnoLab", "symbol": "FNL", "qty": 50, "price": "R\$ 0,12", "total": "R\$ 6,00", "status": "Executada", "emoji": "💳"},
    {"id": "3", "type": "buy", "startup": "MoveCity", "symbol": "MVC", "qty": 200, "price": "R\$ 0,08", "total": "R\$ 16,00", "status": "Aberta", "emoji": "🛴"},
  ];

  final market = [
    {"startup": "EverTech", "symbol": "EVT", "price": "R\$ 0,15", "change": "+2,30%", "positive": true, "emoji": "🧬", "bg": const Color(0xFFFF5722)},
    {"startup": "FinnoLab", "symbol": "FNL", "price": "R\$ 0,12", "change": "+1,56%", "positive": true, "emoji": "💳", "bg": const Color(0xFF3F51B5)},
    {"startup": "DataBrave", "symbol": "DBR", "price": "R\$ 0,10", "change": "-1,20%", "positive": false, "emoji": "📊", "bg": const Color(0xFF212121)},
    {"startup": "GreenLoop", "symbol": "GRL", "price": "R\$ 0,16", "change": "+0,43%", "positive": true, "emoji": "♻️", "bg": const Color(0xFF388E3C)},
    {"startup": "MoveCity", "symbol": "MVC", "price": "R\$ 0,08", "change": "-0,80%", "positive": false, "emoji": "🛴", "bg": const Color(0xFF00BCD4)},
  ];

  @override
  Widget build(BuildContext context) {
    final filteredMarket = market.where((m) =>
      (m['startup'] as String).toLowerCase().contains(search.toLowerCase()) ||
      (m['symbol'] as String).toLowerCase().contains(search.toLowerCase())
    ).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Balcão de Tokens',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF333333),
                  ),
                ),
                Text(
                  'Compre e venda tokens de startups',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Color(0xFF777777),
                  ),
                ),
              ],
            ),
          ),

          // Tabs
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: ['mercado', 'ordens'].map((t) {
                final isActive = tab == t;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => tab = t),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: isActive ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: isActive ? const [
                          BoxShadow(color: Color(0x14000000), blurRadius: 4, offset: Offset(0, 1))
                        ] : null,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        t == 'mercado' ? 'Mercado' : 'Minhas Ordens',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13,
                          fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                          color: isActive ? const Color(0xFF333333) : const Color(0xFF777777),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          
          const SizedBox(height: 16),

          if (tab == 'mercado') ...[
            // Search
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
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
                  const Icon(Icons.search, size: 16, color: Color(0xFFAAAAAA)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      onChanged: (val) => setState(() => search = val),
                      decoration: const InputDecoration(
                        hintText: 'Buscar startup ou token...',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13,
                          color: Color(0xFFAAAAAA),
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Market List
            ...filteredMarket.map((item) {
              final isPositive = item['positive'] as bool;
              return Container(
                margin: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFEEEEEE)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: item['bg'] as Color,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text(item['emoji'] as String, style: const TextStyle(fontSize: 20)),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['startup'] as String,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF333333),
                            ),
                          ),
                          Text(
                            item['symbol'] as String,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 11,
                              color: Color(0xFF777777),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          item['price'] as String,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF333333),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              isPositive ? Icons.trending_up : Icons.trending_down,
                              size: 11,
                              color: isPositive ? const Color(0xFF4CAF50) : const Color(0xFFFF5722),
                            ),
                            const SizedBox(width: 2),
                            Text(
                              item['change'] as String,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: isPositive ? const Color(0xFF4CAF50) : const Color(0xFFFF5722),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8F5E9),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Comprar',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF388E3C),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFBE9E7),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Vender',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFF5722),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ] else ...[
            // Orders List
            ...orders.map((order) {
              final isBuy = order['type'] == 'buy';
              final isOpen = order['status'] == 'Aberta';
              return Container(
                margin: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFEEEEEE)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: isBuy ? const Color(0xFFE8F5E9) : const Color(0xFFFBE9E7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        isBuy ? Icons.trending_up : Icons.trending_down,
                        size: 16,
                        color: isBuy ? const Color(0xFF4CAF50) : const Color(0xFFFF5722),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${isBuy ? "Comprar" : "Vender"} ${order['startup']}',
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
                                  color: isOpen ? const Color(0xFFFFF3E0) : const Color(0xFFE8F5E9),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  order['status'] as String,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: isOpen ? const Color(0xFFFF9800) : const Color(0xFF4CAF50),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${order['qty']} ${order['symbol']} @ ${order['price']} = ${order['total']}',
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              color: Color(0xFF777777),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ]
        ],
      ),
    );
  }
}
