//
//  LearningLanding.swift
//  SATAPP
//
//  Created by Rachel Mills on 2/19/24.
//

import SwiftUI

struct LearningLanding: View {
    private var lessonTitle = "Learning"
    private var lessonSubtitle = "Read Below to Learn more about the Structure of the SAT"
    @State private var image: [Image] = []
    var body: some View {
        VStack {
            Text(lessonTitle).font(.largeTitle)
                .padding(.bottom, 10)
//            Text("Click the side panel to access in depth lessons and practice for topics on the SAT")
//                .frame(width: 300)
//                .padding(.bottom, 10)
            Text(lessonSubtitle)
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
