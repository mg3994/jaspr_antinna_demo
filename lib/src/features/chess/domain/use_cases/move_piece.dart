import '../entities/chess_piece.dart';
import '../entities/chess_board.dart';

class MovePiece {
  final ChessBoard board;

  MovePiece(this.board);

  void execute(ChessPiece piece, String newPosition) {
    board.movePiece(piece, newPosition);
  }
}
