//
//  HomeCollectionViewCell.swift
//  Instagram Clone
//
//  Created by Akshansh Thakur on 18/07/20.
//  Copyright © 2020 Akshansh Thakur. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HomeCollectionViewCell"
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    
    @IBOutlet weak var contentImage: UIImageView!
    
}
