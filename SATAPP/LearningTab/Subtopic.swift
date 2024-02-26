//
//  Lesson.swift
//  SATAPP
//
//  Created by Rachel Mills on 2/19/24.
//

import Foundation

struct Subtopic: Identifiable, Decodable, Hashable {
    enum CodingKeys: CodingKey {
           case title
           case subtitle
           case parent
       }
       
    var id = UUID()
    var title: String
    var subtitle: String
    var parent: String
}
