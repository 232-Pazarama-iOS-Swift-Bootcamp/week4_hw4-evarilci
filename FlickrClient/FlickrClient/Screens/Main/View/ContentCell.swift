//
//  ContentCell.swift
//  FlickrClient
//
//  Created by Eymen Varilci on 12.10.2022.
//

import UIKit
import SnapKit

class ContentCell: UITableViewCell {
    
    private(set) lazy var contentImageView = UIImageView()
    private lazy var userNameLabel = UILabel()
    private lazy var likeButton = UIButton()
    private lazy var saveButton = UIButton()
    private lazy var titleLable = UILabel()
    
    let viewModel = HomeViewModel()
    
    var title : String? {
        set {
            titleLable.text = newValue
        }
        get {
            titleLable.text
        }
    }

    var username : String? {
        set {
            userNameLabel.text = newValue
        }
        get {
            userNameLabel.text
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        configureUserNameLabel()
        configureImageView()
        configureTitleLable()
        configureLikeButton()
        configureSaveButton()
        
        //setContent()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContent(){
        
        
        
        contentImageView.image = UIImage(named: "data")
        userNameLabel.text = "@evarilci69"
    }
    
    
    
    func configureImageView() {
        addSubview(contentImageView)
        contentImageView.layer.cornerRadius = 25
        contentImageView.clipsToBounds = true
        contentImageView.snp.makeConstraints { make in
            
            
            //make.width.equalToSuperview().offset(-8)
            make.centerX.equalToSuperview()
            make.height.equalTo(400)
            make.width.equalTo(contentImageView.snp.height).multipliedBy(12.0 / 9.0).offset(-8)
            make.top.equalTo(userNameLabel.snp.bottom).offset(24)
        }
    }
    
    func configureTitleLable() {
        addSubview(titleLable)
        titleLable.numberOfLines = .max
        titleLable.snp.makeConstraints { make in
            make.top.equalTo(contentImageView.snp.bottom).offset(12)
            make.leading.equalTo(contentImageView.snp.leading)
            make.trailing.equalTo(contentImageView.snp.trailing)
            make.width.equalToSuperview().offset(-8)
            make.height.equalTo(30)
            
            
        }
    }
    
    func configureUserNameLabel() {
        
        userNameLabel.layer.borderWidth = 1.0
        userNameLabel.backgroundColor = UIColor(hexString: "#ede7e1").withAlphaComponent(0.5)
        userNameLabel.font = UIFont(name: "Helvetica", size: 20.0)
        userNameLabel.layer.cornerRadius = 25.0
        userNameLabel.layer.borderColor = UIColor(hexString: "#bae4e5").cgColor
        userNameLabel.clipsToBounds = true
        userNameLabel.textAlignment = .center
        addSubview(userNameLabel)
        userNameLabel.adjustsFontSizeToFitWidth = true
        userNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(50)
            //make.width.equalToSuperview()
        }
    }
    
    func configureLikeButton() {
        
        addSubview(likeButton)
        likeButton.layer.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        likeButton.setImage(UIImage(named:"heart"), for: .normal)
        likeButton.snp.makeConstraints { make in
            make.top.equalTo(titleLable.snp.bottom).offset(15)
            make.width.height.equalTo(40)
            make.leading.equalTo(contentImageView.snp.leading).offset(10)
        }
       
    }
    
    func configureSaveButton() {
        addSubview(saveButton)
        saveButton.layer.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        saveButton.setImage(UIImage(named:"floppy"), for: .normal)
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(titleLable.snp.bottom).offset(15)
            make.width.height.equalTo(40)
            make.trailing.equalTo(contentImageView.snp.trailing).offset(-16)
        }
    }
    
}

extension ConstraintMaker {
    public func aspectRatio(_ ratio: CGSize) {
        let view = item as! ConstraintView
        self.width.equalTo(view.snp.height).multipliedBy(ratio.width / ratio.height)
    }
}
