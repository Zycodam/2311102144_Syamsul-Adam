import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

// --- KELAS UTAMA (RANGKA NAVIGASI) ---
class AdminPPKPage extends StatefulWidget {
  const AdminPPKPage({super.key});

  @override
  State<AdminPPKPage> createState() => _AdminPPKPageState();
}

class _AdminPPKPageState extends State<AdminPPKPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF184F61);

    // Menambahkan halaman profil ke dalam list navigasi
    final List<Widget> _pages = [
      const AdminDashboardContent(), 
      const ArsipPBJPage(),
      const AddArchivePage(), 
      const ProfileContentPage(), // <-- TAMBAHAN: Halaman Konten Akun
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        // TAMBAHAN: Item Akun di footbar
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_rounded), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.archive_rounded), label: 'Arsip PBJ'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_rounded), label: 'Tambah'),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Akun'), // <-- MENU BARU
        ],
      ),
    );
  }
}

// --- KELAS KONTEN DASHBOARD ---
class AdminDashboardContent extends StatefulWidget {
  const AdminDashboardContent({super.key});

  @override
  State<AdminDashboardContent> createState() => _AdminDashboardContentState();
}

class _AdminDashboardContentState extends State<AdminDashboardContent> {
  String _selectedYear = '2024';
  String _selectedUnit = 'Semua Unit';
  final List<String> _years = ['2024', '2023', '2022', '2021', '2020'];
  final List<String> _units = [
    'Semua Unit', 'Fakultas Teknik', 'Fakultas Ekonomi dan Bisnis', 'Fakultas Hukum',
    'Fakultas Ilmu Sosial dan Politik', 'Fakultas Pertanian', 'Fakultas Peternakan',
    'Fakultas Kedokteran', 'Fakultas Perikanan dan Ilmu Kelautan',
    'Fakultas Ilmu-ilmu Kesehatan', 'Fakultas Matematika dan Ilmu Pengetahuan Alam',
  ];

