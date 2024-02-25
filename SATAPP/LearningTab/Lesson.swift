//
//  Lesson.swift
//  SATAPP
//
//  Created by Rachel Mills on 2/19/24.
//

import Foundation

struct Lesson: Identifiable, Decodable {
    enum CodingKeys: CodingKey {
           case title
           case subtitle
           case subtopics
       }
       
    var id = UUID()
    var title: String
    var subtitle: String
    var subtopics: [String]
}
