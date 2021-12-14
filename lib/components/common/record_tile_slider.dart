import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class RecordTileSlider extends StatefulWidget {
  final List<String> imageUrl;

  const RecordTileSlider({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  _RecordTileSliderState createState() => _RecordTileSliderState();
}

class _RecordTileSliderState extends State<RecordTileSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider(
          items: widget.imageUrl
              .map(
                (item) => Image.asset(item),
              )
              .toList(),
          carouselController: _controller,
          options: CarouselOptions(
            aspectRatio: 1.0,
            viewportFraction: 1.0,
            enableInfiniteScroll: false,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.imageUrl.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (_current == entry.key
                            ? Theme.of(context).colorScheme.primary
                            : Colors.white)
                        .withOpacity(_current == entry.key ? 1 : 0.5),
                  ),
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
