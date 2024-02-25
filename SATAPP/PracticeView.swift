//
//  PracticeView.swift
//  SATAPP
//
//  Created by Rachel Mills on 1/7/24.
//

import SwiftUI

struct PracticeView: View {
    
    var difficulties: [String] = ["Easy", "Medium", "Difficult"]
    @State var difficuly = "Easy"
    var modes: [String] = ["Multiple Choice and Free Response", "Only Mulitple Choice", "Only Free Response"]
    @State var mode = "Multiple Choice and Free Response"
    
    var body: some View {
            ZStack {
                VStack {
                    Text("Choose Settings")
                        .foregroundColor(.black)
                        .font(.system(size: 35))
                        .fontWeight(.semibold)
                        .padding(.top, 30)
                   
                    ZStack {
                        Picker("Choose Difficulty", selection: $difficuly) {
                            ForEach(difficulties, id: \.self) {
                                Text($0)
                                    .font(.system(size: 19))
                                    .foregroundColor(.black)
                            }
                        }
                        .foregroundColor(.black)
                        .padding(.top, 80)
                        .pickerStyle(.wheel)
                        .frame(width: UIScreen.main.bounds.width - 50, height: 80, alignment: .center)
                     
                        Text("Choose Difficulty")
                            .foregroundColor(.black)
                            .frame(width: UIScreen.main.bounds.width - 50, height: 45, alignment: .center)
                            .padding(.top, 0)
                            .background(.white)
                            
                        
                    }
                    .padding(.bottom, 80)
                    ZStack {
                        Picker("Choose Mode", selection: $mode) {
                            ForEach(modes, id: \.self) {
                                Text($0)
                                    .foregroundColor(.black)
                                    .font(.system(size: 18))
                                   
                            }
                        }
                        .padding(.top, 125)
                        .pickerStyle(.wheel)
                        .frame(width: UIScreen.main.bounds.width - 50, height: 80, alignment: .center)
                        .tint(.black)
                        Text("Choose Mode")
                            .foregroundColor(.black)
                            .frame(width: UIScreen.main.bounds.width - 50, height: 45, alignment: .center)
                            .padding(.top, 30)
                            .background(.white)
                            
                        
                    }
                    
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: PracticeQuestionView()) {
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.black)
                                .font(.system(size: 30))
                                
                        }
                        .padding()
                    }
                    
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                           ToolbarItem(placement: .navigationBarTrailing) {
                               Button {
                       
                               } label: {
                                   Image(systemName: "line.3.horizontal")
                                       .foregroundStyle(.black)
                               }.buttonStyle(.plain)
                               
                           }
                })
            .frame(width: UIScreen.main.bounds.width, alignment: .center)
            .background(.white)
        
       
 
        
        
    }
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView()
    }
}
