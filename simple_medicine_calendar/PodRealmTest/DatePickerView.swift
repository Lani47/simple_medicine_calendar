//
//  DatePickerView.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/12/21.
//

import SwiftUI

struct DatePickerView: View {
    @State var date:Date = Date()
    var body: some View {
        VStack {
            HStack{
                Text("時刻:").font(.largeTitle)
                    
                DatePicker("", selection: $date,displayedComponents: .hourAndMinute)
                    .frame(width: 100.0)
                    
            }
            
                
        }
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
