//
//  ProfileViewController.swift
//  ToDoApp
//
//  Created by DJ S on 2023/09/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // 상단에 "Profile" 라벨 추가
        let titleLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 24)
            label.textAlignment = .center
            label.text = "Profile" // "Profile" 텍스트 추가
            return label
        }()
    
    // 이름과 나이를 표시할 라벨 선언
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    let nLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    let aLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        // "Profile" 라벨 추가
                view.addSubview(titleLabel)
        
        // 이름 라벨 설정
        nameLabel.text = "dongjun" // 이름을 원하는 값으로 설정
        view.addSubview(nameLabel)
        
        nLabel.text = "이름"
        view.addSubview(nLabel)
        
        // 나이 라벨 설정
        ageLabel.text = "31" // 나이를 원하는 값으로 설정
        view.addSubview(ageLabel)
        
        aLabel.text = "나이" // 나이를 원하는 값으로 설정
        view.addSubview(aLabel)
        
        // 라벨들의 오토레이아웃 설정
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30), // 최상단에 위치
            
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100), // 이름 라벨의 Y 좌표를 조정
            
            nLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100), // 이름 라벨의 Y 좌표를 조정
            
            ageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20), // 나이 라벨의 Y 좌표를 조정
            
            aLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            aLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20), // 이름 라벨의 Y 좌표를 조정

        ])
    }
}

