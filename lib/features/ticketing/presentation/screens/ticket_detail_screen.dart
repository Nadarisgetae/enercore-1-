import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TicketsDetailScreen extends StatefulWidget {
  const TicketsDetailScreen({super.key});

  @override
  State<TicketsDetailScreen> createState() => _TicketsDetailScreenState();
}

class _TicketsDetailScreenState extends State<TicketsDetailScreen> {
  int _selectedNav = 4; // Tickets tab active

  // Premium Design System
  static const _bg = Color(0xFFF4F6F8);
  static const _card = Colors.white;
  static const _cardBorder = Color(0xFFE5E7EB);
  static const _teal = Color(0xFF2A8C6E); // primary brand green-teal
  static const _slateDark = Color(0xFF1E293B);
  static const _slateLight = Color(0xFF64748B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: Column(
          children: [
            _topBar(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _breadcrumbs(),
                      const SizedBox(height: 8),
                      const Text(
                        'Inverter Efficiency Drop',
                        style: TextStyle(
                          color: _slateDark,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.4,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          _badgeChip('In Progress', const Color(0xFFD1FAE5), _teal, isDot: true),
                          const SizedBox(width: 10),
                          Row(
                            children: const [
                              Icon(Icons.calendar_month_outlined, color: _slateLight, size: 14),
                              SizedBox(width: 4),
                              Text(
                                'Created Oct 24, 2025',
                                style: TextStyle(color: _slateLight, fontSize: 11, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          Icon(Icons.warning_amber_rounded, color: Color(0xFFEF4444), size: 14),
                          SizedBox(width: 4),
                          Text(
                            'High Priority',
                            style: TextStyle(color: _slateLight, fontSize: 11, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _actionButtonsRow(),
                      const SizedBox(height: 20),
                      _conversationBox(),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            ),
            _bottomNav(),
          ],
        ),
      ),
    );
  }

  // ── Top Bar ────────────────────────────────────────────────────────────────
  Widget _topBar() {
    return Container(
      height: 56,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: _cardBorder, width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: const Icon(Icons.arrow_back_rounded, color: _slateDark, size: 22),
          ),
          const SizedBox(width: 12),
          Image.asset(
            'assets/images/logo.png',
            height: 24,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 8),
          const Text(
            'Enercore',
            style: TextStyle(
              color: _teal,
              fontSize: 16,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.3,
            ),
          ),
          const Spacer(),
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=80&fit=crop&q=80'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Breadcrumbs ────────────────────────────────────────────────────────────
  Widget _breadcrumbs() {
    return Row(
      children: [
        GestureDetector(
          onTap: () => context.go('/tickets'),
          child: const Text(
            'Tickets',
            style: TextStyle(color: _slateLight, fontSize: 11.5, fontWeight: FontWeight.w600),
          ),
        ),
        const Text('  >  ', style: TextStyle(color: _slateLight, fontSize: 11.5)),
        const Text(
          '#TKT-1042',
          style: TextStyle(color: _teal, fontSize: 11.5, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  Widget _badgeChip(String text, Color bg, Color textCol, {bool isDot = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          if (isDot) ...[
            Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(color: textCol, shape: BoxShape.circle),
            ),
            const SizedBox(width: 5),
          ],
          Text(
            text,
            style: TextStyle(
              color: textCol,
              fontSize: 10,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  // ── Share & Update Status Row ──────────────────────────────────────────────
  Widget _actionButtonsRow() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: _teal, width: 1.2),
            ),
            child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.share_outlined, color: _teal, size: 16),
                  SizedBox(width: 8),
                  Text('Share', style: TextStyle(color: _teal, fontSize: 12, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: SizedBox(
            height: 40,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: _teal,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {},
              icon: const Icon(Icons.edit_note_rounded, size: 18),
              label: const Text('Update Status', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
            ),
          ),
        ),
      ],
    );
  }

  // ── Conversation Card ──────────────────────────────────────────────────────
  Widget _conversationBox() {
    return _card_(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'CONVERSATION',
            style: TextStyle(color: _slateLight, fontSize: 9.5, fontWeight: FontWeight.w800, letterSpacing: 0.5),
          ),
          const SizedBox(height: 16),
          // Agent Chat Bubble
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: _teal,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    'A',
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        "We've detected a voltage surge on inverter 02. Checking logs to identify the root cause of the efficiency drop.",
                        style: TextStyle(
                          color: _slateDark,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Support Agent • 11:42 AM',
                      style: TextStyle(color: _slateLight, fontSize: 9.5, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          // User Chat Bubble
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _teal,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Attached the error log from the telemetry dashboard. It seems the surge occurred during peak thermal activity.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'You • 11:48 AM',
                      style: TextStyle(color: _slateLight, fontSize: 9.5, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: Color(0xFFE2E8F0),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person_rounded, color: _slateLight, size: 16),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Type input row
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: _cardBorder, width: 1),
            ),
            child: Row(
              children: [
                const Icon(Icons.attach_file_rounded, color: _slateLight, size: 18),
                const SizedBox(width: 8),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      hintStyle: TextStyle(color: _slateLight, fontSize: 12, fontWeight: FontWeight.w500),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: _teal,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.send_rounded, color: Colors.white, size: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Bottom Nav ─────────────────────────────────────────────────────────────
  Widget _bottomNav() {
    final items = [
      (Icons.home_rounded, 'Home'),
      (Icons.solar_power_rounded, 'Plants'),
      (Icons.sensors_rounded, 'Telemetry'),
      (Icons.receipt_long_rounded, 'Billing'),
      (Icons.confirmation_number_outlined, 'Tickets'),
      (Icons.person_outline_rounded, 'Profile'),
    ];
    final routes = ['/client-dashboard', '/solar-grid', '/telemetry', '/billing', null, '/profile'];
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: _cardBorder, width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (i) {
          final active = _selectedNav == i;
          return GestureDetector(
            onTap: () {
              if (routes[i] != null) {
                context.push(routes[i]!);
              } else {
                setState(() => _selectedNav = i);
              }
            },
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    items[i].$1,
                    color: active ? _teal : _slateLight.withValues(alpha: 0.6),
                    size: 20,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    items[i].$2,
                    style: TextStyle(
                      color: active ? _teal : _slateLight.withValues(alpha: 0.7),
                      fontSize: 9,
                      fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  // ── Card helper ────────────────────────────────────────────────────────────
  Widget _card_({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _cardBorder, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}