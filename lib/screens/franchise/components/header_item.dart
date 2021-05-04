import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remax_app/screens/franchise/components/content_franchise.dart';
import 'package:remax_app/util/constants.dart';

class ItemHeaderFranchise extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(
                top: 5.0, left: 15.0),
            child: new Align(
              alignment: Alignment.centerLeft,
              child: new Text(
                'Why Us',
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
                              'Pemimpin di Bidang Real estat',
                              'Di seluruh dunia, RE/MAX berada di lebih dari 115 negara dan lebih dari 125,000 marketing associate terpercaya. Dengan kekuatan jaringan ini, RE/MAX menjadi pemimpin dalam industri real estate berskala dunia dengan memberikan pelayanan berkualitas dunia dan meraih hasil yang maksimal. Bersama dengan RE/MAX, anda memiliki peluang untuk mengembangkan bisnis anda tidak hanya secara nasional tetapi secara internasional.'),
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
                              child: Text('Real Estate Leader', style: TextStyle(
                                color: Colors.white,
                              ),),
                            ),
                            Spacer(),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.all(5),
                              child: Text('Read More', style: TextStyle(
                                color: kTxtReadMore,
                              ),),
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
                              'RE/MAX Adalah Keluarga Dunia',
                              'RE/MAX memiliki kultur kekeluargaan yang erat dimana setiap personnel saling membangun dan membantu satu dengan yang lain agar dapat sama–sama mencapai hasil yang maksimal. \nSetiap tahun, RE/MAX mengadakan satu kali pertemuan antara negara Asia Pasifik dan satu kali pertemuan seluruh dunia di Amerika Serikat agar setiap anggotanya dapat membangun jaringan bisnis yang kuat, belajar dari satu dan yang lainnya, dan saling berkompetisi'),
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
                              child: Text('Global Family', style: TextStyle(
                                color: Colors.white,
                              ),),
                            ),
                            Spacer(),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.all(5),
                              child: Text('Read More', style: TextStyle(
                                color: kTxtReadMore,
                              ),),
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
                              'Konsep Kewirausahawan Mandiri',
                              'Usaha RE/MAX didasarkan dengan konsep kewirausahaan mandiri. Usaha yang sangat menggiurkan ini dapat dibangun menjadi usaha yang sangat besar dan luas dan dapat diwariskan ke generasi penerus. Walaupun berjalan dalam konsep kewirausahawaan, bersama RE/MAX anda tidak akan pernah sendirian. '),
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
                              child: Text('Entrepreneurial Concept', style: TextStyle(
                                color: Colors.white,
                              ),),
                            ),
                            Spacer(),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.all(5),
                              child: Text('Read More', style: TextStyle(
                                color: kTxtReadMore,
                              ),),
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
                              'Keunggulan Teknologi',
                              'Teknologi RE/MAX menciptakan peluang usaha yang sangat besar diantara marketing associate dan klien. Teknologi Genius milik RE/MAX dirancang agar ramah pengguna dan dapat meningkatkan efektivitas dan efisiensi usaha anda.'),
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
                              child: Text('Technology Excellence', style: TextStyle(
                                color: Colors.white,
                              ),),
                            ),
                            Spacer(),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.all(5),
                              child: Text('Read More', style: TextStyle(
                                color: kTxtReadMore,
                              ),),
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
                              'Pendidikan Dan Pelatihan Terstruktur ',
                              'RE/MAX menawarkan berbagai macam pelatihan dan program bimbingan usaha sebagai sarana pelatihan untuk para marketing associate dan business owner. \nProgram LEAD dan Momentum bagi business owners serta Start Up, Fire Up, dan Bootcamp bagi marketing associate telah terbukti dapat meningkatkan produktifitas jika dilakukan dan diterapkan dengan benar.'),
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
                              child: Text('Structured Education and Trainings', style: TextStyle(
                                color: Colors.white,
                              ),),
                            ),
                            Spacer(),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.all(5),
                              child: Text('Read More', style: TextStyle(
                                color: kTxtReadMore,
                              ),),
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
                              'Bersama RE/MAX, Mencapai Hasil Yang Maksimal',
                              'RE/MAX adalah rekan terbaik dalam mencapai kesuksesan dalam usaha properti. Kami berkonsentrasi pada proses dari permulaan hingga penyelesaian transaksi. RE/MAX berkomitmen untuk memberikan dukungan penuh secara profesional kepada anda sebagai rekan usaha. Kesuksesan anda adalah kesuksesan kami.'),
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
                              child: Text('With RE/MAX, Achieve Maximum Results', style: TextStyle(
                                color: Colors.white,
                              ),),
                            ),
                            Spacer(),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.all(5),
                              child: Text('Read More', style: TextStyle(
                                color: kTxtReadMore,
                              ),),
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
                        builder: (_) =>
                            ImageDialogKantor(
                            'assets/images/fr_ct_4.png',
                            'Bootcamp',
                            'Teknologi RE/MAX menciptakan peluang usaha yang sangat besar diantara marketing associate dan klien. Teknologi Genius milik RE/MAX dirancang agar ramah pengguna dan dapat meningkatkan efektivitas dan efisiensi usaha anda.'),
                        context: context,
                      );
                    },
                    color: Colors.white,
                    textColor: kRedGradient,
                    child: Text("Miliki Kantor RE/MAX",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            )
          )
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
