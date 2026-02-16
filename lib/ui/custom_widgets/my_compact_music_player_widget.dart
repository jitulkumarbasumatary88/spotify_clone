import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:palette_generator_master/palette_generator_master.dart';
import 'package:spotify_clone/domain/ui_helper.dart';

class MyCompactMusicPlayerWidget extends StatefulWidget {
  String songTitle;
  String albumTitle;
  String thumbnailPath;
  String bluetoothName;
  bool isBluetooth;
  double mHeight;
  Color bgColor;

  MyCompactMusicPlayerWidget({
    required this.songTitle,
    required this.albumTitle,
    required this.thumbnailPath,
    this.bluetoothName = '',
    this.isBluetooth = false,
    this.mHeight = 65,
    required this.bgColor,
  });

  @override
  State<MyCompactMusicPlayerWidget> createState() =>
      _MyCompactMusicPlayerWidgetState();
}

class _MyCompactMusicPlayerWidgetState
    extends State<MyCompactMusicPlayerWidget> {
  PaletteGenerator? paletteGenerator;

  @override
  void initState() {
    super.initState();
    initializedColorPalette();
  }

  initializedColorPalette() async {
    paletteGenerator = await getColorPalette(widget.thumbnailPath);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: widget.mHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: paletteGenerator != null
            ? paletteGenerator!.dominantColor!.color.withOpacity(0.4)
            : widget.bgColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8, top: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    image: DecorationImage(
                      image: AssetImage(widget.thumbnailPath),
                    ),
                  ),
                ),
                mSpacer(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.songTitle,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '- ${widget.albumTitle}',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                              ),
                              overflow: TextOverflow.fade, // wait //
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      widget.isBluetooth
                          ? Row(
                              children: [
                                Icon(
                                  Icons.bluetooth,
                                  color: Colors.green,
                                  size: 14,
                                ),
                                Text(
                                  widget.bluetoothName,
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                    ],
                  ),
                ),
                mSpacer(),
                Icon(
                  widget.isBluetooth ? Icons.bluetooth : Icons.devices,
                  color: Colors.green,
                ),
                mSpacer(),
                Icon(Icons.pause, color: Colors.white),
              ],
            ),
            LinearProgressIndicator(
              value: 0.5,
              valueColor: AlwaysStoppedAnimation<Color>(
                paletteGenerator != null
                    ? paletteGenerator!.colors.toList()[6]
                    : Colors.grey,
              ),
              backgroundColor: Colors.white.withOpacity(0.4), // 0.15, 0.3
              borderRadius: BorderRadius.circular(11),
            ),
          ],
        ),
      ),
    );
  }
}
