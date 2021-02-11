import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  BuildContext context;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  static final List<String> imgSlider = [
    '241006',
    '241007',
    '241008',
    '241009',
    '241010'
  ];

  final CarouselSlider autoPlayImage = CarouselSlider(
      items: imgSlider.map((fileImage) {
        return Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: GestureDetector(
              child: Image.network(
                'https://genius.remax.co.id/papi/Listing/crud/46330/links/ListingFile/${fileImage}',
                width: 10000,
                fit: BoxFit.cover,
              ),
              onTap: () async {
                await showDialog(
                  builder: (_) => ImageDialog(
                      'https://genius.remax.co.id/papi/Listing/crud/46330/links/ListingFile/${fileImage}'),
                  context: DetailPage().context,
                );
              },
            ),
          ),
        );
      }).toList(),
      height: 150,
      autoPlay: true,
      enlargeCenterPage: true,
      aspectRatio: 2.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        children: <Widget>[
          CarouselSlider(
              items: imgSlider.map((fileImage) {
                return Container(
                  margin: EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: GestureDetector(
                      child: Image.network(
                        'https://genius.remax.co.id/papi/Listing/crud/46330/links/ListingFile/${fileImage}',
                        width: 10000,
                        fit: BoxFit.cover,
                      ),
                      onTap: () async {
                        await showDialog(
                          builder: (_) => ImageDialog(
                              'https://genius.remax.co.id/papi/Listing/crud/46330/links/ListingFile/${fileImage}'),
                          context: context,
                        );
                      },
                    ),
                  ),
                );
              }).toList(),
              height: 150,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0)
        ],
      ),
    );
  }
}

class ImageDialog extends StatelessWidget {
  final String url;

  ImageDialog(this.url);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(

        decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)),
      ),
    );
  }
}
