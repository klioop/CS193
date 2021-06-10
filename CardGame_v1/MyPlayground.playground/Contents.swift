import SwiftUI

enum TeslaModel: CaseIterable { // enum 이 CaseIterable 프로토콜을 따르면 static var 인 allCase 를 사용할 수 있다.
    case X
    case S
    case Three
    case Y
}

//for model in TeslaModel.allCases {
//    print(reportSalesNumbers(for: model))
//}

func reportSalesNumbers(for model: TeslaModel) -> Int {
    
    switch model {
    
    case .S:
        return 1
    case .X:
        return 2
    case .Three:
        return 3
    case .Y: return 4
        
    }
}

struct ChessBoard {
    let boardColors: [Bool] = {
        var tempBoards = Array<Bool>()
        var isBlack = false
        
        for _ in 1...8 {
            for _ in 1...8 {
                tempBoards.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        
        return tempBoards
    }()
    
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        /// row: The range of row is 0...7
        /// column: The range of column is 0...7
        
        return boardColors[(row * 8) + column]
    }
}

let c1 = ChessBoard()
//c1.squareIsBlackAt(row: 7, column: 6)