  double valPerencanaan = 0, valPemilihan = 0, valPelaksanaan = 0, valSelesai = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          valPerencanaan = 25; valPemilihan = 15; valPelaksanaan = 20; valSelesai = 40;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF184F61);
    const accentColor = Color(0xFFF6C100);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 25),
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Row(
              children: [
                Image.asset('assets/image/logo.png', height: 55),
                const SizedBox(width: 15),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SIAPABAJA",
                        style: TextStyle(
                          color: Color(0xFFF6C100), 
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Sistem Informasi Arsip Pengadaan Barang dan Jasa",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1.6,
                  children: [
                    _buildWebStatCard("Total Arsip", "7", Colors.blue, Icons.description),
                    _buildWebStatCard("Arsip Publik", "5", Colors.green, Icons.visibility),
                    _buildWebStatCard("Arsip Private", "2", Colors.blueGrey, Icons.visibility_off),
                    _buildWebStatCard("Total Unit Kerja", "27", accentColor, Icons.business),
                  ],
                ),
                const SizedBox(height: 15),
                _buildTotalPaketCard(primaryColor),
                const SizedBox(height: 15),
                _buildTotalNilaiCard(primaryColor, accentColor),
                const SizedBox(height: 25),
                _buildWhiteContainer(
                  title: "Statistika",
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [_buildYearDropdown(), const SizedBox(width: 10), _buildUnitDropdown()],
                      ),
                      const SizedBox(height: 30),
                      _buildPieChart(primaryColor, accentColor),
                      const SizedBox(height: 20),
                      _buildLegendGrid(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _buildWhiteContainer(
                  title: "Statistika Metode",
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [_buildYearDropdown(), const SizedBox(width: 10), _buildUnitDropdown()],
                      ),
                      const SizedBox(height: 40),
                      _buildBarChart(accentColor),
                      const SizedBox(height: 15),
                      const Text("Metode Pengadaan", style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalPaketCard(Color primaryColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border(left: BorderSide(color: primaryColor, width: 5)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total Paket Pengadaan", style: TextStyle(color: Color(0xFF64748B), fontSize: 13)),
              Icon(Icons.description, color: Colors.blueGrey.shade400, size: 24),
            ],
          ),
          const SizedBox(height: 5),
          Text("7", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: primaryColor)),
          const Text("Paket Pengadaan Barang dan Jasa", style: TextStyle(color: Colors.grey, fontSize: 11)),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [_buildYearDropdown(), const SizedBox(width: 8), _buildUnitDropdown()],
          ),
        ],
      ),
    );
  }

  Widget _buildTotalNilaiCard(Color primaryColor, Color accentColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border(left: BorderSide(color: accentColor, width: 5)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total Nilai Pengadaan", style: TextStyle(color: Colors.grey, fontSize: 13)),
              Icon(Icons.payments_outlined, color: accentColor, size: 28),
            ],
          ),
          const SizedBox(height: 10),
          Text("Rp 1.200.000.000", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: primaryColor)),
          const Text("Nilai Kontrak Pengadaan", style: TextStyle(color: Colors.grey, fontSize: 11)),
          const Divider(height: 30),
          Row(
            children: [_buildYearDropdown(), const SizedBox(width: 10), _buildUnitDropdown()],
          )
        ],
      ),
    );
  }

  Widget _buildYearDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade300)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedYear,
          icon: const Icon(Icons.arrow_drop_down, size: 16),
          style: const TextStyle(fontSize: 11, color: Colors.black87),
          onChanged: (val) => setState(() => _selectedYear = val!),
          items: _years.map((val) => DropdownMenuItem(value: val, child: Text(val))).toList(),
        ),
      ),
    );
  }

  Widget _buildUnitDropdown() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 150),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade300)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedUnit,
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down, size: 16),
          style: const TextStyle(fontSize: 11, color: Colors.black87),
          onChanged: (val) => setState(() => _selectedUnit = val!),
          items: _units.map((val) => DropdownMenuItem(value: val, child: Text(val, overflow: TextOverflow.ellipsis))).toList(),
        ),
      ),
    );
  }

  Widget _buildWebStatCard(String label, String value, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border(left: BorderSide(color: color, width: 4)), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 5)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)), Icon(icon, size: 14, color: color.withOpacity(0.5))]),
          const SizedBox(height: 5),
          Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildWhiteContainer({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: const Color(0xFFE6EEF2))),
      child: Column(children: [Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), const Divider(height: 30), child]),
    );
  }

  Widget _buildPieChart(Color primaryColor, Color accentColor) {
    return SizedBox(
      height: 180,
      child: PieChart(
        PieChartData(
          startDegreeOffset: 270,
          sectionsSpace: 0,
          centerSpaceRadius: 50,
          sections: [
            PieChartSectionData(color: primaryColor, value: valPerencanaan, radius: 20, showTitle: false),
            PieChartSectionData(color: Colors.black, value: valPemilihan, radius: 20, showTitle: false),
            PieChartSectionData(color: accentColor, value: valPelaksanaan, radius: 20, showTitle: false),
            PieChartSectionData(color: const Color(0xFFE5C185), value: valSelesai, radius: 20, showTitle: false),
          ],
        ),
      ),
    );
  }

  Widget _buildBarChart(Color accentColor) {
    return SizedBox(
      height: 220,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 100,
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  const style = TextStyle(color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold);
                  String text;
                  switch (value.toInt()) {
                    case 0: text = 'PL'; break;
                    case 1: text = 'PenL'; break;
                    case 2: text = 'E-C'; break;
                    case 3: text = 'TT'; break;
                    case 4: text = 'TB'; break;
                    case 5: text = 'Swa'; break;
                    default: text = ''; break;
                  }
                  return Padding(padding: const EdgeInsets.only(top: 10), child: Text(text, style: style));
                },
              ),
            ),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 30, interval: 20)),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          gridData: const FlGridData(show: true, drawVerticalLine: false),
          borderData: FlBorderData(show: false),
          barGroups: [
            _makeBarGroup(0, 35, accentColor),
            _makeBarGroup(1, 90, accentColor),
            _makeBarGroup(2, 68, accentColor),
            _makeBarGroup(3, 50, accentColor),
            _makeBarGroup(4, 78, accentColor),
            _makeBarGroup(5, 25, accentColor),
          ],
        ),
      ),
    );
  }

  BarChartGroupData _makeBarGroup(int x, double y, Color color) {
    return BarChartGroupData(x: x, barRods: [BarChartRodData(toY: y, color: color, width: 18, borderRadius: const BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4)))]);
  }

  Widget _buildLegendGrid() {
    return Wrap(spacing: 15, runSpacing: 10, alignment: WrapAlignment.center, children: [
      _legendItem(const Color(0xFF184F61), "Perencanaan"),
      _legendItem(Colors.black, "Pemilihan"),
      _legendItem(const Color(0xFFF6C100), "Pelaksanaan"),
      _legendItem(const Color(0xFFE5C185), "Selesai"),
    ]);
  }

  Widget _legendItem(Color color, String text) {
    return Row(mainAxisSize: MainAxisSize.min, children: [Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)), const SizedBox(width: 6), Text(text, style: const TextStyle(fontSize: 11, color: Colors.grey))]);
  }
}

