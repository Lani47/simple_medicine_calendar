//
//  ColorView.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/11/11.
//

import SwiftUI

struct ColorView: View {
    @Environment(\.dismiss) var dismiss
//    @State var drugColors = Color(red: 0.49, green: 1, blue: 0.30)
    
    @Binding var drugColors :Color
    
    var body: some View {
        ZStack {
        Group {
            Ellipse()
            .fill(Color(red: 0.99, green: 0.46, blue: 0.58))
            .offset(x: -121, y: -210)
            .frame(width: 50, height: 50)
            .onTapGesture {
                drugColors = Color(red: 0.99, green: 0.46, blue: 0.58)
                dismiss()
                            }


            Ellipse()
            .fill(Color(red: 1, green: 0.75, blue: 0.45))
            .offset(x: -60, y: -210)
            .frame(width: 50, height: 50)
            .onTapGesture {
                drugColors = Color(red: 1, green: 0.75, blue: 0.45)
                dismiss()
                            }

            Ellipse()
            .fill(Color(red: 0.91, green: 0.93, blue: 0.21))
            .offset(x: 1, y: -210)
            .frame(width: 50, height: 50)
            .onTapGesture {
                drugColors = Color(red: 0.91, green: 0.93, blue: 0.21)
                dismiss()
                            }

            Ellipse()
            .fill(Color(red: 0.66, green: 0.88, blue: 0.63))
            .offset(x: 61, y: -210)
            .frame(width: 50, height: 50)
            .onTapGesture {
                drugColors = Color(red: 0.66, green: 0.88, blue: 0.63)
                dismiss()
                            }

            Ellipse()
            .fill(Color(red: 0.55, green: 0.88, blue: 0.86))
            .offset(x: 122, y: -210)
            .frame(width: 50, height: 50)
            .onTapGesture {
                drugColors = Color(red: 0.55, green: 0.88, blue: 0.86)
                dismiss()
                            }

            Ellipse()
            .fill(Color(red: 1, green: 0, blue: 0.42))
            .offset(x: 122, y: -150)
            .frame(width: 50, height: 50)
            .onTapGesture {
                drugColors = Color(red: 1, green: 0, blue: 0.42)
                dismiss()
                            }

            Ellipse()
            .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
            .offset(x: 61, y: -150)
            .frame(width: 50, height: 50)
            .onTapGesture {
                drugColors = Color(red: 0.85, green: 0.85, blue: 0.85)
                print("hoge")
                dismiss()
                
                            }

            Ellipse()
            .fill(Color(red: 0.04, green: 0.04, blue: 0.04))
            .offset(x: 0, y: -150)
            .frame(width: 50, height: 50)
            .onTapGesture {
                drugColors = Color(red: 0.04, green: 0.04, blue: 0.04)
                dismiss()
                            }

            Ellipse()
            .fill(Color(red: 0.89, green: 0.65, blue: 1))
            .offset(x: -60, y: -150)
            .frame(width: 50, height: 50)
            .onTapGesture {
                drugColors = Color(red: 0.89, green: 0.65, blue: 1, opacity: 0.74)
                dismiss()
                            }

            Ellipse()
            .fill(Color(red: 0.52, green: 0.63, blue: 1))
            .offset(x: -121, y: -150)
            .frame(width: 50, height: 50)
            .onTapGesture {
                drugColors = Color(red: 0.52, green: 0.63, blue: 1)
                dismiss()
                            }

        }
            
            Group{
                Ellipse()
                    .fill(Color(red: 0.44, green: 0.15, blue: 0.34))
                .offset(x: -121, y: -90)
                .frame(width: 50, height: 50)
                .onTapGesture {
                    drugColors = Color(red: 0.44, green: 0.15, blue: 0.34)
                    dismiss()
                                }
                Ellipse()
                    .fill(Color(red: 0.88, green: 1, blue: 0.47))
                .offset(x: -60, y: -90)
                .frame(width: 50, height: 50)
                .onTapGesture {
                    drugColors = Color(red: 0.88, green: 1, blue: 0.47)
                    dismiss()
                                }
                Ellipse()
                    .fill(Color(red: 0.88, green: 0.46, blue: 0.55))
                .offset(x: 0, y: -90)
                .frame(width: 50, height: 50)
                .onTapGesture {
                    drugColors = Color(red: 0.88, green: 0.46, blue: 0.55)
                    dismiss()
                                }
                Ellipse()
                    .fill(Color(red: 0.30, green: 0.97, blue: 0.33))
                .offset(x: 60, y: -90)
                .frame(width: 50, height: 50)
                .onTapGesture {
                    drugColors = Color(red: 0.30, green: 0.97, blue: 0.33)
                    dismiss()
                                }
                Ellipse()
                    .fill(Color(red: 0.13, green: 0.79, blue: 0.78))
                .offset(x: 120, y: -90)
                .frame(width: 50, height: 50)
                .onTapGesture {
                    drugColors = Color(red: 0.13, green: 0.79, blue: 0.78)
                    dismiss()
                                }
                
                
            }
            //　追加1
            Group{
                Ellipse()
                    .fill(Color(red: 0.999, green: 0.945, blue: 0.794))
                .offset(x: -121, y: -30)
                .frame(width: 50, height: 50)
                .onTapGesture {
                    drugColors = Color(red: 0.999, green: 0.945, blue: 0.794)
                    dismiss()
                                }
                Ellipse()
                    .fill(Color(red: 0.741, green: 0.197, blue: 0.071))
                .offset(x: -60, y: -30)
                .frame(width: 50, height: 50)
                .onTapGesture {
                    drugColors = Color(red: 0.741, green: 0.197, blue: 0.071)
                    dismiss()
                                }
                Ellipse()
                    .fill(Color(red: 0.262, green: 0.141, blue: 0.084))
                .offset(x: 0, y: -30)
                .frame(width: 50, height: 50)
                .onTapGesture {
                    drugColors = Color(red: 0.262, green: 0.141, blue: 0.084)
                    dismiss()
                                }
                Ellipse()
                    .fill(Color(red: 0.848, green: 0.534, blue: 0.468))
                .offset(x: 60, y: -30)
                .frame(width: 50, height: 50)
                .onTapGesture {
                    drugColors = Color(red: 0.848, green: 0.534, blue: 0.468)
                    dismiss()
                                }
                Ellipse()
                    .fill(Color(red: 0.749, green: 0.82, blue: 0.397))
                .offset(x: 120, y: -30)
                .frame(width: 50, height: 50)
                .onTapGesture {
                    drugColors = Color(red: 0.749, green: 0.82, blue: 0.397)
                    dismiss()
                                }
                
                
            }
            //　追加
            Group{
                Ellipse()
                    .fill(Color(red: 0.224, green: 0.255, blue: 0.356))
                .offset(x: -121, y: 30)
                .frame(width: 50, height: 50)
                .onTapGesture {
                    drugColors = Color(red: 0.224, green: 0.255, blue: 0.356)
                    dismiss()
                                }
                Ellipse()
                    .fill(Color(red: 0.207, green: 0.157, blue: 0.201))
                .offset(x: -60, y: 30)
                .frame(width: 50, height: 50)
                .onTapGesture {
                    drugColors = Color(red: 0.207, green: 0.157, blue: 0.201)
                    dismiss()
                                }
                Ellipse()
                    .fill(Color(red: 0.735, green: 0.542, blue: 0.107))
                .offset(x: 0, y: 30)
                .frame(width: 50, height: 50)
                .onTapGesture {
                    drugColors = Color(red: 0.735, green: 0.542, blue: 0.107)
                    dismiss()
                                }
                Ellipse()
                    .fill(Color(red: 0.518, green: 0.518, blue: 0.526))
                .offset(x: 60, y: 30)
                .frame(width: 50, height: 50)
                .onTapGesture {
                    drugColors = Color(red: 0.518, green: 0.518, blue: 0.526)
                    dismiss()
                                }
                Ellipse()
                    .fill(Color(red: 0.13, green: 0.79, blue: 0.78))
                .offset(x: 120, y: 30)
                .frame(width: 50, height: 50)
                .onTapGesture {
                    drugColors = Color(red: 0.13, green: 0.79, blue: 0.78)
                    dismiss()
                                }
                
                
            }
            
            
            
        Group {
//            Ellipse()
//            .fill(Color(red: 0.63, green: 0.85, blue: 0.88))
//            .offset(x: 31.50, y: -507)
//            .frame(width: 59, height: 54)

            Text("色を選択してください")
                .font(.largeTitle)
                .frame(width: 303, height: 46)
            .offset(x: 5.50, y: -250)
        }
        }
        .frame(width: 360, height: 640)
        .background(Color.white)
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(drugColors: .constant(.init( red: 0.852, green: 0.941, blue: 0.953)))
    }
}
