//
//  ContentCell.swift
//  FlickrClient
//
//  Created by Eymen Varilci on 12.10.2022.
//

import UIKit

class ContentCell: UITableViewCell {
    
    private lazy var contentImageView = UIImageView()
    private lazy var userNameLabel = UILabel()
    private lazy var likeButton = UIButton()
    private lazy var saveButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        configureUserNameLabel()
        configureImageView()
        configureLikeButton()
        configureSaveButton()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func setContent(){
//        contentImageView.image = UIImage(named: "data")
//        userNameLabel.text = "@evarilci69"
//    }
    
    func configureImageView() {
        addSubview(contentImageView)
        contentImageView.layer.cornerRadius = 25
        contentImageView.clipsToBounds = true
        contentImageView.snp.makeConstraints { make in
            make.width.equalToSuperview().offset(-8)
            make.centerX.equalToSuperview()
            make.height.equalTo(470)
            make.top.equalTo(userNameLabel.snp.bottom).offset(16)
        }
    }
    
    func configureUserNameLabel() {
        addSubview(userNameLabel)
        userNameLabel.adjustsFontSizeToFitWidth = true
        userNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(50)
            make.width.equalToSuperview()
        }
    }
    
    func configureLikeButton() {
        addSubview(likeButton)
        likeButton.snp.makeConstraints { make in
            make.top.equalTo(contentImageView.snp.bottom).offset(16)
            make.width.height.equalTo(25)
            make.leading.equalTo(contentImageView.snp.leading).offset(10)
        }
       
    }
    
    func configureSaveButton() {
        addSubview(saveButton)
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(contentImageView.snp.bottom).offset(16)
            make.width.height.equalTo(25)
            make.trailing.equalTo(contentImageView.snp.trailing).offset(-16)
        }
    }
    
}
