import 'package:jaspr/jaspr.dart';
import '../../domain/entities/chess_piece.dart';
import '../../domain/entities/chess_board.dart';
import '../../domain/use_cases/initialize_board.dart';
import '../../domain/use_cases/move_piece.dart';
import '../../data/repositories/chess_repository.dart';

class ChessState extends ChangeNotifier {
  final ChessRepository _repository = ChessRepository();
  ChessBoard? get board => _repository.board;

  ChessState() {
    _initializeBoard();
  }

  void _initializeBoard() {
    final initializer = InitializeBoard();
    final newBoard = initializer.execute();
    _repository.setBoard(newBoard);
    notifyListeners();
  }

  void movePiece(ChessPiece piece, String newPosition) {
    final movePiece = MovePiece(_repository.board!);
    movePiece.execute(piece, newPosition);
    notifyListeners();
  }
}
