import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class HeaderFranchise extends StatelessWidget {

  const HeaderFranchise({
    Key key,
    @required this.size,
  }) : super(key: key);
  final Size size;


  List<String> imgSlider() {
    List<String> data = [];
    data.add("assets/images/bg_franchise.png");
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //height: 300,
      height: size.height * .85,
      child: Carousel(
        dotBgColor: Colors.transparent,
        dotSize: 0.0,
        dotSpacing: 10.0,
        dotVerticalPadding: 50,
        images: imgSlider().map((fileImage) {
          return Container(
            child: ClipRRect(
              child: GestureDetector(
                child: Image.asset(
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
