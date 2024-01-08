//
//  HomeSideMenu.swift
//  SATAPP
//
//  Created by Rachel Mills on 1/8/24.
//

import SwiftUI

struct HomeSideMenu: View {
    
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        HStack {
            Spacer()
            Rectangle()
                .fill(.white)
                .frame(width: (UIScreen.main.bounds.width/2), height: UIScreen.main.bounds.height)
                .edgesIgnoringSafeArea(.top)
                .shadow(color: .gray, radius: 20)
      
        }
    }
}

//struct HomeSideMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeSideMenu()
//    }
//}
