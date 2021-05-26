//
//  RankModel.swift
//  Focus
//
//  Created by Frank chen on 5/25/21.
//
import Foundation

class rankModel: ObservableObject {
    var userName: String
    @Published var total_time: Int
    
    init(name: String, time: Int) {
        userName = name
        total_time = time
    }
    
    func setTime(newTime: Int) {
        total_time = newTime
    }
}

extension rankModel: Identifiable {
    var id: String { userName }
}

class rankList: ObservableObject {
    @Published var ranks = [rankModel]()
    
    func add(newEntry: rankModel) {
        ranks.append(newEntry)
    }
    
    func mySort() {
        ranks.sort(by: {$0.total_time > $1.total_time})
    }
}
