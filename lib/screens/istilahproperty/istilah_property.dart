import 'package:flutter/material.dart';
import 'package:remax_app/util/constants.dart';

import 'components/body.dart';

class IstilahPropertyPage extends StatefulWidget {
  @override
  State<IstilahPropertyPage> createState() => _IstilahPropertyPageState();
}

class _IstilahPropertyPageState extends State<IstilahPropertyPage> {
  bool _showBackToTopButton = false;
  final aKey = new GlobalKey();
  final bKey = new GlobalKey();
  final cKey = new GlobalKey();
  final dKey = new GlobalKey();
  final eKey = new GlobalKey();
  final fKey = new GlobalKey();
  final gKey = new GlobalKey();
  final hKey = new GlobalKey();
  final iKey = new GlobalKey();
  final jKey = new GlobalKey();
  final kKey = new GlobalKey();
  final lKey = new GlobalKey();
  final mKey = new GlobalKey();
  final nKey = new GlobalKey();
  final oKey = new GlobalKey();
  final pKey = new GlobalKey();
  final qKey = new GlobalKey();
  final rKey = new GlobalKey();
  final sKey = new GlobalKey();
  final tKey = new GlobalKey();
  final uKey = new GlobalKey();
  final vKey = new GlobalKey();
  final wKey = new GlobalKey();
  final xKey = new GlobalKey();
  final yKey = new GlobalKey();
  final zKey = new GlobalKey();
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 400) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  // This function is triggered when the user presses the back-to-top button
  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: Duration(seconds: 2), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: kAppBarColorTheme, //change your color here
          ),
          title: Text(
            "Istilah Property",
            style: TextStyle(color: kAppBarColorTheme),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(5.0),
                    child: Text(
                      "Select:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Wrap(
                  children: [
                    InkWell(
                        onTap: () {
                          Scrollable.ensureVisible(aKey.currentContext);
                        },
                        child: ItemHuruf(huruf: "A")),
                    InkWell(
                        onTap: () {
                          Scrollable.ensureVisible(bKey.currentContext);
                        },
                        child: ItemHuruf(huruf: "B")),
                    InkWell(
                        onTap: () {
                          Scrollable.ensureVisible(cKey.currentContext);
                        },
                        child: ItemHuruf(huruf: "C")),
                    InkWell(
                        onTap: () {
                          Scrollable.ensureVisible(dKey.currentContext);
                        },
                        child: ItemHuruf(huruf: "D")),
                    InkWell(
                        onTap: () {
                          Scrollable.ensureVisible(eKey.currentContext);
                        },
                        child: ItemHuruf(huruf: "E")),
                    InkWell(
                        onTap: () {
                          Scrollable.ensureVisible(fKey.currentContext);
                        },
                        child: ItemHuruf(huruf: "F")),
                    InkWell(
                        onTap: () {
                          Scrollable.ensureVisible(gKey.currentContext);
                        },
                        child: ItemHuruf(huruf: "G")),
                    InkWell(
                        onTap: () {
                          Scrollable.ensureVisible(hKey.currentContext);
                        },
                        child: ItemHuruf(huruf: "H")),
                    InkWell(
                        onTap: () {
                          Scrollable.ensureVisible(iKey.currentContext);
                        },
                        child: ItemHuruf(huruf: "I")),
                    InkWell(
                        onTap: () {
                          Scrollable.ensureVisible(jKey.currentContext);
                        },
                        child: ItemHuruf(huruf: "J")),
                    InkWell(
                        onTap: () {
                          Scrollable.ensureVisible(kKey.currentContext);
                        },
                        child: ItemHuruf(huruf: "K")),
                    InkWell(
                        onTap: () {
                          Scrollable.ensureVisible(lKey.currentContext);
                        },
                        child: ItemHuruf(huruf: "L")),
                    InkWell(
                        onTap: () {
                          Scrollable.ensureVisible(mKey.currentContext);
                        },
                        child: ItemHuruf(huruf: "M")),
                    InkWell(
                        onTap: () {
                          Scrollable.ensureVisible(nKey.currentContext);
                        },
                        child: ItemHuruf(huruf: "N")),
                    InkWell(
                        onTap: () {
                          Scrollable.ensureVisible(oKey.currentContext);
                        },
                        child: ItemHuruf(huruf: "O")),
                    InkWell(
                        onTap: () {
                          Scrollable.ensureVisible(pKey.currentContext);
                        },
                        child: ItemHuruf(huruf: "P")),
                    InkWell(
                        onTap: () {
                          Scrollable.ensureVisible(qKey.currentContext);
                        },
                        child: ItemHuruf(huruf: "Q")),
                    InkWell(
                        onTap: () {
                          Scrollable.ensureVisible(rKey.currentContext);
                        },
                        child: ItemHuruf(huruf: "R")),
                    InkWell(
                        onTap: () {
                          Scrollable.ensureVisible(sKey.currentContext);
                        },
                        child: ItemHuruf(huruf: "S")),
                    InkWell(
                        onTap: () {
                          Scrollable.ensureVisible(tKey.currentContext);
                        },
                        child: ItemHuruf(huruf: "T")),
                    InkWell(
                        onTap: () {
                          Scrollable.ensureVisible(uKey.currentContext);
                        },
                        child: ItemHuruf(huruf: "U")),
                    InkWell(
                        onTap: () {
                          Scrollable.ensureVisible(vKey.currentContext);
                        },
                        child: ItemHuruf(huruf: "V")),
                    InkWell(
                        onTap: () {
                          Scrollable.ensureVisible(wKey.currentContext);
                        },
                        child: ItemHuruf(huruf: "W")),
                    InkWell(
                        onTap: () {
                          Scrollable.ensureVisible(xKey.currentContext);
                        },
                        child: ItemHuruf(huruf: "X")),
                    InkWell(
                        onTap: () {
                          Scrollable.ensureVisible(yKey.currentContext);
                        },
                        child: ItemHuruf(huruf: "Y")),
                    InkWell(
                        onTap: () {
                          Scrollable.ensureVisible(zKey.currentContext);
                        },
                        child: ItemHuruf(huruf: "Z")),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: 20.0, left: 5.0, right: 5.0, bottom: 20.0),
                  color: Colors.grey,
                  child: SizedBox(
                      height: 1, width: MediaQuery.of(context).size.width),
                ),
                Column(
                  key: aKey,
                  children: <Widget>[
                    AwalanHuruf(huruf: "A"),
                    ItemKalimat(
                      huruf: "A",
                      kata: "gen property",
                      deskripsi:
                          "Pihak atau orang yang menjembatani antara penjual dan pembeli properti, pada dasarnya agen properti ada yang tergabung dalam sebuah kantor agen properti ataupun individu.",
                    ),
                    ItemKalimat(
                      huruf: "A",
                      kata: "gunan (collateral)",
                      deskripsi:
                          "Aset milik peminjam yang diberikan kepada pihak bank, aset tersebut nantinya akan menjadi milik bank jika peminjam gagal untuk membayar cicilan.\nDalam skema pengajuan KPR biasanya agunan yang diberikan kepada bank adalah sertifikat tanah.",
                    ),
                    ItemKalimat(
                      huruf: "A",
                      kata: "JB",
                      deskripsi:
                          "Akta Jual Beli. AJB Merupakan surat keterangan bahwa satu properti sudah dipindahtangankan dari satu pihak ke pihak lain karena aktivitas jual beli.",
                    ),
                    ItemKalimat(
                      huruf: "A",
                      kata: "mortisasi",
                      deskripsi:
                          "Pengurangan utang berjalan dengan membayar hutang secara tetap dengan jumlah yang sama. Dengan amortisasi, pembayaran utang terdiri atas pembayaran pokok (principal) dan pembayaran bunga (interest).",
                    ),
                    ItemKalimat(
                      huruf: "A",
                      kata: "nami",
                      deskripsi:
                          "Apartemen sederhana milik, hunian vertikal ini kelasnya di atas rusunami namun di bawah apartemen komersil.",
                    ),
                    ItemKalimat(
                      huruf: "A",
                      kata: "nchor tenant",
                      deskripsi:
                          "Anchor tenant adalah pihak yang menyewakan ruko atau ruang dalam sebuah proyek properti komersial seperti mall contohnya.",
                    ),
                    ItemKalimat(
                      huruf: "A",
                      kata: "nuitas Rest",
                      deskripsi:
                          "Perhitungan pembebanan bunga efektif dengan periode tahunan. Jika debitur membayar lebih untuk mengurangi pokok kredit, maka dengan sendirinya akan mendapatpengurangan beban dan pastinya waktu pelunasan akan berakhir lebih cepat dari tenor (masa cicilan).",
                    ),
                    ItemKalimat(
                      huruf: "A",
                      kata: "rsitek",
                      deskripsi:
                          "sebuah profesi yang membuat gambar desain bangunan agar indah dan nyaman digunakan.",
                    ),
                    ItemKalimat(
                      huruf: "A",
                      kata: "rus Kas (Cash Flow)",
                      deskripsi:
                          "Laporan mengenai aliran dana masuk dan aliran dana keluar dalam satu periode tertentu.",
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: 20.0, left: 5.0, right: 5.0, bottom: 20.0),
                  color: Colors.grey,
                  child: SizedBox(
                      height: 1, width: MediaQuery.of(context).size.width),
                ),
                Column(
                  key: bKey,
                  children: <Widget>[
                    AwalanHuruf(huruf: "B"),
                    ItemKalimat(
                      huruf: "B",
                      kata: "acklog",
                      deskripsi:
                          "Selisih antara jumlah kebutuhan hunian dengan jumlah ketersediaan hunian yang ada.",
                    ),
                    ItemKalimat(
                      huruf: "B",
                      kata: "BN",
                      deskripsi:
                          "Bea Balik Nama. Biaya ini dibutuhkan dalam mengganti nama kepemilikan suatu properti.",
                    ),
                    ItemKalimat(
                      huruf: "B",
                      kata: "ooming",
                      deskripsi:
                          "Suatu keadaan dimana sebuah jenis properti sedang mengalami lonjakan permintaan. Booming juga turut mempengaruhi kenaikan harga satu jenis properti yang sedang banyak diincar.",
                    ),
                    ItemKalimat(
                      huruf: "B",
                      kata: "P Tapera",
                      deskripsi:
                          "Badan Pengelola Tabungan Perumahan Rakyat adalah sebuah lembaga yang membantu untuk mengelola keuangan masyarakat untuk bisa memiliki rumah sendiri.",
                    ),
                    ItemKalimat(
                      huruf: "B",
                      kata: "PHTB",
                      deskripsi:
                          "Bea Perolehan Hak Atas Tanah dan Bangunan merupakan pajak yang dikenakan kepada pembeli properti (tanah, rumah, apartemen, ruko dan lain-lain).",
                    ),
                    ItemKalimat(
                      huruf: "B",
                      kata: "PN",
                      deskripsi: "Badan Pertanahan Nasional.",
                    ),
                    ItemKalimat(
                      huruf: "B",
                      kata: "roker",
                      deskripsi:
                          "Pihak atau orang yang menjembatani antara pembeli/investor dengan penjual. Broker properti mendapat keuntungan dari hasil komisi yang telah disepakati.",
                    ),
                    ItemKalimat(
                      huruf: "B",
                      kata: "ubble properti",
                      deskripsi:
                          "Istilah yang digunakan untuk menggambarkan kondisi meningkatnya harga properti di suatu kawasan. Peningkatan harga tersebut bahkan cenderung tidak realistis, hal ini disebabkan karena meningkatnya permintaan dan spekulasi.",
                    ),
                    ItemKalimat(
                      huruf: "B",
                      kata: "unga mengambang (Floating rate)",
                      deskripsi:
                          "Suku bunga dengan besaran yang berbeda, penentuan suku bunga ini berdasarkan Bank Indonesia.",
                    ),
                    ItemKalimat(
                      huruf: "B",
                      kata: "unga tetap (Fix rate)",
                      deskripsi:
                          "Suku bunga dengan besaran tetap hingga masa tenor pinjaman selesai.",
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: 20.0, left: 5.0, right: 5.0, bottom: 20.0),
                  color: Colors.grey,
                  child: SizedBox(
                      height: 1, width: MediaQuery.of(context).size.width),
                ),
                Column(
                  key: cKey,
                  children: <Widget>[
                    AwalanHuruf(huruf: "C"),
                    ItemKalimat(
                      huruf: "C",
                      kata: "apital Gain",
                      deskripsi:
                          "Besarnya keuntungan atau laba yang didapat dari penjualan aset investasi properti dibandingkan dengan harga saat membeli.",
                    ),
                    ItemKalimat(
                      huruf: "C",
                      kata: "ash back",
                      deskripsi:
                          "Satu bentuk penawaran dimana pembeli mendapatkan sejumlah pengembalian uang tunai saat deal membeli sebuah properti.\nBesarnya cash back bervariasi dan sudah ditentukan oleh pengembang atau penjual.",
                    ),
                    ItemKalimat(
                      huruf: "C",
                      kata: "ash back",
                      deskripsi:
                          "Satu bentuk penawaran dimana pembeli mendapatkan sejumlah pengembalian uang tunai saat deal membeli sebuah properti.\nBesarnya cash back bervariasi dan sudah ditentukan oleh pengembang atau penjual.",
                    ),
                    ItemKalimat(
                      huruf: "C",
                      kata: "luster",
                      deskripsi:
                          "Suatu lingkungan tempat tinggal dimana terdapat beberapa bangunan rumah tapak yang memiliki konsep, bentuk, dan ukuran sama. Cluster biasanya juga dilengkapi oleh fasilitas one gate system.",
                    ),
                    ItemKalimat(
                      huruf: "C",
                      kata: "o-broking",
                      deskripsi:
                          "Kerjasama penjualan properti dari dua agen properti atau lebih.",
                    ),
                    ItemKalimat(
                      huruf: "C",
                      kata: "ost and Fee",
                      deskripsi:
                          "Sebuah istilah yang mengacu kepada sistem kontraktor ketika membangun sebuah properti.\nSistem ini merupakan sebuah jasa pelaksanaan yang digabung dengan jasa pengawasan.",
                    ),
                    ItemKalimat(
                      huruf: "C",
                      kata: "ut and fill",
                      deskripsi:
                          "Satu proses yang dilakukan oleh ahli untuk meratakan tanah.\nProsesnya sendiri adalah mengeruk satu bagian lahan yang berbukit, kemudian tanahnya digunakan untuk menguruk/ menimbun bagian lain agar menjadi rata.",
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: 20.0, left: 5.0, right: 5.0, bottom: 20.0),
                  color: Colors.grey,
                  child: SizedBox(
                      height: 1, width: MediaQuery.of(context).size.width),
                ),
                Column(
                  key: dKey,
                  children: <Widget>[
                    AwalanHuruf(huruf: "D"),
                    ItemKalimat(
                      huruf: "D",
                      kata: "emand",
                      deskripsi:
                          "Jumlah permintaan mengenai suatu jenis properti dalam satu kurun waktu tertentu.",
                    ),
                    ItemKalimat(
                      huruf: "D",
                      kata: "eveloper",
                      deskripsi:
                          "Pihak (bisa berupa satu perusahaan atau badan) yang membangun suatu areal properti.\nTidak terbatas hanya membangun perumahan, developer juga turut membangun kawasan niaga atau komersial seperti ruko juga gedung kantor.",
                    ),
                    ItemKalimat(
                      huruf: "D",
                      kata: "own Payment",
                      deskripsi:
                          "Uang muka. Biasanya diasosiasikan sebagai tanda jadi atau tanda keseriusan seseorang dalam membeli atau menyewa properti.",
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: 20.0, left: 5.0, right: 5.0, bottom: 20.0),
                  color: Colors.grey,
                  child: SizedBox(
                      height: 1, width: MediaQuery.of(context).size.width),
                ),
                Column(
                  key: eKey,
                  children: <Widget>[
                    AwalanHuruf(huruf: "E"),
                    ItemKalimat(
                      huruf: "E",
                      kata: "arlybird",
                      deskripsi:
                          "Membeli suatu properti saat pertama kali properti tersebut ditawarkan.\nKeuntungan yang bisa didapat dari pembelian ini biasanya adalah harga yang masih murah di bawah harga jual aslinya. Namun, pembelian secara early bird berarti juga Anda sebagai pembeli harus sabar dalam menunggu properti tersebut jadi dan siap huni.",
                    ),
                    ItemKalimat(
                      huruf: "E",
                      kata: "scrow",
                      deskripsi:
                          "Badan penengah yang netral antara penjual dan pembeli dengan tugas menitipkan uang jaminan / deposit, tanda tangan PPJB dan sampai serah terima AJB.\nTugas Escrow di Indonesia dilakukan oleh Notaris.",
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: 20.0, left: 5.0, right: 5.0, bottom: 20.0),
                  color: Colors.grey,
                  child: SizedBox(
                      height: 1, width: MediaQuery.of(context).size.width),
                ),
                Column(
                  key: fKey,
                  children: <Widget>[
                    AwalanHuruf(huruf: "F"),
                    ItemKalimat(
                      huruf: "F",
                      kata: "asos",
                      deskripsi:
                          "Fasilitas yang dibuat oleh pemerintah atau pihak swasta guna dimanfaatkan oleh masyarakat umum dalam lingkungan pemukiman.\nContohnya yakni puskemas, klinik, sekolah, tempat ibadah, pasar, tempat rekreasi, taman bermain, tempat olahraga, ruang serbaguna, makam, dsb.",
                    ),
                    ItemKalimat(
                      huruf: "F",
                      kata: "asum",
                      deskripsi:
                          "Fasilitas yang dapat digunakan oleh masyarakat umum.\nContohnya yakni jalan raya, angkutan umum, saluran air, jembatan, halte, alat penerangan umum, jaringan listrik, trotoar, tempat pembuangan sampah, dan lain sebagainya.",
                    ),
                    ItemKalimat(
                      huruf: "F",
                      kata: "ixed Cost and Fee",
                      deskripsi:
                          "Salah satu sistem kerja sama yang dilakukan oleh kontraktor dan pelanggan, sistem ini adalah jumlah fee tertentu yang dibayarkan oleh pelanggan tanpa melihat besarnya biaya fisik pekerjaan.\nKontrak ini dapat diterapkan bila pekerjaan dapat dirumuskan secara garis besar dan jelas.",
                    ),
                    ItemKalimat(
                      huruf: "F",
                      kata: "LPP",
                      deskripsi:
                          "Fasilitas Likuiditas Pembiayan Perumahan merupakan program yang dialakukan oleh Kementrian Pekerjaan Umum dan Perumahan Rakyat, dengan program ini maka Masyarakat Berpenghasilan Rendah (MBR) dapat meminjam KPR dengan bunga yang terjangkau.",
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: 20.0, left: 5.0, right: 5.0, bottom: 20.0),
                  color: Colors.grey,
                  child: SizedBox(
                      height: 1, width: MediaQuery.of(context).size.width),
                ),
                Column(
                  key: gKey,
                  children: <Widget>[
                    AwalanHuruf(huruf: "G"),
                    ItemKalimat(
                      huruf: "G",
                      kata: "irik / letter C",
                      deskripsi:
                          "Keterangan bukti penguasaan atas tanah namun bukan tanda bukti kepemilikan hak atas tanah. Dibuktikan dengan pembayaran pajak atas tanah.",
                    ),
                    ItemKalimat(
                      huruf: "G",
                      kata: "roundbreaking",
                      deskripsi:
                          "Penggalian dasar bangunan, sebagai tahap awal pembangunan properti.",
                    ),
                    ItemKalimat(
                      huruf: "G",
                      kata: "SB",
                      deskripsi:
                          "Garis Sempadan Bangunan, yakni garis batas terluar dari properti yang akan didirikan.",
                    ),
                    ItemKalimat(
                      huruf: "G",
                      kata: "SJ",
                      deskripsi:
                          "Garis Sempadan Jalan, garis batas terdepan pagar bangunan yang telah ditetapkan dalam rencana kota.",
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: 20.0, left: 5.0, right: 5.0, bottom: 20.0),
                  color: Colors.grey,
                  child: SizedBox(
                      height: 1, width: MediaQuery.of(context).size.width),
                ),
                Column(
                  key: hKey,
                  children: <Widget>[
                    AwalanHuruf(huruf: "H"),
                    ItemKalimat(
                      huruf: "H",
                      kata: "ak Sewa",
                      deskripsi:
                          "Keterangan bukti penguasaan atas tanah namun bukan tanda bukti kepemilikan hak atas tanah. Dibuktikan dengan pembayaran pajak atas tanah.",
                    ),
                    ItemKalimat(
                      huruf: "H",
                      kata: "GB",
                      deskripsi:
                          "Hak Guna Bangunan adalah sertifikat atau kewenangan yang diberikan oleh pemerintah kepada perusahaan untuk mengelola sebuah lahan untuk dikelola oleh pengembang.\nBerbeda dengan SHM, untuk sertifikat jenis ini masa berlakunya harus diperpanjang jika memasuki masa 30 tahun. dengan masa perpanjangan maksimal 20 tahun.",
                    ),
                    ItemKalimat(
                      huruf: "H",
                      kata: "GU",
                      deskripsi:
                          "Hak Guna Usaha adalah hak yang diberikan kepada seseorang untuk melakukan kegiatan peternakan, perikanan serta perkebunan di atas tanah negara.\nBeda HGU dengan Hak Sewa ialah HGU hanya diterbitkan khusus untuk bisnis peternakan, perikanan dan juga perkebunan dengan luas lahan minimal 5 hektar.",
                    ),
                    ItemKalimat(
                      huruf: "H",
                      kata: "PL",
                      deskripsi:
                          "Hak menguasai dan mengolah tanah atau lahan yang dimiliki oleh negara, pemilik hak juga bisa menyerahkan kepada pihak ketiga untuk bersama-sama mengolah lahan.",
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: 20.0, left: 5.0, right: 5.0, bottom: 20.0),
                  color: Colors.grey,
                  child: SizedBox(
                      height: 1, width: MediaQuery.of(context).size.width),
                ),
                Column(
                  key: iKey,
                  children: <Widget>[
                    AwalanHuruf(huruf: "I"),
                    ItemKalimat(
                      huruf: "I",
                      kata: "MB",
                      deskripsi:
                          "Izin Mendirikan Bangunan. Diberikan kepada perorangan atau badan hukum sebagai landasan pelaksanaan kegiatan pembangunan properti.",
                    ),
                    ItemKalimat(
                      huruf: "I",
                      kata: "ndent",
                      deskripsi:
                          "Sistem pembelian dengan cara menunggu terlebih dahulu. Jika dalam pembelian properti, maka buyer harus menunggu hingga properti yang dibeli siap huni.",
                    ),
                    ItemKalimat(
                      huruf: "I",
                      kata: "nvestor",
                      deskripsi:
                          "Pembeli properti dengan motivasi untuik mencari keuntungan bukan untuk ditinggali.\nBiasanya investor properti akan mendapat keuntungan dari properti yang ia sewakan atau dijual kembali.",
                    ),
                    ItemKalimat(
                      huruf: "I",
                      kata: "PB",
                      deskripsi:
                          "Izin Penggunaaan Bangunan. Yaitu izin yang diberikan kepada perorangan atau badan hukum setelah pembangunan properti selesai sesuai IMB serta telah memenuhi syarat fungsi perlengkapan bangunan.",
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: 20.0, left: 5.0, right: 5.0, bottom: 20.0),
                  color: Colors.grey,
                  child: SizedBox(
                      height: 1, width: MediaQuery.of(context).size.width),
                ),
                Column(
                  key: kKey,
                  children: <Widget>[
                    AwalanHuruf(huruf: "K"),
                    ItemKalimat(
                      huruf: "K",
                      kata: "anto",
                      deskripsi:
                          "Kantor Toko adalah sebuah bangunan yang dibuat meninggi lebih dari satu lantai, bangunan ini pun memiliki dua fungsi yang berbeda, yakni satu lantai berfungsi sebagai kantor dan satu lagi sebagi toko.",
                    ),
                    ItemKalimat(
                      huruf: "K",
                      kata: "DB",
                      deskripsi:
                          "Koefisien Dasar Bangunan adalah angka persentase perbandingan antara luas seluruh area yang bisa dibangun dengan area yang tersedia.",
                    ),
                    ItemKalimat(
                      huruf: "K",
                      kata: "LB",
                      deskripsi:
                          "Koefisien Lantai Bangunan adalah persentase perbandingan antara luas lantai yang bisa dan boleh dibangun dengan luas area yang tersedia.\nKLB biasanya diberlakukan pada bangunan-bangunan yang tinggi karena dari nilai KLB dapat dilihat berapa jumlah total lantai yang bisa dibuat.",
                    ),
                    ItemKalimat(
                      huruf: "K",
                      kata: "MB",
                      deskripsi:
                          "Kelayakan Menggunakan Bangunan bisa juga disebut sebagai Sertifikat Laik Fungsi (SLF) merupakan izin yang diberikan oleh Pemerintah Daerah keoada sebuah bangunan yang baru saja dibangun.\nIzin ini diberikan setelah terlebih dahulu di periksa kondisi bangunan apakah benar-benar layak untuk digunakan.",
                    ),
                    ItemKalimat(
                      huruf: "K",
                      kata: "ondotel",
                      deskripsi:
                          "Kondominium hotel adalah proyek properti yang dibangun layaknya sebuah apartemen, namun bukan untuk ditinggali melainkan untuk disewa layaknya sebuah hotel.\nNantinya investorpun tidak perlu pusing untuk mencari penyewa, karena manajemen hotel yang akan mengurusinya.",
                    ),
                    ItemKalimat(
                      huruf: "K",
                      kata: "opel",
                      deskripsi:
                          "Dua rumah yang dibangun berderet dengan satu desain yang hanya dipisahkan oleh satu dinding dan hanya menggunakan satu atap.",
                    ),
                    ItemKalimat(
                      huruf: "K",
                      kata: "PA",
                      deskripsi:
                          "Kredit konsumen yang disediakan oleh bank dan memiliki tujuan khusus yakni untuk pembelian apartemen.",
                    ),
                    ItemKalimat(
                      huruf: "K",
                      kata: "PR",
                      deskripsi:
                          "Kredit konsumen yang disediakan oleh bank dan memiliki tujuan khusus yakni untuk pembelian rumah.",
                    ),
                    ItemKalimat(
                      huruf: "K",
                      kata: "PR Informal",
                      deskripsi:
                          "KPR Informal merupakan skema kredit yang disediakan oleh bank untuk mereka para pekerja non formal seperti wiraswastawan.",
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: 20.0, left: 5.0, right: 5.0, bottom: 20.0),
                  color: Colors.grey,
                  child: SizedBox(
                      height: 1, width: MediaQuery.of(context).size.width),
                ),
                Column(
                  key: lKey,
                  children: <Widget>[
                    AwalanHuruf(huruf: "L"),
                    ItemKalimat(
                      huruf: "L",
                      kata: "oss transaction",
                      deskripsi:
                          "Sebuah istilah yang lazim digunakan oleh para investor properti, istilah ini mengacu kepada kesalahan perhitungan ketika membeli properti, investor tidak memperhitungkan untuk mengeluarkan biaya pajak BPHTB, membayar broker, notaris dan lain-lain.",
                    ),
                    ItemKalimat(
                      huruf: "L",
                      kata: "TV",
                      deskripsi:
                          "Loan to Value. Yaitu rasio antara nilai kredit terhadap jaminan pada saat awal pemberian kredit.",
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: 20.0, left: 5.0, right: 5.0, bottom: 20.0),
                  color: Colors.grey,
                  child: SizedBox(
                      height: 1, width: MediaQuery.of(context).size.width),
                ),
                Column(
                  key: mKey,
                  children: <Widget>[
                    AwalanHuruf(huruf: "M"),
                    ItemKalimat(
                      huruf: "M",
                      kata: "asterplan",
                      deskripsi:
                          "Rencana dan kerangka pengembangan jangka panjang dari suatu proyek yang ada di suatu wilayah.",
                    ),
                    ItemKalimat(
                      huruf: "M",
                      kata: "ixed-used Development",
                      deskripsi:
                          "Suatu keadaan proyek properti yang menggabungkan beberapa fungsi sekaligus ke dalam satu lingkungan misalnya kantor dan tempat tinggal.",
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: 20.0, left: 5.0, right: 5.0, bottom: 20.0),
                  color: Colors.grey,
                  child: SizedBox(
                      height: 1, width: MediaQuery.of(context).size.width),
                ),
                Column(
                  key: nKey,
                  children: <Widget>[
                    AwalanHuruf(huruf: "N"),
                    ItemKalimat(
                      huruf: "N",
                      kata: "egotiator",
                      deskripsi:
                          "Petugas tahap ketiga dengan tugas berunding dengan owner mengenai harga dan cara serah terima serta melaporkan kepada investor / buyer yang bersangkutan.",
                    ),
                    ItemKalimat(
                      huruf: "N",
                      kata: "ice property",
                      deskripsi:
                          "Properti bernilai bagus dan menguntungkan dari segala sudut pandang seperti lokasi, pertumbuhan harga properti, dan sebagainya.",
                    ),
                    ItemKalimat(
                      huruf: "N",
                      kata: "JOP",
                      deskripsi:
                          "Nilai Jual Objek Pajak, yakni harga terendah atas sebuah properti. NJOP juga dimaknai sebagai nilai dasar pengenaan pajak bagi PBB yang ditetapkan negara.",
                    ),
                    ItemKalimat(
                      huruf: "N",
                      kata: "otaris",
                      deskripsi:
                          "Pejabat umum yang berwenang untuk membuat akta otentik dan kewenangan lainnya.",
                    ),
                    ItemKalimat(
                      huruf: "N",
                      kata: "PWP",
                      deskripsi:
                          "Nomor Pokok Wajib Pajak. NPWP berfungsi sebagai identitas seseorang dalam hal kewajiban dan hak pada bidang pajak.",
                    ),
                    ItemKalimat(
                      huruf: "N",
                      kata: "UP",
                      deskripsi:
                          "Nomor Urut Pemesanan adalah nomor urut yang diberikan kepada calon pembeli, untuk memilih unit rumah atau apartemen. yang baru dilaunching.",
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: 20.0, left: 5.0, right: 5.0, bottom: 20.0),
                  color: Colors.grey,
                  child: SizedBox(
                      height: 1, width: MediaQuery.of(context).size.width),
                ),
                Column(
                  key: oKey,
                  children: <Widget>[
                    AwalanHuruf(huruf: "O"),
                    ItemKalimat(
                      huruf: "O",
                      kata: "kupansi",
                      deskripsi:
                          "Tingkat penyewaan unit pada sebuah apartemen, hotel, perkantoran ataupun ruko.",
                    ),
                    ItemKalimat(
                      huruf: "O",
                      kata: "wner",
                      deskripsi: "Pemilik sebuah properti",
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: 20.0, left: 5.0, right: 5.0, bottom: 20.0),
                  color: Colors.grey,
                  child: SizedBox(
                      height: 1, width: MediaQuery.of(context).size.width),
                ),
                Column(
                  key: pKey,
                  children: <Widget>[
                    AwalanHuruf(huruf: "P"),
                    ItemKalimat(
                      huruf: "P",
                      kata: "BB",
                      deskripsi:
                          "Pajak Bumi dan Bangunan adalah Pajak Negara yang dikenakan terhadap bumi dan atau bangunan sebuah pajak yang bersifat kebendaan, artinya pajak terutang ditentukan oleh keadaan objek yaitu bumi/tanah dan atau bangunan.",
                    ),
                    ItemKalimat(
                      huruf: "P",
                      kata: "eruntukan",
                      deskripsi:
                          "Rancangan penggunaan dalam sebuah kawasan berdasarkan fungsi-fungsi tertentu contohnya seperti pemukiman, industri, perdagangan, perkantoran dan lain-lain.",
                    ),
                    ItemKalimat(
                      huruf: "P",
                      kata: "PAT",
                      deskripsi:
                          "Pejabat Pembuat Akta Tanah adalah pejabat umum yang diberikan kewenangan untuk membuat akta-akta otentik mengenai perbuatan hukum tertentu mengenai hak atas tanah atau Hak Milik Atas Satuan Rumah Susun.",
                    ),
                    ItemKalimat(
                      huruf: "P",
                      kata: "Ph",
                      deskripsi:
                          "Pajak Perolehan penghasilan, yakni pajak yang dikenakan terhadap subjek pajak terkait penghasilan yang diterima dalam tahun periode pajak.",
                    ),
                    ItemKalimat(
                      huruf: "P",
                      kata: "PJB",
                      deskripsi:
                          "Perjanjian pengikatan jual beli ialah perjanjian awal antara penjual dan pembeli sebuah properti. PPJB bersifat bawah tangan dan tidak melibatkan notaris atau PPAT.",
                    ),
                    ItemKalimat(
                      huruf: "P",
                      kata: "PN",
                      deskripsi:
                          "Pajak Pertambahan Nilai adalah pajak yang dikenakan oleh pemerintah atas sebuah transaksi jual beli dan berlaku untuk segala jenis jual beli, baik yang dilakukan oleh perseorangan ataupun badan.",
                    ),
                    ItemKalimat(
                      huruf: "P",
                      kata: "rimary market",
                      deskripsi:
                          "Properti baru yang dijualkan kepada pemilik pertama.",
                    ),
                    ItemKalimat(
                      huruf: "P",
                      kata: "roperty Crash",
                      deskripsi:
                          "Situasi dimana harga properti naik tajam atau turun cepat beriringan dengan situasi perekonomian.",
                    ),
                    ItemKalimat(
                      huruf: "P",
                      kata: "rosperous",
                      deskripsi:
                          "Wilayah yang mungkin memunculkan keuntungan jika dilakukan investasi properti.",
                    ),
                    ItemKalimat(
                      huruf: "P",
                      kata: "utusan Banding",
                      deskripsi:
                          "Keputusan yang dikeluarkan oleh pengadilan pajak terhadap suatu sengketa yang dialami penanggung pajak.",
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: 20.0, left: 5.0, right: 5.0, bottom: 20.0),
                  color: Colors.grey,
                  child: SizedBox(
                      height: 1, width: MediaQuery.of(context).size.width),
                ),
                Column(
                  key: rKey,
                  children: <Widget>[
                    AwalanHuruf(huruf: "R"),
                    ItemKalimat(
                      huruf: "R",
                      kata: "AB",
                      deskripsi:
                          "Rencana Anggaran Biaya adalah rincian perhitungan biaya yang dibutuhkan untuk sebuah proyek konstruksi, termasuk di dalamnya adalah biaya upah pegawai serta hal-hal lain yang mendetil.",
                    ),
                    ItemKalimat(
                      huruf: "R",
                      kata: "eady Stock",
                      deskripsi:
                          "Proyek properti (rumah, apartemen, ruko dan lain-lain) yang dijual dalam kondisi sudah terbangun dan siap untuk digunakan.",
                    ),
                    ItemKalimat(
                      huruf: "R",
                      kata: "ecession",
                      deskripsi:
                          "Kondisi saat terjadinya penurunan daya beli akan objek properti.",
                    ),
                    ItemKalimat(
                      huruf: "R",
                      kata: "efinancing (Pembiayaan Ulang)",
                      deskripsi:
                          "Langkah yang ditempuh oleh seseorang untuk mengatur ulang pembiayaan KPR yang sudah berjalan dengan sistem penghitungan ulang properti yang sudah dibeli.\nPengajuan refinancing ini bisa dilakukan ke bank yang sedang menjadi pemberi hutang KPR saat ini, bisa pula diajukan ke bank lain. Keuntungan dari refinancing atau pembiayaan ulang ini adalah pemohon bisa mendapatkan bunga pinjaman dan yang lebih rendah, serta jangka waktu pinjaman yang lebih lama.",
                    ),
                    ItemKalimat(
                      huruf: "R",
                      kata: "ukan",
                      deskripsi:
                          "Rumah Kantor adalah sebuah bangunan yang dibuat meninggi lebih dari satu lantai, pada bagian bawah bangunan ini biasanya berfungsi sebagai kantor.",
                    ),
                    ItemKalimat(
                      huruf: "R",
                      kata: "uko",
                      deskripsi:
                          "Rumah Toko merupakan sebuah bangunan yang biasanya dibuat lebih dari satu lantai atau bertingkat, pada bagian bawahnya biasanya digunakan untuk usaha dan bagian atasnya digunakan sebagai tempat tinggal.",
                    ),
                    ItemKalimat(
                      huruf: "R",
                      kata: "usunami",
                      deskripsi:
                          "Rumah Susun Sederhana Milik. Sering disebut juga 'Apartemen Bersubsidi'.",
                    ),
                    ItemKalimat(
                      huruf: "R",
                      kata: "usunawa",
                      deskripsi: "Rumah Susun Sederhana Sewa.",
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: 20.0, left: 5.0, right: 5.0, bottom: 20.0),
                  color: Colors.grey,
                  child: SizedBox(
                      height: 1, width: MediaQuery.of(context).size.width),
                ),
                Column(
                  key: sKey,
                  children: <Widget>[
                    AwalanHuruf(huruf: "S"),
                    ItemKalimat(
                      huruf: "S",
                      kata: "BDK",
                      deskripsi:
                          "Suku Bunga Dasar Kredit atau dalam Bahasa Inggris disebut Prime Lending Rate ialah suku bunga yang paling rendah atau suku bunga dasar yang digunakan sebagai dasar perhitungan suatu kredit.\nBesarnya SBDK sendiri ditentukan oleh BI.",
                    ),
                    ItemKalimat(
                      huruf: "S",
                      kata: "cout",
                      deskripsi:
                          "Petugas peninjau lokasi properti yang bertugas mencari tanah / properti, mengumpulkan data di lapangan dan melaporkan hasilnya kepada surveyor.",
                    ),
                    ItemKalimat(
                      huruf: "S",
                      kata: "econdary Market",
                      deskripsi:
                          "Properti yang pernah digunakan (bekas) yang kemudian dijual kembali.",
                    ),
                    ItemKalimat(
                      huruf: "S",
                      kata: "erah Terima",
                      deskripsi:
                          "Proses pemberian dan penyerahan kunci properti dari penjual kepada pembeli pada waktu yang telah ditentukan sebelumnya.",
                    ),
                    ItemKalimat(
                      huruf: "S",
                      kata: "ervice charge",
                      deskripsi:
                          "Biaya tambahan yang harus dikeluarkan oleh pemilik atau penyewa suatu properti (biasanya dikenakan kepada pemilik atau penyewa apartemen, kantor serta properti komersial lain) untuk layanan yang diberikan pengelola.\nService charge ini dihitung per meter persegi.",
                    ),
                    ItemKalimat(
                      huruf: "S",
                      kata: "HGB",
                      deskripsi:
                          "Sertifikat Hak Guna Bangunan adalah kewenanangan untuk mengolah sebuah lahan yang diberikan oleh pemerintah atau satu pihak untuk digunakan hingga 30 tahun dan dapat diperpanjang kembali hingga maksimal 20 tahun.",
                    ),
                    ItemKalimat(
                      huruf: "S",
                      kata: "HM",
                      deskripsi:
                          "Suatu pernyataan legalitas mengenai kepemilikan seseorang terhadap satu properti (misal: Rumah, Tanah atau Ruko).\nSHM juga dikenal masyarakat luas sebagai legalitas tertinggi dalam kepemilikan. Karena dengan adanya SHM, maka itu berarti tidak ada lagi campur tangan orang lain selain yang namanya tertulis dalam surat.",
                    ),
                    ItemKalimat(
                      huruf: "S",
                      kata: "inking fund",
                      deskripsi:
                          "Biasa disebut sebagai biaya perawatan ialah biaya yang dikeluarkan oleh penyewa suatu properti (apartemen, kantor, atau properti komersial lain) dan dibayarkan kepada pengelola.\nUang tersebut nantinya akan digunakan untuk perawatan fasilitas-fasilitas umum yang rusak misalnya jika satu saat lift rusak atau instalasi air butuh perbaikan.",
                    ),
                    ItemKalimat(
                      huruf: "S",
                      kata: "IPPT",
                      deskripsi:
                          "Surat Izin Penunjukan Penggunaan Tanah. Merupakan izin dari pemerintah (gubernur) terhadap penggunaan tanah bagi bangunan dengan kepemilikan luas tanah 5.000 m2 atau lebih.",
                    ),
                    ItemKalimat(
                      huruf: "S",
                      kata: "ite plan (rencana tapak)",
                      deskripsi:
                          "Sebuah gambar (biasanya dalam bentuk dua dimensi) yang berisikan tentang rancanangan pembangunan pada sebuah tanah kavling, bangunan ataupun kawasan.\nGambar ini dibuat sangat terperinci lengkap dengan jalan utama, saluran air pembuangan, listrik, fasilitas umum dan fasilitas sosial.",
                    ),
                    ItemKalimat(
                      huruf: "S",
                      kata: "IUP",
                      deskripsi:
                          "Surat Izin Usaha Perdagangan adalah surat yang diberikan oleh pejabat setempat kepada pengusaha untuk melaksanakan sebuah usaha.",
                    ),
                    ItemKalimat(
                      huruf: "S",
                      kata: "KK",
                      deskripsi:
                          "Surat Keputusan Keberatan yaitu surat keputusan atas keberatan terhadap Surat Ketetapan Bea Perolehan Hak atas Tanah dan Bangunan Kurang Bayar, Surat Ketetapan Bea Perolehan Hak atas Tanah dan Bangunan Kurang Bayar Tambahan, Surat Ketetapan Bea Perolehan Hak atas Tanah dan Bangunan Lebih Bayar, atau Surat Ketetapan Bea Perolehan Hak atas Tanah dan Bangunan Nihil yang diajukan oleh Wajib Pajak.",
                    ),
                    ItemKalimat(
                      huruf: "S",
                      kata: "KP",
                      deskripsi:
                          "Surat Keputusan Pembetulan yaitu surat keputusan untuk membetulkan kesalahan tulis, hitung dan atau kekeliruan dalam penerapan ketentuan Perppu perpajakan yang terdapat dalam Surat Ketetapan Bea Perolehan Hak atas Tanah dan Bangunan Kurang Bayar, Surat Ketetapan Bea Perolehan Hak atas Tanah dan Bangunan Kurang Bayar Tambahan, Surat Ketetapan Bea Perolehan Hak atas Tanah dan Bangunan Lebih Bayar, Surat Ketetapan Bea Perolehan Hak atas Tanah dan Bangunan Nihil, atau Surat Tagihan Bea Perolehan Hak atas Tanah dan Bangunan.",
                    ),
                    ItemKalimat(
                      huruf: "S",
                      kata: "MF",
                      deskripsi:
                          "Secondary Mortgage Facility yaitu lembaga yang memberikan loan kepada bank-bank pemberi KPR dengan jaminan KPR itu sendiri.\nSistem ini bertujuan untuk mengatasi keterbatasan dana dalam rangka kredit kepemilikan rumah bagi masyarakat, yang disalurkan melalui Bank pemberi KPR.",
                    ),
                    ItemKalimat(
                      huruf: "S",
                      kata: "MM",
                      deskripsi:
                          "Secondary Mortgage Market atau pembiayaan sekunder perumahan adalah suatau perusahaan yang dibuat untuk membeli suatu kredit pemilikan rumah (KPR) dari bank kreditur yang kemudian tagihan ini dikemas dalam suatu efek hutang yang kemudian dijual kepada investor seperti misalnya perusahaan asuransi atapun investor perorangan.",
                    ),
                    ItemKalimat(
                      huruf: "S",
                      kata: "OHO",
                      deskripsi:
                          "Small Office Home Office yakni tipe properti yang menggabungkan fungsi hunian dengan area bisnis/perkantoran untuk menunjang aktivitas usaha/bisnis penghuni.\nBerbeda dengan ruko, SOHO dibangun di lingkungan yang tidak jauh dari pusat bisnis di perkotaan.",
                    ),
                    ItemKalimat(
                      huruf: "S",
                      kata: "pekulan",
                      deskripsi:
                          "Sebuah tindahakan membeli properti untuk mencari keuntungan tanpa memperhitungkan dengan matang resiko yang akan dihadapi.",
                    ),
                    ItemKalimat(
                      huruf: "S",
                      kata: "POP",
                      deskripsi:
                          "Surat Pemberitahuan Objek Pajak. Yakni sarana bagi wajib pajak untuk mendaftarkan objek pajak yang akan dipakai sebagai dasar untuk menghitung Pajak Bumi dan Bangunan (PBB) yang terutang.",
                    ),
                    ItemKalimat(
                      huruf: "S",
                      kata: "PPT",
                      deskripsi:
                          "Surat Pemberitahuan Pajak Terutang. Yakni surat keputusan kepala KPP mengenai pajak terutang yang harus dibayar dalam satu tahun pajak.",
                    ),
                    ItemKalimat(
                      huruf: "S",
                      kata: "trata title",
                      deskripsi:
                          "Hak milik atas unit rumah susun atau apartemen yang juga merupakan kepemilikan bersama atas suatu komplek bangunan dan terdiri dari hak eksklusif untuk ruang pribadi serta hak bersama di ruang publik (misal taman, kolam renang, dan lain-lain).",
                    ),
                    ItemKalimat(
                      huruf: "S",
                      kata: "unrise property",
                      deskripsi:
                          "Istilah untuk menyebutkan suatu area atau kawasan mempunyai potensi yang menjanjikan untuk lima tahun ke depan.\nPotensi cerah tersebut ditandai dengan tingkat pertumbuhan di atas rata-rata kenaikan tanah atau pembangunan infrastruktur di area tersebut.",
                    ),
                    ItemKalimat(
                      huruf: "S",
                      kata: "unset property",
                      deskripsi:
                          "Istilah untuk menyebutkan sebuah area atau kawasan yang diprediksikan tidak memiliki potensi yang baik untuk innvestasi properti.\nHal tersebut ditandainya dengan tidak banyaknya jumlah penduduk serta harga tanah yang tidak berkembang.",
                    ),
                    ItemKalimat(
                      huruf: "S",
                      kata: "uperblok",
                      deskripsi:
                          "Kawasan kota mandiri yang menggabungkan area perumahan, area perkantoran, area perdagangan, tempat rekreasi dan lain-lain.",
                    ),
                    ItemKalimat(
                      huruf: "S",
                      kata: "upply",
                      deskripsi:
                          "Ketersediaan jumlah berapa buah properti yang tersedia untuk memenuhi permintaan atau demand dari customer.\nBisa juga merupakan aktivitas untuk memenuhi jumlah kebutuhan properti yang diincar oleh customer.",
                    ),
                    ItemKalimat(
                      huruf: "S",
                      kata: "urveyor",
                      deskripsi:
                          "Seseorang yang bertugas meninjau lokasi properti secara langsung, mengkonfirmasi data yang diterima dari Scout, bertemu dengan owner dan mengecek keabsahan sertifikat di Notaris / BPT / Kecamatan / Kelurahan. Sering disebut sebagai petugas tahap kedua.",
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: 20.0, left: 5.0, right: 5.0, bottom: 20.0),
                  color: Colors.grey,
                  child: SizedBox(
                      height: 1, width: MediaQuery.of(context).size.width),
                ),
                Column(
                  key: tKey,
                  children: <Widget>[
                    AwalanHuruf(huruf: "T"),
                    ItemKalimat(
                      huruf: "T",
                      kata: "DP",
                      deskripsi:
                          "Tanda Daftar Perusahaan yakni diberikan pemerintah kepada perusaahaan yang telah divalidasi pendaftarannya.",
                    ),
                    ItemKalimat(
                      huruf: "T",
                      kata: "eknik Sipil",
                      deskripsi:
                          "Pekerjaan dengan tugas merencanakan kekuatan dan cara menghemat bangunan serta tentang manajemen pelaksanaan pembangunan.",
                    ),
                    ItemKalimat(
                      huruf: "T",
                      kata: "enor",
                      deskripsi: "Jangka waktu pembayaran cicilan kredit.",
                    ),
                    ItemKalimat(
                      huruf: "T",
                      kata: "op-up",
                      deskripsi:
                          "Meningkatkan batas tertinggi kredit pinjaman.",
                    ),
                    ItemKalimat(
                      huruf: "T",
                      kata: "opping off",
                      deskripsi:
                          "Pemasangan atap bangunan sebagai simbol akhir proses konstruksi.",
                    ),
                    ItemKalimat(
                      huruf: "T",
                      kata: "urn key",
                      deskripsi:
                          "Serah terima kunci, merupakan moment dimana penyerahan kunci proyek properti baik rumah, apartemen ataupun ruko dari developer ke pada customer.",
                    ),
                    ItemKalimat(
                      huruf: "T",
                      kata: "urn Over",
                      deskripsi: "Proyeksi waktu balik modal sebuah investasi.",
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: 20.0, left: 5.0, right: 5.0, bottom: 20.0),
                  color: Colors.grey,
                  child: SizedBox(
                      height: 1, width: MediaQuery.of(context).size.width),
                ),
                Column(
                  key: uKey,
                  children: <Widget>[
                    AwalanHuruf(huruf: "U"),
                    ItemKalimat(
                      huruf: "U",
                      kata: "rban",
                      deskripsi:
                          "Kawasan yang difungsikan sebagai tempat permukiman perkotaan, pemerintahan, pelayanan sosial dan bisnis.",
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: 20.0, left: 5.0, right: 5.0, bottom: 20.0),
                  color: Colors.grey,
                  child: SizedBox(
                      height: 1, width: MediaQuery.of(context).size.width),
                ),
                Column(
                  key: yKey,
                  children: <Widget>[
                    AwalanHuruf(huruf: "Y"),
                    ItemKalimat(
                      huruf: "Y",
                      kata: "ield",
                      deskripsi:
                          "Keuntungan yang dihitung dari nilai sewa properti per tahun dibandingkan dengan harga properti. Kisaran yield per tahun berbeda dari masing-masing tipe properti.",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: (_showBackToTopButton)
            ? FloatingActionButton(
                onPressed: _scrollToTop,
                child: Icon(Icons.arrow_upward),
              )
            : null);
  }
}

class AwalanHuruf extends StatelessWidget {
  final String huruf;

  AwalanHuruf({this.huruf});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 50.0,
        decoration: new BoxDecoration(
            color: kRedColor,
            borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(20.0),
                bottomLeft: const Radius.circular(20.0))),
        child: Container(
          margin: EdgeInsets.only(left: 10.0),
          child: Text(
            huruf,
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class ItemKalimat extends StatelessWidget {
  final String huruf;
  final String kata;
  final String deskripsi;

  ItemKalimat({this.huruf, this.kata, this.deskripsi});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            margin:
                EdgeInsets.only(top: 15.0, left: 5.0, right: 5.0, bottom: 5.0),
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: huruf,
                    style: TextStyle(
                        color: kRedColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: kata,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 5.0, right: 5.0),
          child: Text(deskripsi),
        ),
      ],
    );
  }
}

class ItemHuruf extends StatelessWidget {
  final String huruf;

  ItemHuruf({this.huruf});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 40.0,
      height: 40.0,
      decoration: new BoxDecoration(
          color: kPrimaryColor,
          borderRadius: new BorderRadius.all(Radius.circular(4.0))),
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 4.0, bottom: 4.0),
      child: Text(
        huruf,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
    );
  }
}
