//
//  AdjustmentView.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/11/11.
//

import SwiftUI

// パラメーター調整用カスタムView
struct AdjustmentView: View {
    var parameterName: String
    @Binding var parameter: Double
    
    var body: some View {
        HStack {
            Text(parameterName)
                .frame(width: 60)
            Slider(value: $parameter, in: 0...1, step: 0.01)
            Text("\(parameter, specifier: "%.2f")")
        }
        .padding()
    }
}
