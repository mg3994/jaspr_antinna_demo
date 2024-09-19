
import 'enum.dart';

class ChessPiece {
  final Player player;
  final Piece pieceType;

  const ChessPiece({
    required this.player,
    required this.pieceType,
  });
}