// --- KELAS KONTEN ARSIP PBJ ---
class ArsipPBJPage extends StatefulWidget {
  const ArsipPBJPage({super.key});

  @override
  State<ArsipPBJPage> createState() => _ArsipPBJPageState();
}

class _ArsipPBJPageState extends State<ArsipPBJPage> {
  List<Map<String, String>> allData = [
    {"tahun": "2024", "unit": "Fakultas Teknik", "pekerjaan": "Pengadaan Laboratorium Komputer Terpadu | RUP-2026-001-FT", "nilai": "Rp. 100.866.549.000,00", "status": "Perencanaan"},
    {"tahun": "2024", "unit": "Fakultas Hukum", "pekerjaan": "Renovasi Gedung Utama | RUP-2026-002-FH", "nilai": "Rp. 50.000.000.000,00", "status": "Selesai"},
    {"tahun": "2024", "unit": "Fakultas Teknik", "pekerjaan": "Pengadaan Laboratorium Komputer Terpadu | RUP-2026-001-FT", "nilai": "Rp. 100.866.549.000,00", "status": "Perencanaan"},
    {"tahun": "2024", "unit": "Fakultas Hukum", "pekerjaan": "Renovasi Gedung Utama | RUP-2026-002-FH", "nilai": "Rp. 50.000.000.000,00", "status": "Selesai"},
  ];

