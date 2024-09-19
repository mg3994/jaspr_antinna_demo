import 'enum.dart';
import 'shape.dart';
import 'utils.dart';

class ChessPiece {
  final String id;
  final Player player;
  final Piece type;
   List? moves;
   bool? promoted;
   bool? updateShape;

   ChessPiece(
      {required this.id,
      required this.player,
      required this.type,
      this.moves = const [],
      this.promoted = false,
      this.updateShape = false});

  int get orientation => player == Player.black ? -1 : 1;

  dir(int stepsRow, int stepsColumn, positions //TODO: positions
      ) {
    final row = Utils.rowToInt(positions[id].row) + orientation * stepsRow;
    final col = Utils.colToInt(positions[id].col) + orientation * stepsColumn;
    if (row >= 0 && row <= 7 && col >= 0 && col <= 7) {
      return {row: Utils.intToRow(row), col: Utils.intToCol(col)}; //Location
    }
    return null;
  }

//
  dirN(stepsRow, positions) => dir(stepsRow, 0, positions);
  dirS(stepsRow, positions) => dir(-stepsRow,0,positions);
  dirW(stepsColumn, positions) =>dir(0, -stepsColumn, positions);
  dirE(stepsColumn, positions) => dir(0, stepsColumn, positions);

//
  dirNW(steps, positions) =>dir(steps,-steps,positions);
  dirNE(steps, positions) =>dir(steps,steps,positions);
  dirSW(steps, positions) =>dir(-steps,-steps,positions);
  dirSE(steps, positions) =>dir(-steps,steps,positions);
// Done
  move(moveIndex) => moves?.add(moveIndex);
//
  options() {}
// Done
  playerBlack() => player == Player.black;
//Done
  playerWhite() => player == Player.white;
// Done
  promote({Piece type = Piece.queen}) {
    type = type;
    promoted = true;
    updateShape = true;
  }

// Done
  shape() {
    return switch (type) {
      Piece.bishop => Shape.shapeBishop(player),
      Piece.king => Shape.shapeKing(player),
      Piece.knight => Shape.shapeKnight(player),
      Piece.pawn => Shape.shapePawn(player),
      Piece.queen => Shape.shapeQueen(player),
      Piece.rook => Shape.shapeRook(player),
    };
  }
}
