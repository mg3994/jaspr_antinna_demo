import '../../domain/entities/chess_board.dart';

class ChessRepository {
  ChessBoard? _board;

  ChessBoard? get board => _board;

  void setBoard(ChessBoard board) {
    _board = board;
  }
}
