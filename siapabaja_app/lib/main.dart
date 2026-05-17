import 'ppk.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const SiapabajaApp());
}

class SiapabajaApp extends StatelessWidget {
  const SiapabajaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIAPABAJA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF184F61),
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: const SplashScreen(),
    );
  }
}

// --- 1. SPLASH SCREEN ---
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF184F61),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/image/logo.png', height: 150),
            const SizedBox(height: 20),
            const Text(
              "SIAPABAJA",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFFD4AF37), letterSpacing: 4),
            ),
          ],
        ),
      ),
    );
  }
}

// --- 2. LOGIN PAGE ---
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 1. Tambahkan Controller untuk menangkap input email
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose(); // Membersihkan memory saat page ditutup
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF184F61);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                Image.asset('assets/image/logo.png', height: 100),
                const SizedBox(height: 10),
                const Text("SIAPABAJA",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD4AF37))),
                const SizedBox(height: 70),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Selamat Datang",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                ),
                const Text(
                    "Silahkan Log In Menggunakan akun SIAPABAJA yang sudah terdaftar",
                    style: TextStyle(fontSize: 13, color: Colors.grey)),
                const SizedBox(height: 30),
                
                // 2. Gunakan controller pada TextField email
                _buildTextField("Email", Icons.email_outlined, primaryColor, 
                    controller: _emailController),
                
                const SizedBox(height: 20),
                _buildTextField("Kata Sandi", Icons.lock_outline, primaryColor,
                    isPassword: true),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: () {
                      // --- LOGIKA LOGIN DISINI ---
                      String email = _emailController.text.trim().toLowerCase();

                      if (email == "admin") {
                        // JIKA PPK (ADMIN)
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const AdminPPKPage()),
                        );
                      } else {
                        // JIKA UNIT (USER BIASA)
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const DashboardPage()),
                        );
                      }
                    },
                    child: const Text("Masuk",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Tambahkan parameter controller pada fungsi helper
  Widget _buildTextField(String label, IconData icon, Color color,
      {bool isPassword = false, TextEditingController? controller}) {
    return TextField(
      controller: controller, // Pasang controller di sini
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: color),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

// --- 3. DASHBOARD PAGE (MAIN WRAPPER) ---
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(),
    const ArchiveListPage(),
    const AddArchivePage(),
    const ActivityPage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF184F61),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.archive), label: "Arsip"),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle, size: 30), label: "Tambah"),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: "Aktivitas"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Akun"),
        ],
      ),
    );
  }
}

