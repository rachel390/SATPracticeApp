//
//  LessonModel.swift
//  SATAPP
//
//  Created by Rachel Mills on 2/19/24.
//

import Foundation
import Combine

class LessonModel: ObservableObject {
    @Published var lessons = [Lesson]()
    @Published var lessonIndices = [String: Int]()
    @Published var showingSubtopics = [String: Bool]()
    @Published var subtopics = [Subtopic]()
    @Published var subtopicIndices = [String: Int]()
    
        
    init(){
        loadData()
    }
    
    func toggleShowingSubtopic(lesson: String) {
        if showingSubtopics[lesson] != nil && showingSubtopics[lesson] == true {
            showingSubtopics[lesson] = false
        } else if showingSubtopics[lesson] != nil && showingSubtopics[lesson] == false {
            showingSubtopics[lesson] = true
        }
    }
    
    func resetShowingSubtopics() {
        for lesson in self.lessons {
            if (lesson.subtopics.count != 0) {
                showingSubtopics[lesson.title] = false
            }
        }
    }
    
    
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "lessonData", withExtension: "json")
            else {
                print("Json file not found")
                return
            }
        
        let data = try? Data(contentsOf: url)
        let lessons = try? JSONDecoder().decode([Lesson].self, from: data!)
        self.lessons = lessons!
        
        //Populating hashtable with indices
        
        var temp = 0
        
        for lesson in self.lessons {
            lessonIndices[lesson.title] = temp
            if (lesson.subtopics.count != 0) {
                showingSubtopics[lesson.title] = false
            }
            temp += 1
        }
        
    }
    
   
}
