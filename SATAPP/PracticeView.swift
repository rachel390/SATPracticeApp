//
//  PracticeView.swift
//  SATAPP
//
//  Created by Rachel Mills on 1/7/24.
//

import SwiftUI

struct PracticeView: View {
    var body: some View {
            ZStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            } .toolbar (content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "line.3.horizontal")
                }
            })
        
       
 
        
        
    }
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView()
    }
}