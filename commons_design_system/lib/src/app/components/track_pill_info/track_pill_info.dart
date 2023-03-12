import 'dart:typed_data';

import 'package:commons_shared/main.dart';
import 'package:flutter/material.dart';

class TrackPillInfo extends StatefulWidget {
  final TrackEntity? track;
  final Uint8List? icon;
  final double? pinPillPosition;

  const TrackPillInfo({
    Key? key,
    this.track,
    this.icon,
    this.pinPillPosition = 0,
  }) : super(key: key);

  @override
  _TrackPillInfoState createState() => _TrackPillInfoState();
}

class _TrackPillInfoState extends State<TrackPillInfo> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      left: 0,
      right: 0,
      bottom: widget.pinPillPosition,
      height: Constants.pillHeight,
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        padding: const EdgeInsets.only(left: 8, right: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  blurRadius: 20,
                  offset: Offset.zero,
                  color: Colors.grey.withOpacity(0.5))
            ]),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 16),
              child: ClipOval(
                child: Image.asset(
                  "assets/u1.jpeg",
                  width: 55,
                  height: 55,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.track?.user?.username ?? "Usuário",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.blueAccent.shade200),
                    ),
                    _metric(
                        "Distância",
                        TrackFormatter.formatDistance(
                            widget.track?.distance ?? 0)),
                    _metric("Tempo",
                        TrackFormatter.formatTimer(widget.track?.time ?? 0)),
                    _metric(
                        "Velocidade máxima",
                        TrackFormatter.formatSpeed(
                            widget.track?.maxSpeed ?? 0)),
                  ],
                ),
              ),
            ),
            widget.track?.icon != null
                ? Image.memory(
                    widget.track!.icon!,
                    width: 40,
                    height: 40,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget _metric(String label, String value) => Row(
        children: [
          Text(
            label,
            style:
                Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 12),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            value,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      );
}
