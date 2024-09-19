class ChessPiece {
  final String type; // e.g., "pawn", "king"
  final String color; // e.g., "white", "black"
  final String position; // e.g., "e4"

  ChessPiece({
    required this.type,
    required this.color,
    required this.position,
  });

  ChessPiece moveTo(String newPosition) {
    return ChessPiece(
      type: type,
      color: color,
      position: newPosition,
    );
  }
}
