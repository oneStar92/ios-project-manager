//
//  TaskEntityDummy.swift
//  ProjectManager
//
//  Created by 이정민 on 2023/01/17.
//

import Foundation

struct TaskEntityDummy {
    /// state
    /// case 1 = todo
    /// case 2 = doing
    /// case 3 = done
    
    static var dummys: [TaskEntity] = [
        TaskEntity(
            id: "1",
            title: "RxSwift 추가",
            content: "제곧내",
            deadLine: 1674140400, // 2023년
            state: 0
        ),
        
        TaskEntity(
            id: "2",
            title: "제목제목제목",
            content: "내용내용내용",
            deadLine: 1673881200,
            state: 0
        ),
        
        TaskEntity(
            id: "3",
            title: "제목제목제목",
            content: "내용내용내용",
            deadLine: 1672498800.0,
            state: 0
        ),
        
        TaskEntity(
            id: "4",
            title: "제목제목제목",
            content: "내용내용내용",
            deadLine: 1677596400.0,
            state: 0
        ),
        
        TaskEntity(
            id: "5",
            title: "Mock Repository 만들기",
            content: "아얀이 열심히 만듦",
            deadLine: 1675436400.0,
            state: 1
        ),
        
        TaskEntity(
            id: "6",
            title: "step2 PR",
            content: "coordinator까지 만들어서 보내기",
            deadLine: 1674140400,
            state: 1
        ),
        
        TaskEntity(
            id: "7",
            title: "RxSwift 추가",
            content: "제곧내",
            deadLine: 1674147600,
            state: 2
        )
    ]
}
