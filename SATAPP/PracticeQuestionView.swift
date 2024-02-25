//
//  PracticeQuestionView.swift
//  SATAPP
//
//  Created by Rachel Mills on 1/8/24.
//

import SwiftUI

struct PracticeQuestionView: View {
    
    @State var formulaSheetVisible: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("Question 1")
                    .padding()
                
                Spacer()
                Button("Test") {
                    
                }
                .buttonStyle(PracticeAnswerButton())
                Button("Test") {
                    
                }
                .buttonStyle(PracticeAnswerButton())
                Button("Test") {
                    
                }
                .buttonStyle(PracticeAnswerButton())
                Button("Test") {
                    
                }
                .buttonStyle(PracticeAnswerButton())
                Button("Test") {
                    
                }
                .buttonStyle(PracticeAnswerButton())
                .padding(.bottom, 40)
                
                
            }
            VStack {
                HStack {
                    Spacer()
                    Button {
                        withAnimation(.easeInOut(duration: 2)) {
                                            formulaSheetVisible.toggle()
                                        }
                    } label: {
                        ZStack {
                            Image(systemName: "chevron.backward")
                                .padding(.trailing, 50)
                            Image(systemName: "doc")
                                .font(.system(size: 25))
                        }
                        .frame(width: 20, height: 50, alignment: .trailing)
                    }.buttonStyle(.plain)
                    
                    
                }
                .padding(.top, 70)
           
                Spacer()
            }
//            if (formulaSheetVisible) {
//                VStack {
//                    Text("hi")
//                }
//            }
           
        }
//        .offset(x: formulaSheetVisible ? 150 : 0, y: 0)
    }
}

struct PracticeAnswerButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 310, height: 40)
            .font(.system(size: 22))
            .background(Color(red: 1, green: 1, blue: 1))
            .cornerRadius(6)
            .foregroundStyle(.black)
            //.shadow(color: (Color(UIColor.lightGray)), radius: 15)
            .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(.gray, lineWidth: 0.75)
                        
                )
            .scaleEffect(configuration.isPressed ? 1.05 : 1)
            .animation(.easeOut(duration: 0.3), value: configuration.isPressed)
            .padding([.top, .bottom], 1)
    }
}

struct PracticeQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeQuestionView()
    }
}