// --- KONTEN HALAMAN HOME (BERANDA) ---
// --- REVISI HOME CONTENT (STATEFUL UNTUK ANIMASI) ---
// --- REVISI FINAL HOME CONTENT DENGAN UNIQUE KEY UNTUK ANIMASI ---
class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  // Variabel untuk menyimpan nilai target
  double publikValue = 186;
  double privateValue = 62;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF184F61);
    const accentColor = Color(0xFFD4AF37);
    const chartGold = Color(0xFFE5C185);

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Header Biru
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Row(
                children: [
                  Image.asset('assets/image/logo.png', height: 60),
                  const SizedBox(width: 15),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("SIAPABAJA",
                            style: TextStyle(
                                color: accentColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Text(
                            "Sistem Informasi Arsip Pengaduan Barang dan Jasa",
                            style:
                                TextStyle(color: Colors.white, fontSize: 10)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // Grid Stat Card
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1.1,
                    children: [
                      _buildStatCard(Icons.description_outlined, "248", "Total Arsip"),
                      _buildStatCard(Icons.lock_open_outlined, "186", "Arsip Publik"),
                      _buildStatCard(Icons.lock_outlined, "62", "Arsip Private"),
                      _buildStatCard(Icons.payments_outlined, "Rp 45.2M", "Total Nilai"),
                    ],
                  ),
                  const SizedBox(height: 25),

                  // --- BAGIAN GRAFIK (DENGAN UNIQUE KEY) ---
                  _buildSectionContainer(
                    title: "Distribusi Arsip",
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                          child: PieChart(
                            key: UniqueKey(), // MEMAKSA ANIMASI SETIAP KALI MUNCUL
                            PieChartData(
                              startDegreeOffset: 270,
                              sectionsSpace: 0,
                              centerSpaceRadius: 60,
                              sections: [
                                PieChartSectionData(
                                  color: primaryColor,
                                  value: publikValue,
                                  radius: 25,
                                  showTitle: false,
                                ),
                                PieChartSectionData(
                                  color: chartGold,
                                  value: privateValue,
                                  radius: 25,
                                  showTitle: false,
                                ),
                              ],
                            ),
                            swapAnimationDuration: const Duration(milliseconds: 1500),
                            swapAnimationCurve: Curves.easeInOutBack,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _LegendItem(color: primaryColor, text: "Publik (186)"),
                            const SizedBox(width: 20),
                            _LegendItem(color: chartGold, text: "Private (62)"),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),
                  _buildSectionContainer(
                    title: "Arsip per Bulan",
                    child: SizedBox(
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          _buildBar(40, "Jan"),
                          _buildBar(70, "Feb"),
                          _buildBar(55, "Mar"),
                          _buildBar(90, "Apr"),
                          _buildBar(80, "Mei"),
                          _buildBar(110, "Jun"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: const Color(0xFFF6C100),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ringkasan Bulan Ini",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: primaryColor)),
                        SizedBox(height: 15),
                        _SummaryRow(label: "Arsip Baru", value: "30 dokumen"),
                        _SummaryRow(
                            label: "Total Nilai Kontrak", value: "Rp 8.5M"),
                        _SummaryRow(
                            label: "Unit Kerja Aktif", value: "12 unit"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- HELPER WIDGETS ---
  Widget _buildSectionContainer({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }

  Widget _buildStatCard(IconData icon, String value, String label) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
            child: Icon(icon, color: const Color(0xFF184F61), size: 20),
          ),
          const Spacer(),
          Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildBar(double height, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(width: 25, height: height, decoration: BoxDecoration(color: const Color(0xFF184F61), borderRadius: BorderRadius.circular(4))),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
      ],
    );
  }
}
// --- 4. HALAMAN DAFTAR ARSIP (NEW) ---
class ArchiveListPage extends StatelessWidget {
  const ArchiveListPage({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF184F61);

    return Column(
      children: [
        // HEADER BIRU DENGAN SEARCH
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 25),
          color: primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Arsip Pengadaan",
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Cari nama pekerjaan...",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
            ],
          ),
        ),

        // FILTER BAR
        Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterBtn(Icons.tune, "Filter", isSelected: false),
                _buildFilterBtn(null, "Semua", isSelected: true),
                _buildFilterBtn(null, "2024", isSelected: false),
                _buildFilterBtn(null, "2023", isSelected: false),
              ],
            ),
          ),
        ),

        // LIST ARSIP (Scrollable)
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children: [
              _buildArchiveCard("Pengadaan Laptop dan Komputer Kantor", "Dinas Pendidikan", "2024", "Rp 245.000.000", "Selesai", Colors.green),
              _buildArchiveCard("Renovasi Gedung Kantor Utama", "Dinas Pekerjaan Umum", "2024", "Rp 1.850.000.000", "Dalam Proses", Colors.orange),
              _buildArchiveCard("Pengadaan Alat Kesehatan", "Dinas Kesehatan", "2024", "Rp 580.000.000", "Selesai", Colors.green),
              _buildArchiveCard("Pembangunan Jalan Lingkar Kota", "Dinas Pekerjaan Umum", "2023", "Rp 5.200.000.000", "Ditunda", Colors.red),
              _buildArchiveCard("Pengadaan Buku Perpustakaan", "Dinas Pendidikan", "2024", "Rp 125.000.000", "Verifikasi", Colors.purpleAccent),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFilterBtn(IconData? icon, String label, {required bool isSelected}) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected ? const Color(0xFF184F61) : Colors.white,
          side: BorderSide(color: Colors.grey.shade300),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        ),
        onPressed: () {},
        child: Row(
          children: [
            if (icon != null) Icon(icon, size: 18, color: isSelected ? Colors.white : Colors.grey),
            if (icon != null) const SizedBox(width: 5),
            Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.black87, fontSize: 13)),
          ],
        ),
      ),
    );
  }

  Widget _buildArchiveCard(String title, String unit, String year, String price, String status, Color statusColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: statusColor, borderRadius: BorderRadius.circular(8)),
                child: Text(status, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 15),
          _buildCardInfo(Icons.business, unit),
          const SizedBox(height: 8),
          _buildCardInfo(Icons.calendar_today, "Tahun $year"),
          const SizedBox(height: 8),
          _buildCardInfo(Icons.attach_money, price, isPrice: true),
        ],
      ),
    );
  }

  Widget _buildCardInfo(IconData icon, String text, {bool isPrice = false}) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey.shade400),
        const SizedBox(width: 10),
        Text(text, style: TextStyle(color: isPrice ? const Color(0xFF184F61) : Colors.grey, fontSize: 12, fontWeight: isPrice ? FontWeight.bold : FontWeight.normal)),
      ],
    );
  }
}

