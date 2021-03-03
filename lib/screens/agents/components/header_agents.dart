import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class HeaderAgents extends StatelessWidget {

  const HeaderAgents({
    Key key,
    @required this.size,
  }) : super(key: key);
  final Size size;
  List<String> imgSlider() {
    List<String> data = [];

    data.add("https://remax.co.id/images/become-agent.jpg");
    // data.add("https://genius.remax.co.id/papi/Webabout/crud/1/links/wbabFileId/121685");
    // data.add("https://genius.remax.co.id/papi/Webabout/crud/2/links/wbabFileId/123250");
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //height: 300,
      height: size.height * .65,
      child: Carousel(
        dotBgColor: Colors.transparent,
        dotSize: 4.0,
        dotSpacing: 10.0,
        dotVerticalPadding: 50,
        images: imgSlider().map((fileImage) {
          return Container(
            child: ClipRRect(
              child: GestureDetector(
                child: Image.network(
                  fileImage,
                  width: 10000,
                  fit: BoxFit.cover,
                ),
                // onTap: () async {
                //   await showDialog(
                //     builder: (_) => ImageDialog(imgSlider(),
                //         'https://genius.remax.co.id/papi/Listing/crud/${widget.list[widget.index]['id']}/links/ListingFile/'),
                //     context: context,
                //   );
                // },
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
