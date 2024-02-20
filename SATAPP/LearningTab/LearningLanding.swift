//
//  LearningLanding.swift
//  SATAPP
//
//  Created by Rachel Mills on 2/19/24.
//

import SwiftUI

struct LearningLanding: View {
    @ObservedObject var datas = LessonModel()
    @State private var page = 0
    
    func nextPage() {
        if (self.page < datas.lessons.count) {
            self.page = self.page + 1
        }
    }
   
    var body: some View {
        VStack {
            Text(datas.lessons[page].title).font(.largeTitle)
                .padding(.bottom, 10)
//            Text("Click the side panel to access in depth lessons and practice for topics on the SAT")
//                .frame(width: 300)
//                .padding(.bottom, 10)
            Text(datas.lessons[page].subtitle)
                .frame(width: 300, alignment: .center)
                .padding(.bottom, 10)
            Spacer()
            Button(action: {
                nextPage() 
                  }) {
            Text("Next")
                      .font(.title)
                  }
                  .padding(.bottom, 20)
        }.frame(alignment: .center)
    
        
    }
}

struct LearningLanding_Previews: PreviewProvider {
    static var previews: some View {
        LearningLanding()
    }
}

