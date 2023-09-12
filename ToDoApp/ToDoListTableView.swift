//
//  ViewController.swift
//  ToDoApp
//
//  Created by DJ S on 2023/09/12.
//

import UIKit

class ToDoListTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView()
    var contentList = MemoManager.shared
    var navigationBar = UINavigationBar()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 화면이 나타날 때마다 테이블 뷰를 업데이트
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TodoCell")
        
        view.backgroundColor = .white
        
        navigationItem.title = "할일"
        navigationItem.setRightBarButton(UIBarButtonItem(title: "추가", style: .plain, target: self, action: #selector(onClickAddButton(_:))), animated: false)
        
        // UITableView 생성
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        // UITableView의 Auto Layout 제약 조건 설정
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    
    // 나머지 UITableViewDataSource 및 UITableViewDelegate 메서드 구현은 여기에 추가
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contentList.getMemos().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        
        // MemoManager에서 메모 가져오기
        let memos = contentList.getMemos()
        
        // indexPath.row에 해당하는 메모를 가져와서 표시
        if indexPath.row < memos.count {
            let memo = memos[indexPath.row]
            
            // 셀 스타일을 Subtitle로 설정
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "TodoCell")
            // 메모 내용 표시
            cell.textLabel?.text = memo.content
            // 메모 시간 표시 (Date를 문자열로 변환)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분" // 원하는 날짜 형식을 설정
            let dateString = dateFormatter.string(from: memo.date)
            // 시간을 detailTextLabel에 표시
            cell.detailTextLabel?.text = dateString
            // 글자색 설정 (예: 검정색)
            cell.textLabel?.textColor = UIColor.black
            cell.detailTextLabel?.textColor = UIColor.lightGray
            
            // 토글 스위치 생성
            let toggleSwitch = UISwitch()
            toggleSwitch.isOn = memo.isCompleted
            toggleSwitch.tag = indexPath.row // 스위치를 식별하기 위한 고유한 태그 할당
            
            // 스위치 값 변경을 처리하기 위한 타겟 액션 추가
            toggleSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
            
            // 셀의 accessoryView에 스위치 추가
            cell.accessoryView = toggleSwitch
        } else {
            cell.textLabel?.text = "No Memo"
            cell.detailTextLabel?.text = ""
        }
        
        return cell
    }
    
    
    // 메모의 날짜를 원하는 형식으로 포맷하는 함수
    private func formatMemoDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // 원하는 날짜 형식을 설정
        return dateFormatter.string(from: date)
    }
    
    @objc
    private func onClickAddButton(_ sender: Any?) {
        let MemoViewController = MemoViewController()
        // 네비게이션 컨트롤러에 푸시하여 화면 전환
        navigationController?.pushViewController(MemoViewController, animated: true)
    }
    
    @objc private func switchValueChanged(_ sender: UISwitch) {
        let row = sender.tag // 스위치에 대한 행을 가져옵니다.

            // 메모의 완료 상태만 토글
            contentList.toggleMemoCompletion(at: row)
    }
}