  String _selectedUnit = 'Semua Unit';
  String _selectedYear = 'Tahun';
  String _selectedStatus = 'Status';

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF184F61);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 25),
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Row(
                children: [
                  Image.asset('assets/image/logo.png', height: 55),
                  const SizedBox(width: 15),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "SIAPABAJA",
                          style: TextStyle(
                            color: Color(0xFFF6C100),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Sistem Informasi Arsip Pengadaan Barang dan Jasa",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  _buildSearchFilter(),
                  const SizedBox(height: 20),
                  _buildDataTable(primaryColor),
                  const SizedBox(height: 20),
                  _buildExportButton(primaryColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchFilter() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey.shade200), borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          TextField(decoration: InputDecoration(hintText: "Cari data...", prefixIcon: const Icon(Icons.search), border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), contentPadding: const EdgeInsets.symmetric(vertical: 0))),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildMiniDropdown("Semua Unit", ['Semua Unit', 'Fakultas Teknik', 'Fakultas Hukum'], (val) => setState(() => _selectedUnit = val!)),
              const SizedBox(width: 8),
              _buildMiniDropdown("Tahun", ['Tahun', '2024', '2023'], (val) => setState(() => _selectedYear = val!)),
              const SizedBox(width: 8),
              _buildMiniDropdown("Status", ['Status', 'Perencanaan', 'Selesai'], (val) => setState(() => _selectedStatus = val!)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDataTable(Color primaryColor) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade200), borderRadius: BorderRadius.circular(8)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: MaterialStateProperty.all(primaryColor),
          columns: const [
            DataColumn(label: Text('Tahun', style: TextStyle(color: Colors.white))),
            DataColumn(label: Text('Unit', style: TextStyle(color: Colors.white))),
            DataColumn(label: Text('Pekerjaan', style: TextStyle(color: Colors.white))),
            DataColumn(label: Text('Status', style: TextStyle(color: Colors.white))),
            DataColumn(label: Text('Aksi', style: TextStyle(color: Colors.white))),
          ],
          rows: allData.map((data) => DataRow(cells: [
            DataCell(Text(data['tahun']!)),
            DataCell(Text(data['unit']!)),
            DataCell(SizedBox(width: 150, child: Text(data['pekerjaan']!, overflow: TextOverflow.ellipsis))),
            DataCell(_buildStatusBadge(data['status']!)),
            DataCell(Row(
              children: [
                IconButton(icon: const Icon(Icons.info_outline, color: Colors.blue), onPressed: () => _showDetailPengadaan(context, data)),
                IconButton(icon: const Icon(Icons.edit_outlined, color: Colors.orange), onPressed: () {}),
                IconButton(icon: const Icon(Icons.delete_outline, color: Colors.red), onPressed: () => setState(() => allData.remove(data))),
              ],
            )),
          ])).toList(),
        ),
      ),
    );
  }

  void _showDetailPengadaan(BuildContext context, Map<String, String> data) {
    const primaryColor = Color(0xFF184F61);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: const BoxDecoration(color: Color(0xFFF8FAFC), borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        child: Column(
          children: [
            Container(margin: const EdgeInsets.symmetric(vertical: 10), height: 5, width: 40, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: [IconButton(icon: const Icon(Icons.arrow_back_ios, size: 18), onPressed: () => Navigator.pop(context)), const Text("Kembali", style: TextStyle(fontWeight: FontWeight.bold))]),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data['pekerjaan']!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor)),
                      const Divider(height: 30),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 2.5,
                        children: [
                          _buildInfoItem(Icons.business_center, "Unit Kerja", data['unit']!),
                          _buildInfoItem(Icons.calendar_today, "Tahun", data['tahun']!),
                          _buildInfoItem(Icons.assignment_ind, "ID RUP", "2026"),
                          _buildInfoItem(Icons.account_balance_wallet, "Metode Pengadaan", "E-Purchasing"),
                          _buildInfoItem(Icons.person, "Nama Rekanan", "PT JADI KAYA BERSAMA"),
                          _buildInfoItem(Icons.layers, "Jenis Pengadaan", "Tender"),
                        ],
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        "Informasi Anggaran",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF184F61)),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          _buildBudgetCard("Pagu Anggaran", "Rp 500.000.000"),
                          const SizedBox(width: 12),
                          _buildBudgetCard("HPS", "Rp 480.000.000"),
                          const SizedBox(width: 12),
                          _buildBudgetCard("Nilai Kontrak", data['nilai']!),
                        ],
                      ),
                      const SizedBox(height: 25),
                      const Text("Dokumen", style: TextStyle(fontWeight: FontWeight.bold)),
                      _buildDocumentItem("RUP"),
                      _buildDocumentItem("Kontrak Selesai"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Row(children: [
      Icon(icon, size: 18, color: const Color(0xFF184F61)),
      const SizedBox(width: 10),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)), Text(value, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold))])),
    ]);
  }

  Widget _buildBudgetCard(String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF184F61)), overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentItem(String title) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade200), borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 12)),
          ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF184F61)), child: const Text("Unduh", style: TextStyle(color: Colors.white, fontSize: 10))),
        ],
      ),
    );
  }

  Widget _buildExportButton(Color color) {
    return SizedBox(width: double.infinity, height: 45, child: ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.download, color: Colors.white), label: const Text("Ekspor Excel", style: TextStyle(color: Colors.white)), style: ElevatedButton.styleFrom(backgroundColor: color)));
  }

  Widget _buildMiniDropdown(String hint, List<String> items, Function(String?) onChange) {
    return Expanded(child: Container(padding: const EdgeInsets.symmetric(horizontal: 8), decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(6)), child: DropdownButtonHideUnderline(child: DropdownButton<String>(isExpanded: true, hint: Text(hint, style: const TextStyle(fontSize: 11)), items: items.map((e) => DropdownMenuItem(value: e, child: Text(e, style: const TextStyle(fontSize: 11)))).toList(), onChanged: onChange))));
  }

  Widget _buildStatusBadge(String status) {
    Color bg = status == 'Selesai' ? Colors.green.shade100 : Colors.yellow.shade100;
    return Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(5)), child: Text(status, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)));
  }
}

// --- KELAS KONTEN TAMBAH ARSIP (STEPPER FORM) ---
class AddArchivePage extends StatefulWidget {
  const AddArchivePage({super.key});

  @override
  State<AddArchivePage> createState() => _AddArchivePageState();
}

class _AddArchivePageState extends State<AddArchivePage> {
  int currentStep = 1;
  String selectedStatus = "Publik";

  String? selectedUnit;
  final List<String> daftarUnit = [
    "Dinas Pendidikan",
    "Dinas Kesehatan",
    "Dinas Pekerjaan Umum",
    "Dinas Komunikasi dan Informatika"
  ];

  String? selectedJobStatus;
  final List<String> daftarStatusPekerjaan = [
    "Selesai",
    "Dalam Proses",
    "Verifikasi",
    "Ditunda"
  ];

