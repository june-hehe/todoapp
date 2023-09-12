//
//  MemoManager.swift
//  ToDoApp
//
//  Created by DJ S on 2023/09/12.
//

import Foundation

class MemoManager {
    static let shared = MemoManager()
    
    private var memos: [Memo] = []
    private var completedMemos: [Memo] = [] // 완료된 메모를 저장할 배열
    
    private init() {
        // 싱글톤 인스턴스를 생성할 때 초기화 로직을 추가 가능
    }
    
    func addMemo(_ memo: Memo) {
        memos.append(memo)
    }
    
    func getMemos() -> [Memo] {
        return memos
    }
    
    func getCompletedMemos() -> [Memo] {
        return completedMemos
    }
    
    func toggleMemoCompletion(at index: Int) {
        if index >= 0 && index < memos.count {
            memos[index].isCompleted.toggle()
            
            // 메모가 완료 상태인지 확인하여 completedMemos 배열에 추가 또는 제거
            if memos[index].isCompleted {
                completedMemos.append(memos[index])
            } else {
                if let indexInCompleted = completedMemos.firstIndex(where: { $0.id == memos[index].id }) {
                    completedMemos.remove(at: indexInCompleted)
                }
            }
        }
    }
    
}
