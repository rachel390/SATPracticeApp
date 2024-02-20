//
//  LearningLanding.swift
//  SATAPP
//
//  Created by Rachel Mills on 2/19/24.
//

import SwiftUI

struct LearningLanding: View {
    @ObservedObject var datas = LessonModel()
   
    var body: some View {
        VStack {
            Text(datas.lessons[0].title).font(.largeTitle)
                .padding(.bottom, 10)
//            Text("Click the side panel to access in depth lessons and practice for topics on the SAT")
//                .frame(width: 300)
//                .padding(.bottom, 10)
            Text(datas.lessons[0].subtitle)
                .frame(width: 300, alignment: .center)
                .padding(.bottom, 10)
            Spacer()
        }.frame(alignment: .center)
    
        
    }
}

struct LearningLanding_Previews: PreviewProvider {
    static var previews: some View {
        LearningLanding()
    }
}
