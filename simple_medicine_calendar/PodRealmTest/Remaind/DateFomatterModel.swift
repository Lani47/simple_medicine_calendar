//
//  DateFomatter.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/12/21.
//

import Foundation

class DateFormatterModel: ObservableObject{

    
    func dateTest(){
        //現在の日付を取得
        let datea:Date = Date()
                
        //日付のフォーマットを指定する。
        let format = DateFormatter()
        format.calendar = Calendar(identifier: .gregorian)
        format.locale = Locale(identifier: "ja_JP")
        format.timeZone = TimeZone(identifier:  "Asia/Tokyo")
        format.dateFormat = "HH:mm"
                
        //日付をStringに変換する
        let sDate = format.string(from: datea)
        
        print("時間\(sDate)")
        
        let dataiko = format.date(from: sDate)
        print(dataiko!)
    }
    
    func String_date(date:Date){
        //現在の日付を取得
//        let datea:Date = Date()
                
        //日付のフォーマットを指定する。
        let format = DateFormatter()
        format.calendar = Calendar(identifier: .gregorian)
        format.locale = Locale(identifier: "ja_JP")
        format.timeZone = TimeZone(identifier:  "Asia/Tokyo")
        format.dateFormat = "HH:mm"
                
        //日付をStringに変換する
        let sDate = format.string(from: date)
        
        print("時間\(sDate)")
        
        let dataiko = format.date(from: sDate)
        print(dataiko!)
    }
    func date_string(date: Date) -> String{
        //現在の日付を取得
//        let date:Date = Date()
                
        //日付のフォーマットを指定する。
        let format = DateFormatter()
        format.calendar = Calendar(identifier: .gregorian)
        format.locale = Locale(identifier: "ja_JP")
        format.timeZone = TimeZone(identifier:  "Asia/Tokyo")
        format.dateFormat = "HH:mm"
                
        //日付をStringに変換する
        let sDate = format.string(from: date)
        
//        print("時間\(sDate)")
        return sDate
        
        
    }
    func StringToDate(dateValue: String) -> Date {
            let dateFormatter = DateFormatter()
            dateFormatter.calendar = Calendar(identifier: .gregorian)
            dateFormatter.dateFormat = "HH:mm"
            return dateFormatter.date(from: dateValue) ?? Date()
        }
}