// --- 5. HALAMAN TAMBAH ARSIP (STEPPER) ---
class AddArchivePage extends StatefulWidget {
  const AddArchivePage({super.key});

  @override
  State<AddArchivePage> createState() => _AddArchivePageState();
}

class _AddArchivePageState extends State<AddArchivePage> {
  int currentStep = 1;
  String selectedStatus = "Publik";

  // --- VARIABEL STATE UNTUK DROPDOWN ---
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
    const primaryColor = Color(0xFF184F61); // --unsoed-blue
    const accentColor = Color(0xFFF6C100);  // --yellow
    const borderColor = Color(0xFFE6EEF2);  // --border

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(25),
          color: primaryColor,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Tambah Arsip Baru", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
              Text("Lengkapi informasi pengadaan", style: TextStyle(color: Colors.white70, fontSize: 13)),
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
                border: Border.all(color: borderColor)
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
                    height: 55,
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
                          Icon(Icons.arrow_back_ios, size: 16, color: Colors.black54),
                          SizedBox(width: 8),
                          Text("Kembali", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),
              if (currentStep > 1) const SizedBox(width: 15),
              Expanded(
                child: SizedBox(
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: currentStep == 4 ? accentColor : primaryColor, 
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                    ),
                    onPressed: () { if (currentStep < 4) setState(() => currentStep++); },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (currentStep == 4) const Icon(Icons.check, color: primaryColor, size: 20),
                        if (currentStep == 4) const SizedBox(width: 10),
                        Text(
                          currentStep == 4 ? "Simpan" : "Lanjut", 
                          style: TextStyle(
                            color: currentStep == 4 ? primaryColor : Colors.white, 
                            fontWeight: FontWeight.bold
                          )
                        ),
                        if (currentStep < 4) const SizedBox(width: 10),
                        if (currentStep < 4) const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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

  // --- STEP 1: INFORMASI UMUM ---
  Widget _buildStep1Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Informasi Umum", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
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

  // --- STEP 2: STATUS ARSIP ---
  Widget _buildStep2Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Status Arsip", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
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

  // --- STEP 3: INFORMASI ANGGARAN ---
  Widget _buildStep3Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Informasi Anggaran", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
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

  // --- STEP 4: DOKUMEN ---
  Widget _buildStep4Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Upload Dokumen", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius: BorderRadius.circular(15), 
            border: Border.all(color: const Color(0xFFE6EEF2))
          ),
          child: Column(
            children: [
              Icon(Icons.upload_file_outlined, size: 60, color: Colors.grey.shade400),
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

  // --- HELPER WIDGETS ---

  Widget _buildDropdownField({
    required String? value,
    required String hint,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      hint: Text(hint, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFE6EEF2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF184F61), width: 1.5),
        ),
      ),
      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
      items: items.map((String val) {
        return DropdownMenuItem<String>(
          value: val,
          child: Text(val, style: const TextStyle(fontSize: 14)),
        );
      }).toList(),
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
            Icon(isSelected ? Icons.radio_button_checked : Icons.radio_button_off, color: isSelected ? const Color(0xFF184F61) : Colors.grey),
            const SizedBox(width: 15),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)), Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 11))])
          ],
        ),
      ),
    );
  }

  Widget _buildStepCircle(int number, String label, {bool isActive = false, bool isDone = false}) {
    return Column(
      children: [
        Container(
          width: 30, height: 30,
          decoration: BoxDecoration(color: (isActive || isDone) ? const Color(0xFF184F61) : Colors.grey[200], shape: BoxShape.circle),
          child: Center(child: isDone ? const Icon(Icons.check, color: Colors.white, size: 18) : Text("$number", style: TextStyle(color: isActive ? Colors.white : Colors.grey, fontSize: 12))),
        ),
        const SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 10, color: (isActive || isDone) ? Colors.black : Colors.grey)),
      ],
    );
  }

  Widget _buildStepLine({bool isDone = false}) {
    return Expanded(child: Container(height: 2, color: isDone ? const Color(0xFF184F61) : const Color(0xFFE6EEF2), margin: const EdgeInsets.only(bottom: 15)));
  }

  Widget _buildFormInput(String label, String hint, {bool isDropdown = false, bool isRequired = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label + (isRequired ? " *" : ""), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          const SizedBox(height: 8),
          TextField(
            readOnly: isDropdown,
            decoration: InputDecoration(
              hintText: hint, 
              suffixIcon: isDropdown ? const Icon(Icons.keyboard_arrow_down) : null, 
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), 
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xFFE6EEF2))),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15)
            ),
          ),
        ],
      ),
    );
  }
}

