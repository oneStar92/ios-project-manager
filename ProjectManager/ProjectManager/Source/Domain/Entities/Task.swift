//
//  Task.swift
//  ProjectManager
//
//  Created by ayaan, jpush on 2023/01/17.
//

import Foundation

struct Task: Hashable {
    let id: String
    var title: String
    var content: String
    var deadLine: Double
    var state: State
    var isExpired: Bool {
        deadLine < Date.startOfCurrentDay.timeIntervalSince1970
    }
    
    enum State: Int, CaseIterable {
        case toDo
        case doing
        case done
        
        var title: String {
            switch self {
            case .toDo:
                return "TODO"
            case .doing:
                return "DOING"
            case .done:
                return "DONE"
            }
        }
    }
    
    init(
        id: String = UUID().uuidString,
        title: String,
        content: String,
        deadLine: Double,
        state: State = .toDo
    ) {
        self.id = id
        self.title = title
        self.content = content
        self.deadLine = deadLine
        self.state = state
    }
}
