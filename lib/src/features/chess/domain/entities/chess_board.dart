import 'chess_piece.dart';

class ChessBoard {
  final List<List<ChessPiece?>> board;

  ChessBoard({required this.board});

  ChessPiece? getPieceAt(String position) {
    final row = position.codeUnitAt(0) - 'a'.codeUnitAt(0);
    final col = int.parse(position[1]) - 1;
    return board[row][col];
  }

  void movePiece(ChessPiece piece, String newPosition) {
    final oldPosition = piece.position;
    final row = oldPosition.codeUnitAt(0) - 'a'.codeUnitAt(0);
    final col = int.parse(oldPosition[1]) - 1;
    board[row][col] = null;

    final newRow = newPosition.codeUnitAt(0) - 'a'.codeUnitAt(0);
    final newCol = int.parse(newPosition[1]) - 1;
    board[newRow][newCol] = piece.moveTo(newPosition);
  }
}
