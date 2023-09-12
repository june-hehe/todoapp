//
//  ViewController.swift
//  ToDoApp
//
//  Created by DJ S on 2023/09/12.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // 이미지뷰 생성 및 설정
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "memoImage") // 실제 이미지 파일 이름으로 변경
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        // 버튼 1 생성
        let button1 = UIButton(type: .system)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.setTitle("할일 확인하기", for: .normal)
        button1.titleLabel?.font = UIFont.systemFont(ofSize: 20) // 글자 크기 조절 (여기서는 18로 설정)
        button1.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        view.addSubview(button1)
        
        // 버튼 2 생성
        let button2 = UIButton(type: .system)
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.setTitle("완료된일 보기", for: .normal)
        button2.titleLabel?.font = UIFont.systemFont(ofSize: 20) // 글자 크기 조절 (여기서는 18로 설정)
        button2.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside)
        view.addSubview(button2)
        
        // 오토레이아웃 설정
        NSLayoutConstraint.activate([
            // 이미지뷰 중앙 정렬
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            // 버튼 1 아래에 배치
            button1.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            button1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            button1.widthAnchor.constraint(equalToConstant: 100),
            button1.heightAnchor.constraint(equalToConstant: 40),
            
            // 버튼 2 아래에 배치
            button2.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 80),
            button2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            button2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            button2.widthAnchor.constraint(equalToConstant: 100),
            button2.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    // 버튼 1 동작 함수
    @objc func button1Tapped() {
        // ToDoListTableView 뷰 컨트롤러 인스턴스 생성
            let toDoListViewController = ToDoListTableView()
        // 네비게이션 컨트롤러에 푸시하여 화면 전환
            navigationController?.pushViewController(toDoListViewController, animated: true)
    }
    
    // 버튼 2 동작 함수
    @objc func button2Tapped() {
        // ToDoListTableView 뷰 컨트롤러 인스턴스 생성
            let completedListTableView = CompletedListTableView()
        // 네비게이션 컨트롤러에 푸시하여 화면 전환
            navigationController?.pushViewController(completedListTableView, animated: true)
    }
}
