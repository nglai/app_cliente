import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class RenderAvaliacaoWidget extends StatefulWidget {
  int? avaliacao;
  int? qtAvaliacoes;
  late double mediaAvaliacao = avaliacao! / qtAvaliacoes!;

  RenderAvaliacaoWidget(this.avaliacao, this.qtAvaliacoes);

  @override
  _RenderAvaliacaoWidgetState createState() => _RenderAvaliacaoWidgetState();
}

class _RenderAvaliacaoWidgetState extends State<RenderAvaliacaoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.avaliacao == 0
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
        widget.mediaAvaliacao > 0 && widget.mediaAvaliacao <= 0.5
            ? Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.starHalfAlt,
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
        widget.mediaAvaliacao > 0.5 && widget.mediaAvaliacao <= 1
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
        widget.mediaAvaliacao > 1 && widget.mediaAvaliacao <= 1.5
            ? Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.solidStar,
                    size: 17,
                    color: Color.fromRGBO(255, 164, 28, 1),
                  ),
                  FaIcon(
                    FontAwesomeIcons.starHalfAlt,
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
        widget.mediaAvaliacao > 1.5 && widget.mediaAvaliacao <= 2
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
        widget.mediaAvaliacao > 2 && widget.mediaAvaliacao <= 2.5
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
                    FontAwesomeIcons.starHalfAlt,
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
        widget.mediaAvaliacao > 2.5 && widget.mediaAvaliacao <= 3
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
        widget.mediaAvaliacao > 3 && widget.mediaAvaliacao <= 3.5
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
                    FontAwesomeIcons.starHalfAlt,
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
        widget.mediaAvaliacao > 3.5 && widget.mediaAvaliacao <= 4
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
        widget.mediaAvaliacao > 4 && widget.mediaAvaliacao <= 4.5
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
                    FontAwesomeIcons.starHalfAlt,
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
        widget.mediaAvaliacao > 4.5 && widget.mediaAvaliacao <= 5
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
                    FontAwesomeIcons.solidStar,
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