// --- HALAMAN AKTIVITAS ---
class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF184F61);

    return Column(
      children: [
        // 1. Header Biru
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 25),
          color: primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Aktivitas",
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: 24, 
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Riwayat aktivitas sistem",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8), 
                  fontSize: 14
                ),
              ),
            ],
          ),
        ),

        // 2. Bar Tombol Filter
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterBtn("Semua", isSelected: true),
                _buildFilterBtn("Hari Ini"),
                _buildFilterBtn("Minggu Ini"),
                _buildFilterBtn("Bulan Ini"),
              ],
            ),
          ),
        ),

        // 3. List Timeline (Scrollable)
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              _buildTimelineTile(
                icon: Icons.file_upload,
                iconColor: Colors.green,
                title: "Arsip baru ditambahkan",
                description: "Pengadaan Laptop dan Komputer Kantor",
                time: "2 jam yang lalu",
              ),
              _buildTimelineTile(
                icon: Icons.edit_calendar_outlined,
                iconColor: Colors.blue,
                title: "Arsip diperbarui",
                description: "Renovasi Gedung Kantor Utama",
                time: "5 jam yang lalu",
              ),
              _buildTimelineTile(
                icon: Icons.description_outlined,
                iconColor: Colors.purple,
                title: "Dokumen diunduh",
                description: "Kontrak_Pengadaan.pdf",
                time: "1 hari yang lalu",
              ),
              _buildTimelineTile(
                icon: Icons.delete_outline,
                iconColor: Colors.red,
                title: "Arsip dihapus",
                description: "Pengadaan Seragam Sekolah",
                time: "2 hari yang lalu",
              ),
              _buildTimelineTile(
                icon: Icons.file_upload,
                iconColor: Colors.green,
                title: "Arsip baru ditambahkan",
                description: "Pemasangan CCTV Kota",
                time: "2 hari yang lalu",
              ),
              _buildTimelineTile(
                icon: Icons.file_upload,
                iconColor: Colors.green,
                title: "Arsip baru ditambahkan",
                description: "Pemasangan CCTV Kota",
                time: "3 hari yang lalu",
              ),
              _buildTimelineTile(
                icon: Icons.edit_calendar_outlined,
                iconColor: Colors.blue,
                title: "Status diperbarui",
                description: "Pengadaan Alat Kesehatan",
                time: "4 hari yang lalu",
              ),
              _buildTimelineTile(
                icon: Icons.description_outlined,
                iconColor: Colors.purple,
                title: "Dokumen diunduh",
                description: "RAB_Detail.xlsx",
                time: "5 hari yang lalu",
              ),
              const SizedBox(height: 10),
              
              // Tombol Muat Lebih Banyak
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  side: BorderSide(color: Colors.grey.shade300),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text("Muat Lebih Banyak", style: TextStyle(color: Colors.grey)),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }

  // Helper untuk Tombol Filter
  Widget _buildFilterBtn(String label, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? const Color(0xFF184F61) : Colors.white,
          foregroundColor: isSelected ? Colors.white : Colors.black87,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.grey.shade300),
          ),
        ),
        child: Text(label),
      ),
    );
  }

  // Helper untuk Item Timeline
  Widget _buildTimelineTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
    required String time,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Kolom Kiri: Ikon dan Garis Penghubung
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: Colors.white, size: 24),
              ),
              Expanded(
                child: Container(
                  width: 2,
                  color: Colors.grey.shade200,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                ),
              ),
            ],
          ),
          const SizedBox(width: 15),
          // Kolom Kanan: Kartu Konten
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(description, style: const TextStyle(color: Colors.grey, fontSize: 14)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// --- 8. HALAMAN AKUN ---
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF184F61);

    return SingleChildScrollView(
      child: Column(
        children: [
          // HEADER BIRU DENGAN SETTING
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 60),
            color: primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Akun Saya",
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.settings_outlined, color: Colors.white, size: 20),
                ),
              ],
            ),
          ),

          // KARTU PROFIL (Tumpang tindih sedikit ke atas)
          Transform.translate(
            offset: const Offset(0, -40),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // Box Foto & Nama
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
                    ),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            const CircleAvatar(
                              radius: 50,
                              backgroundColor: Color(0xFF184F61),
                              child: Text("AF", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(color: Color(0xFFF6C100), shape: BoxShape.circle),
                              child: const Icon(Icons.camera_alt, size: 18, color: Color(0xFF184F61)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const Text("Ahmad Fauzi", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        const Text("Staff Pengadaan", style: TextStyle(color: Colors.grey, fontSize: 14)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // INFORMASI PRIBADI
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade100),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Informasi Pribadi", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            Text("Edit", style: TextStyle(color: primaryColor.withOpacity(0.7), fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        _buildAccountField(Icons.email_outlined, "Email", "ahmad.fauzi@siapabaja.go.id"),
                        _buildAccountField(Icons.phone_outlined, "Telepon", "081234567890"),
                        _buildAccountField(Icons.business_outlined, "Unit Kerja", "Dinas Pendidikan", isDropdown: true),
                        _buildAccountField(Icons.location_on_outlined, "Alamat", "Jl. Merdeka No. 123, Jakarta", isTextArea: true),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // STATISTIK AKTIVITAS
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Statistik Aktivitas", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            _buildStatBox("24", "Arsip Dibuat", Colors.blueGrey.shade50),
                            const SizedBox(width: 15),
                            _buildStatBox("156", "Dokumen Diunduh", const Color(0xFFFDF5E6)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // TOMBOL KELUAR
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.redAccent),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {},
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.logout, color: Colors.redAccent, size: 20),
                          SizedBox(width: 10),
                          Text("Keluar", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountField(IconData icon, String label, String value, {bool isDropdown = false, bool isTextArea = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: Colors.grey),
              const SizedBox(width: 8),
              Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 8),
          TextField(
            readOnly: true,
            maxLines: isTextArea ? 3 : 1,
            decoration: InputDecoration(
              hintText: value,
              suffixIcon: isDropdown ? const Icon(Icons.keyboard_arrow_down) : (isTextArea ? const Icon(Icons.edit_note, size: 18) : null),
              filled: true,
              fillColor: const Color(0xFFF8F9FA),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade200)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade200)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatBox(String value, String label, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF184F61))),
            Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String text;
  const _LegendItem({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min, // Agar tidak memakan ruang berlebih
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF64748B), // Warna teks abu-abu (muted)
          ),
        ),
      ],
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label, value;
  const _SummaryRow({required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 4), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(label, style: const TextStyle(fontSize: 13, color: Color(0xFF184F61))), Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF184F61)))]));
  }
}
