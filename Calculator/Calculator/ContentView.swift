//
//  ContentView.swift
//  Calculator
//
//  Created by Hitesh Agarwal on 27/01/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import SwiftUI

enum CalculatorButton: String {
    case one, two, three, four, five, six, seven, eight, nine, zero
    case plus, minus, divide, multiply, ac, equal, plusMinus, moduls, decimal
    
    var title: String {
        switch self {
        case .one:
            return "1"
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        case .seven:
            return "7"
        case .eight:
            return "8"
        case .nine:
            return "9"
        case .zero:
            return "0"
        case .plus:
            return "+"
        case .minus:
            return "-"
        case .divide:
            return "/"
        case .multiply:
            return "X"
        case .ac:
            return "AC"
        case .equal:
            return "="
        case .plusMinus:
            return "+/-"
        case .moduls:
            return "%"
        case .decimal:
            return "."
        }
    }
    
    func buttonWidth(spacing: CGFloat) -> CGFloat {
        if self == .zero {
            return ((UIScreen.main.bounds.width - (5 * spacing)) / 4) * 2 + spacing
        }
        return (UIScreen.main.bounds.width - (5 * spacing)) / 4
    }
    
    var backgroundColor: Color {
        switch self {
        case .ac, .plusMinus, .moduls:
            return Color(.lightGray)
        case .multiply, .divide, .minus, .plus, .equal:
            return Color.orange
        default:
            return Color(.darkGray)
        }
    }
    
    var forgroundColor: Color {
        switch self {
        case .ac, .plusMinus, .moduls:
            return .black
        default:
            return .white
        }
    }
}

struct ContentView: View {
    
    var buttons: [[CalculatorButton]] = [
        [.ac, .plusMinus, .moduls, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equal]
    ]
    
    var spacing: CGFloat = 12

    @State var result = "0"
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing: spacing) {
                
                HStack {
                    Spacer()
                    Text(result)
                        .foregroundColor(.white)
                        .font(.system(size: 94))
                        .fontWeight(.light)
                        .lineLimit(1)
                        
                }.padding()
                
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: self.spacing) {
                        ForEach(row, id: \.self) { button in
                             
                            Button(action: {
                                if let intValue = Int(button.title) {
                                    self.result = "\(intValue)"
                                }
                            }) {
                                
                                Text(button.title)
                                    .font(.system(size: 35))
                                    .frame(width: button.buttonWidth(spacing: self.spacing), height: (UIScreen.main.bounds.width - (5 * self.spacing)) / 4)
                                    .background(button.backgroundColor)
                                    .foregroundColor(button.forgroundColor)
                                    .cornerRadius(button.buttonWidth(spacing: self.spacing) / 2)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
