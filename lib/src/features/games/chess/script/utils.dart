import 'package:antinna/src/features/games/chess/script/enum.dart';


class Utils {
  const Utils();
  static int colToInt(Col col)=>col.index; 
  static int rowToInt(Row row) => row.index;//row.value - 1;
  static Col intToCol(int int) => Col.values[int];
  static Row intToRow(int int) => Row.values[int];
  static getPositionsFromShortCode(String shortCode){

  }
  static getInitialBoardPieces(parent, pieces) {}
  static getInitialBoardTiles(parent, handler) {}
  static getInitialBoardState(){}
  static getInitialPiecePositions(){}
  static getInitialPieces() {}

}
// const initialPositions = Utils.getInitialPiecePositions();