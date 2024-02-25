//
//  LearningLanding.swift
//  SATAPP
//
//  Created by Rachel Mills on 2/19/24.
//

import SwiftUI



struct LearningLanding: View {
    @ObservedObject var datas = LessonModel()
    private let c = 5
    @State private var isShowing = false
    @State private var page = 0
    private let screenWidth = UIScreen.main.bounds.width
    private let sideMenuWidth = UIScreen.main.bounds.width/1.3


    
    func nextPage() {
        print(datas.lessons.count)
        if (self.page < c) {
            self.page = self.page + 1
        } else {
            self.page = 0
        }
    }
    

        var sideBar: some View {
            HStack {
                Spacer()
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .frame(width: (sideMenuWidth), height: UIScreen.main.bounds.height)
                        .edgesIgnoringSafeArea(.top)
                        .shadow(color: .gray, radius: 20)
                    VStack {
                        ForEach(datas.lessons) { lesson in
                            Button(action: {
                                
                            }) {
                              Text("\(lesson.title)")
                            }
                            .lineLimit(1)
                            .frame(width: (screenWidth/1.5 - 5), alignment: .leading)
                            .padding(.bottom, 1)
                            .padding(.leading, 1)
                        }
                        Spacer()
                    }
                    .padding(.top, 40)
                    .frame(width: (sideMenuWidth))
                        
                }
                
          
            }
        }
  
   
    var body: some View {
        ZStack {
            VStack {
                Text(datas.lessons[page].title)
                    .font(.largeTitle)
                    .padding(.top, 30)
                    .padding(.bottom, 10)
                Text(datas.lessons[page].subtitle)
                    .frame(width: 300, alignment: .center)
                    .padding(.bottom, 10)
                Spacer()
                Button(action: {
                    nextPage()
                    print(datas.lessons.count)
                      }) {
                Text("Next")
                          .font(.title)
                      }
                      .padding(.bottom, 40)
               
                
            }
            .zIndex(1)
            
            if (isShowing) {
                sideBar.zIndex(2)
            }
            
        }.frame(alignment: .center)
        
        /*
         Tool bar
         */
            .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                           ToolbarItem(placement: .navigationBarTrailing) {
                               Button {
                                   isShowing.toggle()
                               } label: {
                                   Image(systemName: "line.3.horizontal")
                               }.buttonStyle(.plain)
                               
                           }
                })
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .animation(.easeInOut, value: isShowing)
    
        
    }
}

struct LearningLanding_Previews: PreviewProvider {
    static var previews: some View {
        LearningLanding()
    }
}