  String? selectedFundingSource;
  final List<String> daftarSumberDana = [
    "APBD 2024",
    "APBN 2024",
    "Dana Hibah",
    "Lainnya"
  ];

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF184F61); 
    const accentColor = Color(0xFFF6C100);  
    const borderColor = Color(0xFFE6EEF2);  

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 25),
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Row(
              children: [
                Image.asset('assets/image/logo.png', height: 55),
                const SizedBox(width: 15),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SIAPABAJA",
                        style: TextStyle(
                          color: Color(0xFFF6C100),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Sistem Informasi Arsip Pengadaan Barang dan Jasa",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStepCircle(1, "Umum", isActive: currentStep == 1, isDone: currentStep > 1),
                _buildStepLine(isDone: currentStep > 1),
                _buildStepCircle(2, "Status", isActive: currentStep == 2, isDone: currentStep > 2),
                _buildStepLine(isDone: currentStep > 2),
                _buildStepCircle(3, "Anggaran", isActive: currentStep == 3, isDone: currentStep > 3),
                _buildStepLine(isDone: currentStep > 3),
                _buildStepCircle(4, "Dokumen", isActive: currentStep == 4),
              ],
            ),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white, 
                  borderRadius: BorderRadius.circular(20), 
                  border: Border.all(color: borderColor),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10)]
                ),
                child: _buildCurrentStepContent(),
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                if (currentStep > 1)
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.grey[100], 
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), 
                          side: const BorderSide(color: borderColor)
                        ),
                        onPressed: () => setState(() => currentStep--),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_back_ios, size: 14, color: Colors.black54),
                            SizedBox(width: 8),
                            Text("Kembali", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 13)),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (currentStep > 1) const SizedBox(width: 15),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: currentStep == 4 ? accentColor : primaryColor, 
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                      ),
                      onPressed: () {
                        if (currentStep < 4) {
                          setState(() => currentStep++);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Arsip berhasil disimpan!")),
                          );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (currentStep == 4) const Icon(Icons.check, color: primaryColor, size: 18),
                          if (currentStep == 4) const SizedBox(width: 8),
                          Text(
                            currentStep == 4 ? "Simpan" : "Lanjut", 
                            style: TextStyle(color: currentStep == 4 ? primaryColor : Colors.white, fontWeight: FontWeight.bold, fontSize: 14)
                          ),
                          if (currentStep < 4) const SizedBox(width: 8),
                          if (currentStep < 4) const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentStepContent() {
    switch (currentStep) {
      case 1: return _buildStep1Content();
      case 2: return _buildStep2Content();
      case 3: return _buildStep3Content();
      case 4: return _buildStep4Content();
      default: return const Center(child: Text("Halaman Tidak Ditemukan"));
    }
  }

  Widget _buildStep1Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Informasi Umum", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF184F61))),
        const Divider(height: 25),
        _buildFormInput("Nama Pekerjaan", "Masukkan nama pekerjaan", isRequired: true),
        const Text("Unit Kerja *", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        const SizedBox(height: 8),
        _buildDropdownField(
          value: selectedUnit,
          hint: "Pilih unit kerja",
          items: daftarUnit,
          onChanged: (val) => setState(() => selectedUnit = val),
        ),
        const SizedBox(height: 15),
        _buildFormInput("Tahun Anggaran", "2024", isRequired: true),
        _buildFormInput("Nama Penyedia", "Masukkan nama penyedia"),
      ],
    );
  }

  Widget _buildStep2Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Status Arsip", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF184F61))),
        const Divider(height: 25),
        const Text("Status Arsip *", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        const SizedBox(height: 10),
        _buildRadioCard("Publik", "Dapat diakses oleh semua pengguna", selectedStatus == "Publik"),
        const SizedBox(height: 15),
        _buildRadioCard("Private", "Hanya untuk pengguna tertentu", selectedStatus == "Private"),
        const SizedBox(height: 25),
        const Text("Status Pekerjaan *", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        const SizedBox(height: 8),
        _buildDropdownField(
          value: selectedJobStatus,
          hint: "Pilih status pekerjaan",
          items: daftarStatusPekerjaan,
          onChanged: (val) => setState(() => selectedJobStatus = val),
        ),
      ],
    );
  }

  Widget _buildStep3Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Informasi Anggaran", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF184F61))),
        const Divider(height: 25),
        _buildFormInput("Pagu Anggaran", "Rp 0", isRequired: true),
        _buildFormInput("Nilai Kontrak", "Rp 0", isRequired: true),
        const Text("Sumber Dana *", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        const SizedBox(height: 8),
        _buildDropdownField(
          value: selectedFundingSource,
          hint: "Pilih sumber dana",
          items: daftarSumberDana,
          onChanged: (val) => setState(() => selectedFundingSource = val),
        ),
      ],
    );
  }

  Widget _buildStep4Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Upload Dokumen", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF184F61))),
        const Divider(height: 25),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC), 
            borderRadius: BorderRadius.circular(15), 
            border: Border.all(color: const Color(0xFFE6EEF2))
          ),
          child: Column(
            children: [
              Icon(Icons.upload_file_outlined, size: 50, color: Colors.blueGrey.shade300),
              const SizedBox(height: 15),
              const Text("Klik untuk upload atau drag & drop", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF184F61))),
              const SizedBox(height: 5),
              const Text("PDF, DOC, XLSX (max. 10MB)", style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({required String? value, required String hint, required List<String> items, required Function(String?) onChanged}) {
    return DropdownButtonFormField<String>(
      value: value,
      hint: Text(hint, style: const TextStyle(fontSize: 13, color: Colors.grey)),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xFFE6EEF2))),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xFF184F61), width: 1.5)),
      ),
      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 20),
      items: items.map((String val) => DropdownMenuItem<String>(value: val, child: Text(val, style: const TextStyle(fontSize: 13)))).toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildRadioCard(String title, String subtitle, bool isSelected) {
    return GestureDetector(
      onTap: () => setState(() => selectedStatus = title),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), 
          border: Border.all(color: isSelected ? const Color(0xFF184F61) : const Color(0xFFE6EEF2), width: 1.5)
        ),
        child: Row(
          children: [
            Icon(isSelected ? Icons.radio_button_checked : Icons.radio_button_off, color: isSelected ? const Color(0xFF184F61) : Colors.grey, size: 20),
            const SizedBox(width: 15),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)), Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 11))]))
          ],
        ),
      ),
    );
  }

  Widget _buildStepCircle(int number, String label, {bool isActive = false, bool isDone = false}) {
    return Column(
      children: [
        Container(
          width: 28, height: 28,
          decoration: BoxDecoration(color: (isActive || isDone) ? const Color(0xFF184F61) : Colors.grey[200], shape: BoxShape.circle),
          child: Center(child: isDone ? const Icon(Icons.check, color: Colors.white, size: 16) : Text("$number", style: TextStyle(color: isActive ? Colors.white : Colors.grey, fontSize: 11, fontWeight: FontWeight.bold))),
        ),
        const SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 10, color: (isActive || isDone) ? Colors.black : Colors.grey, fontWeight: (isActive || isDone) ? FontWeight.bold : FontWeight.normal)),
      ],
    );
  }

  Widget _buildStepLine({bool isDone = false}) {
    return Expanded(child: Container(height: 2, color: isDone ? const Color(0xFF184F61) : const Color(0xFFE6EEF2), margin: const EdgeInsets.only(bottom: 15)));
  }

  Widget _buildFormInput(String label, String hint, {bool isRequired = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label + (isRequired ? " *" : ""), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: hint, 
              hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), 
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xFFE6EEF2))),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xFF184F61), width: 1.5)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10)
            ),
          ),
        ],
      ),
    );
  }
}

