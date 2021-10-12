import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:remax_app/util/constants.dart';

class Partner extends StatelessWidget {
  final CarouselController _controller = CarouselController();
  final List<String> imgList = [
    'https://genius.remax.co.id/papi/Bank/crud/64/links/mbnkFileId/215721',
    'https://genius.remax.co.id/papi/Bank/crud/63/links/mbnkFileId/214295',
    'https://genius.remax.co.id/papi/bank/crud/62/links/mbnkFileId/213720',
    'https://genius.remax.co.id/papi/bank/crud/59/links/mbnkFileId/206923',
    'https://genius.remax.co.id/papi/bank/crud/57/links/mbnkFileId/121682',
    'https://genius.remax.co.id/papi/Bank/crud/56/links/mbnkFileId/121681',
    'https://genius.remax.co.id/papi/Bank/crud/55/links/mbnkFileId/121680',
    'https://genius.remax.co.id/papi/Bank/crud/54/links/mbnkFileId/121679',
    'https://genius.remax.co.id/papi/Bank/crud/53/links/mbnkFileId/121678',
    'https://genius.remax.co.id/papi/Bank/crud/51/links/mbnkFileId/121676',
    'https://genius.remax.co.id/papi/Bank/crud/50/links/mbnkFileId/121675',
    'https://genius.remax.co.id/papi/Bank/crud/48/links/mbnkFileId/121673',
    'https://genius.remax.co.id/papi/Bank/crud/47/links/mbnkFileId/121672',
    'https://genius.remax.co.id/papi/Bank/crud/46/links/mbnkFileId/121671',
    'https://genius.remax.co.id/papi/Bank/crud/45/links/mbnkFileId/121670',
    'https://genius.remax.co.id/papi/Bank/crud/44/links/mbnkFileId/121669',
    'https://genius.remax.co.id/papi/Bank/crud/43/links/mbnkFileId/121668',
    'https://genius.remax.co.id/papi/Bank/crud/42/links/mbnkFileId/121667',
    'https://genius.remax.co.id/papi/Bank/crud/41/links/mbnkFileId/121666',
    'https://genius.remax.co.id/papi/Bank/crud/40/links/mbnkFileId/121665',
    'https://genius.remax.co.id/papi/bank/crud/22/links/mbnkFileId/121664'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                  initialPage: 0,
                  height: 80,
                  viewportFraction: 0.4,
                  enlargeCenterPage: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 4),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                ),
                items: imgList.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(0),
                          margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: Image.network(i, fit: BoxFit.fill),
                        ),
                      );
                    },
                  );
                }).toList()),
          ],
        ));
  }
}

class PartnerCard extends StatelessWidget {
  const PartnerCard({
    Key key,
    this.image,
    this.press,
  }) : super(key: key);
  final String image;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding / 2,
        ),
        width: size.width * 0.4,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
