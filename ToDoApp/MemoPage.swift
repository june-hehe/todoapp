//
//  MemoPage.swift
//  ToDoApp
//
//  Created by DJ S on 2023/09/12.
//

import UIKit

class MemoViewController: UIViewController {

    // 텍스트 뷰 생성
    let textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.isScrollEnabled = true
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // 뷰 배경색 설정 (선택사항)
        view.backgroundColor = .white

        // 네비게이션 바 설정
        navigationItem.title = "작성하기"
        
        // 저장 버튼 추가
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonTapped))
        
        // 텍스트 뷰를 뷰에 추가
        view.addSubview(textView)

        // Auto Layout 설정
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
    
    // 저장 버튼이 눌렸을 때 호출되는 메서드
    @objc private func saveButtonTapped() {
        // 텍스트 뷰의 내용을 가져옴
        guard let memoText = textView.text, !memoText.isEmpty else {
            // 내용이 비어있는 경우 경고 메시지 표시
            let alertController = UIAlertController(title: "알림", message: "내용을 입력해주세요.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        // Memo 객체 생성
        let memo = Memo(content: memoText)
        
        // MemoManager를 사용하여 메모를 저장
        MemoManager.shared.addMemo(memo)
        
        // 저장된 메모 목록을 출력 (테스트용)
        let savedMemos = MemoManager.shared.getMemos()
        print("저장된 메모 목록: \(savedMemos)")
        
        // 기존의 ToDoListTableView를 가져옴 (최초 생성 시 한 번만 생성)
        if let toDoListViewController = navigationController?.viewControllers.first(where: { $0 is ToDoListTableView }) as? ToDoListTableView {
            // 이전 뷰 컨트롤러로 돌아감
            navigationController?.popToViewController(toDoListViewController, animated: true)
        }
    }


}
