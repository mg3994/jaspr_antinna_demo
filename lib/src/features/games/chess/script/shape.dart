import 'package:antinna/src/components/use/use.dart';
import 'package:jaspr/jaspr.dart';

import 'enum.dart';

class Shape {
  static Component shape(Player player, Piece piece) => svg(
          classes: player.name.toString(),
          width: 170.px,
          height: 170.px,
          viewBox: "0 0 170 170",
          attributes: {
            'fill': "none"
          },
          [
            use(
              href: '#${piece.type}',
            )
          ]);
  static Component shapeBishop(Player player) =>
      Shape.shape(player, Piece.bishop);

  static Component shapeKing(Player player) => Shape.shape(player, Piece.king);

  static Component shapeKnight(Player player) =>
      Shape.shape(player, Piece.knight);

  static Component shapePawn(Player player) => Shape.shape(player, Piece.pawn);

  static Component shapeQueen(Player player) =>
      Shape.shape(player, Piece.queen);

  static Component shapeRook(Player player) => Shape.shape(player, Piece.rook);
}
