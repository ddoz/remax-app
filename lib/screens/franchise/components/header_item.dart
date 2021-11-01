import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remax_app/screens/franchise/components/content_franchise.dart';
import 'package:remax_app/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemHeaderFranchise extends StatefulWidget {
  @override
  State<ItemHeaderFranchise> createState() => _ItemHeaderFranchiseState();
}

class _ItemHeaderFranchiseState extends State<ItemHeaderFranchise> {
  String label_whyUs = "";
  String label_headerItem1Title = "";
  String label_headerItem1Body = "";
  String label_headerItem2Title = "";
  String label_headerItem2Body = "";
  String label_headerItem3Title = "";
  String label_headerItem3Body = "";
  String label_headerItem4Title = "";
  String label_headerItem4Body = "";
  String label_headerItem5Title = "";
  String label_headerItem5Body = "";
  String label_headerItem6Title = "";
  String label_headerItem6Body = "";
  String labeling = "";
  String labeling_body = "";
  String bahasa = "";
  String label_readMore = "";
  String label_kantor = "";

  getPrefBahasa() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getString("bahasa") != null) {
      print(preferences.getString("bahasa"));
      if (preferences.getString("bahasa") == "en") {
        label_readMore = "Read More";
        label_kantor = "Own a RE/MAX Office";
        label_whyUs = "Why US";
        label_headerItem1Title = "Real Estate Leader";
        label_headerItem1Body = "Across the world, the network of RE/MAX is in more than 115 countries and supported by more than 135,000 trusted marketing associates. With the power of this network, RE/MAX has become the leader in real estate industry, providing world class service and achieving maximum results. Together with RE/MAX, you have the opportunity to expand your business, not only nationally, but also internationally.";
        label_headerItem2Title = "Global Family";
        label_headerItem2Body = "RE/MAX builds a tight family culture which synergize and bring the best of each other so parties can achieve maximum results. Each year, RE/MAX held an Asia Pacific convention amongst the region and a global convention in the United States of America so each member can build its network, learn from each other, and compete to be the best";
        label_headerItem3Title = "Entrepreneurial Concept";
        label_headerItem3Body = "The RE/MAX business is built on a entrepreneurial concept. This lucrative business can be built as big as an empire and can be passed down to generations. Even though it is an entrepreneurial concept, with RE/MAX, you are never alone. RE/MAX provides support, training and continuance guidance to assist you in achieving your goal.";
        label_headerItem4Title = "Technology Excellence";
        label_headerItem4Body = "RE/MAX technologies create business opportunities between agents and clients. The Genius System is designed to be user friendly and will increase the effectiveness and efficiency of your business.";
        label_headerItem5Title = "Structured Education and Trainings";
        label_headerItem5Body = "RE/MAX offers a wide range of training programs designed specifically for business owners and marketing associates. LEAD and Momentum training for business owners and Start Up, Fire Up and Bootcamp for marketing associates are proven to increase productivities when carried out and applied correctly. In addition, members of RE/MAX has access to RE/MAX University which provide a wide range of visual training materials on real estate related topics. Through structured and ongoing training, skilful marketing associates or business owners together, can achieve success in the real estate business";
        label_headerItem6Title = "With RE/MAX, Achieve Maximum Results";
        label_headerItem6Body = "RE/MAX is the best partner to achieving success in your property business. We concentrate on the process from start to close of transaction. RE/MAX is committed to providing full support in a professional manner to you as a business partner. Your success is our success.";
      } else {
        label_readMore = "Baca lebih lanjut";
        label_kantor = "Miliki Kantor RE/MAX";
        label_whyUs = "Mengapa Kita";
        label_headerItem1Title = "Pemimpin di Bidang Real estat";
        label_headerItem1Body = "Di seluruh dunia, RE/MAX berada di lebih dari 115 negara dan lebih dari 135,000 marketing associate terpercaya. Dengan kekuatan jaringan ini, RE/MAX menjadi pemimpin dalam industri real estate berskala dunia dengan memberikan pelayanan berkualitas dunia dan meraih hasil yang maksimal. Bersama dengan RE/MAX, anda memiliki peluang untuk mengembangkan bisnis anda tidak hanya secara nasional tetapi secara internasional.";
        label_headerItem2Title = "RE/MAX Adalah Keluarga Dunia";
        label_headerItem2Body = "RE/MAX memiliki kultur kekeluargaan yang erat dimana setiap personnel saling membangun dan membantu satu dengan yang lain agar dapat sama–sama mencapai hasil yang maksimal. Setiap tahun, RE/MAX mengadakan satu kali pertemuan antara negara Asia Pasifik dan satu kali pertemuan seluruh dunia di Amerika Serikat agar setiap anggotanya dapat membangun jaringan bisnis yang kuat, belajar dari satu dan yang lainnya, dan saling berkompetisi.";
        label_headerItem3Title = "Konsep Kewirausahawan Mandiri";
        label_headerItem3Body = "Usaha RE/MAX didasarkan dengan konsep kewirausahaan mandiri. Usaha yang sangat menggiurkan ini dapat dibangun menjadi usaha yang sangat besar dan luas dan dapat diwariskan ke generasi penerus. Walaupun berjalan dalam konsep kewirausahawaan, bersama RE/MAX anda tidak akan pernah sendirian. RE/MAX selalu siap untuk memberikan dukungan, pelatihan, dan bimbingan yang berkesinambungan agar anda mencapai cita-cita anda.";
        label_headerItem4Title = "Keunggulan Teknologi";
        label_headerItem4Body = "Teknologi RE/MAX menciptakan peluang usaha yang sangat besar diantara marketing associate dan klien. Teknologi Genius milik RE/MAX dirancang agar ramah pengguna dan dapat meningkatkan efektivitas dan efisiensi usaha anda.";
        label_headerItem5Title = "Pendidikan Dan Pelatihan Terstruktur";
        label_headerItem5Body = "RE/MAX menawarkan berbagai macam pelatihan dan program bimbingan usaha sebagai sarana pelatihan untuk para marketing associate dan business owner. Program LEAD dan Momentum bagi business owners serta Start Up, Fire Up, dan Bootcamp bagi marketing associate telah terbukti dapat meningkatkan produktifitas jika dilakukan dan diterapkan dengan benar. RE/MAX menyediakan pelatihan dan aktifitas praktis yang mudah diterapkan untuk para marketing associate dan business owner yang dibawakan oleh praktisi melalui kelas-kelas yang berkesinambungan. Selain itu, para anggota juga memiliki akses ke Universitas RE/MAX yang menyediakan berbagai materi pelatihan visual tentang berbagai aspek dalam real estat. Melalui pelatihan yang terstruktur dan berkesinambungan, marketing associate atau business owner yang handal dapat bersama-sama mencapai kesuksesan dalam bisnis properti.";
        label_headerItem6Title = "Bersama RE/MAX, Mencapai Hasil Yang Maksimal";
        label_headerItem6Body = "RE/MAX adalah rekan terbaik dalam mencapai kesuksesan dalam usaha properti. Kami berkonsentrasi pada proses dari permulaan hingga penyelesaian transaksi. RE/MAX berkomitmen untuk memberikan dukungan penuh secara profesional kepada anda sebagai rekan usaha. Kesuksesan anda adalah kesuksesan kami.";
      }
      setState(() {
        labeling = labeling;
        labeling_body = labeling_body;
        bahasa = preferences.getString("bahasa");
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getPrefBahasa();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(top: 5.0, left: 15.0),
            child: new Align(
              alignment: Alignment.centerLeft,
              child: new Text(
                label_whyUs,
                style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          new Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(left: 15.0, top: 5.0, bottom: 20.0),
              width: 35,
              height: 2,
              color: Colors.white,
            ),
          ),
          Container(
              margin: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () async {
                          await showDialog(
                            builder: (_) => ImageDialog(
                                'assets/images/fr_hi_1.png',
                                label_headerItem1Title,
                                label_headerItem1Body),
                            context: context,
                          );
                        },
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width * 0.4,
                          color: Colors.black.withOpacity(0.4),
                          margin: EdgeInsets.all(2),
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  label_headerItem1Title,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  label_readMore,
                                  style: TextStyle(
                                    color: kTxtReadMore,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await showDialog(
                            builder: (_) => ImageDialog(
                                'assets/images/fr_hi_2.png',
                                label_headerItem2Title,
                                label_headerItem2Body),
                            context: context,
                          );
                        },
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width * 0.4,
                          color: Colors.black.withOpacity(0.4),
                          margin: EdgeInsets.all(2),
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  label_headerItem2Title,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  label_readMore,
                                  style: TextStyle(
                                    color: kTxtReadMore,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () async {
                          await showDialog(
                            builder: (_) => ImageDialog(
                                'assets/images/fr_hi_3.png',
                                label_headerItem3Title,
                                label_headerItem3Body),
                            context: context,
                          );
                        },
                        child: Container(
                          height: 130,
                          width: MediaQuery.of(context).size.width * 0.4,
                          color: Colors.black.withOpacity(0.4),
                          margin: EdgeInsets.all(2),
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  label_headerItem3Title,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  label_readMore,
                                  style: TextStyle(
                                    color: kTxtReadMore,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await showDialog(
                            builder: (_) => ImageDialog(
                                'assets/images/fr_hi_4.png',
                                label_headerItem4Title,
                                label_headerItem4Body),
                            context: context,
                          );
                        },
                        child: Container(
                          height: 130,
                          width: MediaQuery.of(context).size.width * 0.4,
                          color: Colors.black.withOpacity(0.4),
                          margin: EdgeInsets.all(2),
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  label_headerItem4Title,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  label_readMore,
                                  style: TextStyle(
                                    color: kTxtReadMore,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () async {
                          await showDialog(
                            builder: (_) => ImageDialog(
                                'assets/images/fr_hi_5.png',
                                label_headerItem5Title,
                                label_headerItem5Body),
                            context: context,
                          );
                        },
                        child: Container(
                          height: 110,
                          width: MediaQuery.of(context).size.width * 0.4,
                          color: Colors.black.withOpacity(0.4),
                          margin: EdgeInsets.all(2),
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  label_headerItem5Title,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  label_readMore,
                                  style: TextStyle(
                                    color: kTxtReadMore,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await showDialog(
                            builder: (_) => ImageDialog(
                                'assets/images/fr_hi_6.png',
                                label_headerItem6Title,
                                label_headerItem6Body),
                            context: context,
                          );
                        },
                        child: Container(
                          height: 110,
                          width: MediaQuery.of(context).size.width * 0.4,
                          color: Colors.black.withOpacity(0.4),
                          margin: EdgeInsets.all(2),
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  label_headerItem6Title,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  label_readMore,
                                  style: TextStyle(
                                    color: kTxtReadMore,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(20.0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)),
                      onPressed: () async {
                        await showDialog(
                          builder: (_) => ImageDialogKantor(),
                          context: context,
                        );
                      },
                      color: Colors.white,
                      textColor: kRedGradient,
                      child: Text(label_kantor,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class ImageDialog extends StatelessWidget {
  final String assets;
  final String judul;
  final String deskripsi;

  ImageDialog(this.assets, this.judul, this.deskripsi);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(assets),
                Container(
                  margin: EdgeInsets.only(top: 20.0, left: 15.0),
                  child: Text(
                    judul,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: kAppBarColorTheme),
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(15.0),
                    child: Text(deskripsi, style: TextStyle(fontSize: 13.0)))
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: kRedColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(14.0),
                    ),
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
