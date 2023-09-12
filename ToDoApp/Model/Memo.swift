//
//  Memo.swift
//  ToDoApp
//
//  Created by DJ S on 2023/09/12.
//

import Foundation

class Memo {
    var id: String // 메모를 고유하게 식별하기 위한 ID
    var content: String
    var date: Date
    var isCompleted: Bool // 새로 추가한 필드

    
    init(content: String) {
        self.id = UUID().uuidString // 고유한 ID 생성
        self.content = content
        self.date = Date() // 현재 시간으로 초기화
        self.isCompleted = false // 초기값으로 미완료 상태로 설정
    }
}
