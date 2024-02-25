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
    @Published var indices = [String: Int]()
    
        
    init(){
        loadData()
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
        
        //TODO: populate hashtable with indices upon init for easy grabbing of data 
        
    }
    
   
}
