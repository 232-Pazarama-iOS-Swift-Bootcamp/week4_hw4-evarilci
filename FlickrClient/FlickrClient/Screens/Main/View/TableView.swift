//
//  TableView.swift
//  FlickrClient
//
//  Created by Eymen Varilci on 12.10.2022.
//

import UIKit
import SnapKit

final class mainTableView: UIView {

   private lazy var tableView = UITableView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTableViewConstraints()
        tableView.register(ContentCell.self, forCellReuseIdentifier: "contentCell")
        tableView.rowHeight = 600
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTableViewDelegates(delegate Delegate: UITableViewDelegate, datasource DataSource: UITableViewDataSource) {
        
        tableView.delegate = Delegate
        tableView.dataSource = DataSource
    }
    
    func setTableViewConstraints() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
}
