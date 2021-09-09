import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class RenderAvaliacaoWidget extends StatefulWidget {
  int? avaliacao;
  int? qtAvaliacoes;

  RenderAvaliacaoWidget(this.avaliacao, this.qtAvaliacoes);

  @override
  _RenderAvaliacaoWidgetState createState() => _RenderAvaliacaoWidgetState();
}

class _RenderAvaliacaoWidgetState extends State<RenderAvaliacaoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.avaliacao! == 0
            ? Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.star,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  FaIcon(
                    FontAwesomeIcons.star,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  FaIcon(
                    FontAwesomeIcons.star,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  FaIcon(
                    FontAwesomeIcons.star,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  FaIcon(
                    FontAwesomeIcons.star,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text('${widget.qtAvaliacoes} avaliações'),
                  )
                ],
              )
            : SizedBox(
                width: 0,
                height: 0,
              ),
        widget.avaliacao! > 0 && widget.avaliacao! <= 1
            ? Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.solidStar,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  FaIcon(
                    FontAwesomeIcons.star,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  FaIcon(
                    FontAwesomeIcons.star,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  FaIcon(
                    FontAwesomeIcons.star,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  FaIcon(
                    FontAwesomeIcons.star,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text('${widget.qtAvaliacoes} avaliações'),
                  )
                ],
              )
            : SizedBox(
                width: 0,
                height: 0,
              ),
        widget.avaliacao! > 1 && widget.avaliacao! <= 2
            ? Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.solidStar,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  FaIcon(
                    FontAwesomeIcons.solidStar,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  FaIcon(
                    FontAwesomeIcons.star,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  FaIcon(
                    FontAwesomeIcons.star,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  FaIcon(
                    FontAwesomeIcons.star,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text('${widget.qtAvaliacoes} avaliações'),
                  )
                ],
              )
            : SizedBox(
                width: 0,
                height: 0,
              ),
        widget.avaliacao! > 2 && widget.avaliacao! <= 3
            ? Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.solidStar,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  FaIcon(
                    FontAwesomeIcons.solidStar,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  FaIcon(
                    FontAwesomeIcons.solidStar,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  FaIcon(
                    FontAwesomeIcons.star,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  FaIcon(
                    FontAwesomeIcons.star,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text('${widget.qtAvaliacoes} avaliações'),
                  )
                ],
              )
            : SizedBox(
                width: 0,
                height: 0,
              ),
        widget.avaliacao! > 3 && widget.avaliacao! <= 4
            ? Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.solidStar,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  FaIcon(
                    FontAwesomeIcons.solidStar,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  FaIcon(
                    FontAwesomeIcons.solidStar,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  FaIcon(
                    FontAwesomeIcons.solidStar,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  FaIcon(
                    FontAwesomeIcons.star,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text('${widget.qtAvaliacoes} avaliações'),
                  )
                ],
              )
            : SizedBox(
                width: 0,
                height: 0,
              ),
        widget.avaliacao! > 4 && widget.avaliacao! <= 5
            ? Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.solidStar,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  FaIcon(
                    FontAwesomeIcons.solidStar,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  FaIcon(
                    FontAwesomeIcons.solidStar,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  FaIcon(
                    FontAwesomeIcons.solidStar,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  FaIcon(
                    FontAwesomeIcons.star,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text('${widget.qtAvaliacoes} avaliações'),
                  )
                ],
              )
            : SizedBox(
                width: 0,
                height: 0,
              ),
      ],
    );
  }
}