// --- TAMBAHAN KELAS BARU: HALAMAN PROFILE / AKUN ---
class ProfileContentPage extends StatelessWidget {
  const ProfileContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF184F61);

    return Column(
      children: [
        // Header yang serasi dengan halaman lainnya
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 25),
          decoration: const BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          child: Row(
            children: [
              Image.asset('assets/image/logo.png', height: 55),
              const SizedBox(width: 15),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "SIAPABAJA",
                      style: TextStyle(
                        color: Color(0xFFF6C100),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "Sistem Informasi Arsip Pengadaan Barang dan Jasa",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        
        // Isi Konten Profil
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: primaryColor,
                  child: Icon(Icons.person, size: 60, color: Colors.white),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Admin PPK",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: primaryColor),
                ),
                const Text(
                  "admin.ppk@unsoed.ac.id",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 30),
                
                // Menu List Akun
                _buildProfileMenuTile(Icons.lock_outline, "Ubah Kata Sandi"),
                _buildProfileMenuTile(Icons.notifications_none_outlined, "Pengaturan Notifikasi"),
                _buildProfileMenuTile(Icons.help_outline_rounded, "Pusat Bantuan"),
                const Divider(height: 40),
                _buildProfileMenuTile(Icons.logout_rounded, "Keluar", textColor: Colors.red, iconColor: Colors.red),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileMenuTile(IconData icon, String title, {Color? textColor, Color? iconColor}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE6EEF2)),
      ),
      child: ListTile(
        leading: Icon(icon, color: iconColor ?? const Color(0xFF184F61)),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: textColor ?? Colors.black87)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
}