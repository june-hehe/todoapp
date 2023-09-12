//
//  completedListTableView.swift
//  ToDoApp
//
//  Created by DJ S on 2023/09/12.
//

import UIKit

class CompletedListTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "완료된일"
        
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
        return MemoManager.shared.getCompletedMemos().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "CompletedTodoCell")
        let completedMemos = MemoManager.shared.getCompletedMemos()
        let memo = completedMemos[indexPath.row]

        // 메모 내용 표시
        cell.textLabel?.text = memo.content

        // 메모 시간 표시 (Date를 문자열로 변환)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분" // 원하는 날짜 형식을 설정하세요
        let dateString = dateFormatter.string(from: memo.date)

        // 시간을 detailTextLabel에 표시
        cell.detailTextLabel?.text = dateString

        // 글자색 설정 (예: 검정색)
        cell.textLabel?.textColor = UIColor.black
        cell.detailTextLabel?.textColor = UIColor.lightGray

        return cell
    }
}
