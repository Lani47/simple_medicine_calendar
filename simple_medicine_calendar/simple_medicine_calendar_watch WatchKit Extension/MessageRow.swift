//
//  MessageRow.swift
//  simple_medicine_calendar_watch WatchKit Extension
//
//  Created by cmStudent on 2023/02/16.
//

import Foundation
import SwiftUI

struct MessageRow: View {
    let message: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(message)
                .font(.body)
                .padding(.vertical, 4.0)
            // 受信時のタイムスタンプ
            Text("\(Date())")
                .font(.footnote)
                .foregroundColor(.gray)
        }
    }
}
