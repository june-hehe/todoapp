//
//  ProfileViewController.swift
//  ToDoApp
//
//  Created by DJ S on 2023/09/18.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Nav Bar 생성
        let navBar = UIView()
        navBar.backgroundColor = .white
        navBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navBar)
        
        // 이미지 뷰 생성 및 이미지 설정
        let navBarImageView = UIImageView()
        navBarImageView.image = UIImage(named: "ProfileImage") // 이미지 이름을 적절히 변경하세요
        navBarImageView.contentMode = .scaleAspectFit
        navBarImageView.translatesAutoresizingMaskIntoConstraints = false
        navBar.addSubview(navBarImageView)
        
        // "nabaecamp" 레이블 생성
        let label = UILabel()
        label.text = "nabaecamp"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        // 버튼 생성
        let button = UIButton(type: .custom)
        //                button.setTitle("button", for: .normal)
        button.setImage(UIImage(named: "Menu"), for: .normal) // "Menu" 이미지 설정
        button.titleLabel?.font = UIFont.systemFont(ofSize: 21)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        // 버튼의 액션 설정
        button.addTarget(self, action: #selector(menuTapped), for: .touchUpInside)
        
        // 이전 화면으로 돌아가는 "뒤로 가기" 버튼 생성
        let backButton2 = UIButton(type: .system)
        backButton2.setTitle("back", for: .normal)
        backButton2.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton2)
        
        // 이미지뷰 생성
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Ellipse 1")
        imageView.contentMode = .scaleAspectFit // 이미지 콘텐트 모드 설정
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        // Labels
        let postLabel = UILabel()
        postLabel.text = "post"
        postLabel.font = UIFont.systemFont(ofSize: 14)
        postLabel.textAlignment = .center
        postLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(postLabel)
        
        let followerLabel = UILabel()
        followerLabel.text = "follower"
        followerLabel.font = UIFont.systemFont(ofSize: 14)
        followerLabel.textAlignment = .center
        followerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(followerLabel)
        
        let followingLabel = UILabel()
        followingLabel.text = "following"
        followingLabel.font = UIFont.systemFont(ofSize: 14)
        followingLabel.textAlignment = .center
        followingLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(followingLabel)
        
        let postCountLabel = UILabel()
        postCountLabel.text = "7"
        postCountLabel.font = UIFont.systemFont(ofSize: 16.5)
        postCountLabel.textAlignment = .center
        postCountLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(postCountLabel)
        
        let followerCountLabel = UILabel()
        followerCountLabel.text = "0"
        followerCountLabel.font = UIFont.systemFont(ofSize: 16.5)
        followerCountLabel.textAlignment = .center
        followerCountLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(followerCountLabel)
        
        let followingCountLabel = UILabel()
        followingCountLabel.text = "0"
        followingCountLabel.font = UIFont.systemFont(ofSize: 16.5)
        followingCountLabel.textAlignment = .center
        followingCountLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(followingCountLabel)
        
        let labelStackView = UIStackView(arrangedSubviews: [postLabel, followerLabel, followingLabel])
        labelStackView.axis = .horizontal
        labelStackView.alignment = .center
        labelStackView.spacing = 38
        
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelStackView)
        
        // 나머지 레이블 생성 및 설정
        let label1 = UILabel()
        label1.text = "르탄이"
        label1.font = UIFont.systemFont(ofSize: 14)
        label1.textAlignment = .center
        label1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label1)
        
        let label2 = UILabel()
        label2.text = "iOS Developer 🍎"
        label2.font = UIFont.systemFont(ofSize: 14)
        label2.textAlignment = .center
        label2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label2)
        
        let label3 = UILabel()
        label3.text = "spartacodingclub.kr"
        label3.font = UIFont.systemFont(ofSize: 14)
        label3.textAlignment = .center
        label3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label3)
        
        // 수직 스택뷰 생성 및 설정
        let labelStackView2 = UIStackView(arrangedSubviews: [label1, label2, label3])
        labelStackView2.axis = .vertical
        labelStackView2.alignment = .leading // 원하는 정렬에 맞게 조정
        labelStackView2.spacing = 8 // 원하는 간격에 맞게 조정
        labelStackView2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelStackView2)
        
        // Follow 버튼 생성
        let followButton = UIButton(type: .system)
        followButton.setTitle("Follow", for: .normal)
        followButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        followButton.translatesAutoresizingMaskIntoConstraints = false
        followButton.addTarget(self, action: #selector(followButtonTapped), for: .touchUpInside)
        followButton.setTitleColor(UIColor.white, for: .normal)
        let followButtonColor = UIColor(red: 56.0/255.0, green: 152.0/255.0, blue: 243.0/255.0, alpha: 1.0)
        followButton.backgroundColor = followButtonColor
        view.addSubview(followButton)
        
        
        // Message 버튼 생성
        let messageButton = UIButton(type: .system)
        messageButton.setTitle("Message", for: .normal)
        messageButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        messageButton.translatesAutoresizingMaskIntoConstraints = false
        messageButton.addTarget(self, action: #selector(messageButtonTapped), for: .touchUpInside)
        // Message 버튼 윤곽선 설정
        messageButton.layer.borderWidth = 1.0 // 윤곽선 두께
        messageButton.layer.borderColor = UIColor.gray.cgColor // 윤곽선 색상
        // Message 버튼 글자색 설정 (검은색)
        messageButton.setTitleColor(UIColor.black, for: .normal)
        // Message 버튼 모서리 둥글게 설정
        messageButton.layer.cornerRadius = 4 // 모서리 반지름 설정
        view.addSubview(messageButton)
        
        // More 버튼 생성
        let moreButton = UIButton(type: .custom)
        //        moreButton.setTitle("More", for: .normal)
        moreButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        moreButton.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
        let moreButtonImage = UIImage(named: "MoreButton")
        moreButton.setImage(moreButtonImage, for: .normal)
        // More 버튼 배경색을 투명하게 설정
        moreButton.backgroundColor = UIColor.clear
        // More 버튼 윤곽선 설정
        moreButton.layer.borderWidth = 1.0 // 윤곽선 두께
        moreButton.layer.borderColor = UIColor.gray.cgColor // 윤곽선 색상
        // Message 버튼 모서리 둥글게 설정
        moreButton.layer.cornerRadius = 4 // 모서리 반지름 설정
        view.addSubview(moreButton)
        
        
        // 세 개의 버튼을 가로로 배열하기 위한 수평 스택뷰 생성
        let buttonStackView = UIStackView(arrangedSubviews: [followButton, messageButton, moreButton])
        buttonStackView.axis = .horizontal
        buttonStackView.alignment = .fill
        buttonStackView.spacing = 8
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonStackView)
        
        // 구분선 생성
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(red: 0.859, green: 0.859, blue: 0.859, alpha: 1)
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(separatorView)
        
        // Grid 버튼 생성
        let gridButton = UIButton(type: .custom)
        gridButton.setImage(UIImage(named: "Grid"), for: .normal) // "Grid" 이미지 설정
        gridButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gridButton)
        
        // 오토레이아웃 제약 조건 설정
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 54),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 139),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -139),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -733),
            label.widthAnchor.constraint(equalToConstant: 97),
            label.heightAnchor.constraint(equalToConstant: 25),
            
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 338),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 58),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -736.5),
            
            backButton2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -338),
            backButton2.topAnchor.constraint(equalTo: view.topAnchor, constant: 58),
            backButton2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -736.5),
            
            imageView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 14), // 레이블 아래로부터 14 포인트 띄워져 있도록 설정
            imageView.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -37),
            imageView.widthAnchor.constraint(equalToConstant: 100), // 이미지뷰의 너비 설정
            imageView.heightAnchor.constraint(equalToConstant: 100), // 이미지뷰의 높이 설정
            imageView.widthAnchor.constraint(equalToConstant: 88),// 이미지뷰의 너비를 88로 설정
            imageView.heightAnchor.constraint(equalToConstant: 88), // 이미지뷰의 높이를 88로 설정
            
            //                mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelStackView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 59),
            labelStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            
            // postLabel을 postCountLabel의 x축 가운데에 위치
            postLabel.topAnchor.constraint(equalTo: postCountLabel.bottomAnchor, constant: 0),
            postCountLabel.centerXAnchor.constraint(equalTo: postLabel.centerXAnchor),
            
            // followerLabel을 followerCountLabel의 x축 가운데에 위치
            followerLabel.topAnchor.constraint(equalTo: followerCountLabel.bottomAnchor, constant: 0),
            followerCountLabel.centerXAnchor.constraint(equalTo: followerLabel.centerXAnchor),
            
            // followingLabel을 followingCountLabel의 x축 가운데에 위치
            followingLabel.topAnchor.constraint(equalTo: followingCountLabel.bottomAnchor, constant: 0),
            followingCountLabel.centerXAnchor.constraint(equalTo: followingLabel.centerXAnchor),
            
            // 이미지뷰 아래로 14포인트 떨어짐
            labelStackView2.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 14),
            
            // 뷰의 왼쪽과 15포인트 떨어짐
            labelStackView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            // 버튼 스택뷰 아래로 8포인트 떨어짐
            buttonStackView.topAnchor.constraint(equalTo: labelStackView2.bottomAnchor, constant: 11),
            // 버튼 스택뷰의 왼쪽과 15포인트 떨어짐
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            // 버튼 스택뷰의 오른쪽과 15포인트 떨어짐
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            moreButton.widthAnchor.constraint(equalTo: moreButton.heightAnchor),
            followButton.widthAnchor.constraint(equalTo: messageButton.widthAnchor),
            
            separatorView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 10),
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1), // 구분선의 높이 설정
            
            gridButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 52),
                gridButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -300.5),
                gridButton.topAnchor.constraint(equalTo: followButton.bottomAnchor, constant: 20),
            gridButton.heightAnchor.constraint(equalToConstant: 22.5), // 원하는 높이로 조정
            
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                navBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                navBar.heightAnchor.constraint(equalToConstant: 44),
                
                navBarImageView.centerXAnchor.constraint(equalTo: navBar.centerXAnchor),
                navBarImageView.centerYAnchor.constraint(equalTo: navBar.centerYAnchor),
                navBarImageView.widthAnchor.constraint(equalToConstant: 30), // 이미지 뷰의 너비 설정
                navBarImageView.heightAnchor.constraint(equalToConstant: 30) // 이미지 뷰의 높이 설정
            
        ])
    }
    
    @objc func menuTapped() {
        
    }
    
    @objc func backButtonTapped() {
        // 이전 화면으로 돌아가는 코드를 추가
        dismiss(animated: true, completion: nil)
    }
    
    @objc func followButtonTapped() {
        // Follow 버튼이 눌렸을 때 수행할 동작을 추가
    }
    
    @objc func messageButtonTapped() {
        // Message 버튼이 눌렸을 때 수행할 동작을 추가
    }
    
    @objc func moreButtonTapped() {
        // More 버튼이 눌렸을 때 수행할 동작을 추가
    }
}
