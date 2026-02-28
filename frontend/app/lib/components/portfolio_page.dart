import 'package:flutter/material.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final history = [
      {'date': '00/00', 'action': '---------', 'startup': '---------', 'amount': '+%%%% ---', 'value': 'R\$ %%%%', 'type': 'buy'},
      {'date': '00/00', 'action': '---------', 'startup': '---------', 'amount': '+%%%% ---', 'value': 'R\$ %%%%', 'type': 'buy'},
      {'date': '00/00', 'action': '---------', 'startup': '---------', 'amount': '+%%%% ---', 'value': 'R\$ %%%%', 'type': 'buy'},
      {'date': '00/00', 'action': '---------', 'startup': '---------', 'amount': '+R\$ %%%%', 'value': 'R\$ %%%%', 'type': 'deposit'},
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          _buildTotalSummaryCard(),
          const SizedBox(height: 16),
          _buildChartPlaceholder(),
          const SizedBox(height: 16),
          _buildTransactionHistory(history),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Meu Portfólio',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Color(0xFF333333),
            ),
          ),
          Text(
            'Visão geral dos seus tokens',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              color: Color(0xFF777777),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalSummaryCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'VALOR TOTAL DA CARTEIRA',
                    style: TextStyle(
                      color: Color(0xFF777777),
                      fontFamily: 'Inter',
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Text(
                    'R\$ %%%%',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF333333),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
                child: Center(
                  child: Text(
                    'imag',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 10,
                      color: Color(0xFF777777),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(height: 1, color: const Color(0xFFEEEEEE)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSummaryParam('Investido', 'R\$ %%%%', const Color(0xFF333333)),
              _buildSummaryParam('P&L', 'R\$ %%%%', const Color(0xFF4CAF50)),
              _buildSummaryParam('Posições', '%%%%', const Color(0xFF333333)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryParam(String label, String value, Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFF777777), fontFamily: 'Inter', fontSize: 11)),
        Text(value, style: TextStyle(fontFamily: 'Inter', fontSize: 14, fontWeight: FontWeight.w700, color: valueColor)),
      ],
    );
  }

  Widget _buildChartPlaceholder() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Distribuição',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFEEEEEE), width: 24),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Gráfico',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  color: Color(0xFF777777),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionHistory(List<Map<String, String>> history) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Histórico de Transações',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 12),
          Column(
            children: history.map(_buildHistoryItem).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryItem(Map<String, String> h) {
    final isBuy = h['type'] == 'buy';
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          const SizedBox(
            width: 36,
            height: 36,
            child: Center(
              child: Text(
                'imag',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 10,
                  color: Color(0xFF777777),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${h['action']} — ${h['startup']}',
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
                Text(
                  h['date']!,
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
                h['amount']!,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: isBuy ? const Color(0xFF4CAF50) : const Color(0xFF6A5ACD),
                ),
              ),
              Text(
                h['value']!,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 11,
                  color: Color(0xFF777777),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
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
    );
  }
}
