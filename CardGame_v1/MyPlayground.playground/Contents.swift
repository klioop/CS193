import SwiftUI

enum TeslaModel: CaseIterable { // enum 이 CaseIterable 프로토콜을 따르면 static var 인 allCase 를 사용할 수 있다.
    case X
    case S
    case Three
    case Y
}

for model in TeslaModel.allCases {
    print(reportSalesNumbers(for: model))
}

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
