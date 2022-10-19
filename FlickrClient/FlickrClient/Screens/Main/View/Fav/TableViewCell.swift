//
//  TableViewCell.swift
//  FlickrClient
//
//  Created by Eymen Varilci on 19.10.2022.
//

import UIKit
import SnapKit



final class FavCell: UITableViewCell {
    
    private(set) lazy var contentImageView = UIImageView()
    private lazy var userNameLabel = UILabel()
    
    
    private lazy var titleLable = UILabel()
    private var image = UIImage(named: "heart")
    
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
            userNameLabel.text = "  @\(newValue!)"
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImageView() {
        contentView.addSubview(contentImageView)
        contentImageView.layer.cornerRadius = 25
        contentImageView.clipsToBounds = true
        contentImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(400)
            make.width.equalTo(contentImageView.snp.height).multipliedBy(12.0 / 9.0).offset(-8)
            make.top.equalTo(userNameLabel.snp.bottom).offset(24)
        }
    }
    
    func configureTitleLable() {
        contentView.addSubview(titleLable)
        titleLable.font = UIFont(name: "Helvetica", size: 17)
        titleLable.lineBreakMode = .byCharWrapping
        titleLable.numberOfLines = .zero
        titleLable.snp.makeConstraints { make in
            make.top.equalTo(contentImageView.snp.bottom).offset(12)
            make.leading.equalTo(contentImageView.snp.leading)
            make.trailing.equalTo(contentImageView.snp.trailing)
            make.width.equalToSuperview().offset(-8)
            make.height.equalTo(50)
        }
        titleLable.sizeToFit()
    }
    
    func configureUserNameLabel() {
        contentView.addSubview(userNameLabel)
        userNameLabel.layer.borderWidth = 1.2
        userNameLabel.layer.cornerRadius = 10.0
        userNameLabel.backgroundColor = UIColor(hexString: "#ede7e1").withAlphaComponent(0.3)
        userNameLabel.font = UIFont(name: "Helvetica", size: 20.0)
        userNameLabel.layer.borderColor = UIColor(hexString: "#bae4e5").withAlphaComponent(0.3).cgColor
        userNameLabel.clipsToBounds = true
        userNameLabel.textAlignment = .natural
        
        userNameLabel.adjustsFontSizeToFitWidth = true
        userNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
    }
    
}
