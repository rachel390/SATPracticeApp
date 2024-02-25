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
    @State private var showSubtopics = false
    @State private var page = 0
    private let screenWidth = UIScreen.main.bounds.width
    private let sideMenuWidth = UIScreen.main.bounds.width/1.3
    
    func retreivePage(lesson: String) {
        if let index = datas.lessonIndices[lesson] {
            if (index <= c) {
                self.page = index
                isShowing = false
            }
            
        }
    }
    
    @ViewBuilder
    func fetchSubtopicsView(lesson: Lesson) -> some View {
        if datas.showingSubtopics[lesson.title] != nil && datas.showingSubtopics[lesson.title] == true {
                    VStack {
                        ForEach(lesson.subtopics, id:\.self) { subtopic in
                            Button(action: {
                                retreivePage(lesson: subtopic)
                           }) {
            
                             Text("\(subtopic)")
                           }
                           .foregroundColor(.black)
                           .lineLimit(1)
                           .frame(width: (screenWidth/1.5 - 5), alignment: .leading)
                           .padding(.bottom, 1)
                           .padding(.leading, 5)
                        }
                    }
        }
    }
    
    struct PopulatedSubtopics: View {
        var body: some View {
             navigationBarTitle("Populated State")
        }
    }


    
    func nextPage() {
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
                        ForEach(datas.lessons, id: \.self) { lesson in
                            if (lesson.subtopics.count != 0) {
                                HStack {
                                    Button(action: {
                                       retreivePage(lesson: lesson.title)
                                   }) {
       
                                     Text("\(lesson.title)")
                                           .foregroundColor(.black)
                                   }
                                   .lineLimit(1)
                                    Spacer()
                                    Button(action: {
                                        datas.toggleShowingSubtopic(lesson: lesson.title)
                                   }) {
       
                                       Image(systemName: "chevron.down")
                                   }
                                }.frame(width: (screenWidth/1.5 - 5), alignment: .leading)
                                    .padding(.bottom, 1)
                                    .padding(.leading, 1)
                                fetchSubtopicsView(lesson: lesson)
                            } else {
                                Button(action: {
                                   retreivePage(lesson: lesson.title)
                               }) {
   
                                 Text("\(lesson.title)")
                                       .foregroundColor(.black)
                               }
                               .lineLimit(1)
                               .frame(width: (screenWidth/1.5 - 5), alignment: .leading)
                               .padding(.bottom, 1)
                               .padding(.leading, 1)
                            }
                            Divider()
                            
                        }
                        Spacer()
                    }
                    .padding(.top, 70)
                    .frame(width: (sideMenuWidth))
                        
                }
                
          
            }
        }
  
   
    var body: some View {
        ZStack {
            VStack {
                Text(datas.lessons[page].title)
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .padding(.top, 60)
                    .padding(.bottom, 10)
                    
                Text(datas.lessons[page].subtitle)
                    .foregroundColor(.black)
                    .frame(width: 300, alignment: .center)
                    .padding(.bottom, 10)
                    
                Spacer()
                Button(action: {
                    nextPage()
                    print(datas.lessons.count)
                      }) {
                Text("Next")
                          .foregroundColor(.black)
                          .font(.title)
                      }
                      .padding(.bottom, 70)
               
                
            }
            .zIndex(1)
            
            if (isShowing) {
                sideBar.zIndex(2)
            }
            
        }
        .frame(width: screenWidth, height: UIScreen.main.bounds.height, alignment: .center)
        .background(.white)
        .gesture(DragGesture(minimumDistance: 0).onEnded({ (value) in
            if (isShowing) {
                if (value.location.x < (screenWidth - sideMenuWidth)) {
                    isShowing = false
                    datas.resetShowingSubtopics()
                }
                
            }
            }))
        
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
                                       .foregroundColor(.black)
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



