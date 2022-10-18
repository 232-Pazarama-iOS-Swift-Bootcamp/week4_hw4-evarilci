//
//  Extension+ConstraintsMaker.swift
//  FlickrClient
//
//  Created by Eymen Varilci on 18.10.2022.
//

import Foundation
import SnapKit


extension ConstraintMaker {
    public func aspectRatio(_ ratio: CGSize) {
        let view = item as! ConstraintView
        self.width.equalTo(view.snp.height).multipliedBy(ratio.width / ratio.height)
    }
}
