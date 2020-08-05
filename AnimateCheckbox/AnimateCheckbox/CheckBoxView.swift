//
//  CheckBoxView.swift
//  AnimateCheckbox
//
//  Created by Hitesh Agarwal on 05/08/20.
//  Copyright © 2020 Hitesh. All rights reserved.
//

import SwiftUI

struct CheckBoxView: View {
    
    @Binding var isChecked: Bool
    @Binding var trimValue: CGFloat
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .trim(from: 0, to: trimValue)
                    .stroke(style: StrokeStyle(lineWidth: 2))
                    .frame(width: 70, height: 70)
                    .foregroundColor(isChecked ? Color.green : Color.gray.opacity(0.2))
                    .overlay(
                        Circle()
                            .fill(isChecked ? Color.green : Color.gray.opacity(0.2))
                            .frame(width: 60, height: 60)
                    )
                
                if isChecked {
                    Image(systemName: "checkmark")
                        .foregroundColor(.white)
                }
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .trim(from: 0, to: trimValue)
                    .stroke(style: StrokeStyle(lineWidth: 2))
                    .frame(width: 70, height: 70)
                    .foregroundColor(isChecked ? Color.green : Color.gray.opacity(0.2))
                
                RoundedRectangle(cornerRadius: 10)
                    .trim(from: 0, to: 1)
                    .fill(isChecked ? Color.green : Color.gray.opacity(0.2))
                    .frame(width: 60, height: 60)
                
                if isChecked {
                    Image(systemName: "checkmark")
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    @State static var isChecked = false
    @State static var trimValue:CGFloat = 0
    
    static var previews: some View {
        CheckBoxView(isChecked: $isChecked, trimValue: $trimValue)
    }
}
