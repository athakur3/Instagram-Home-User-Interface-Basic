//
//  HomeCollectionHeaderView.swift
//  Instagram Clone
//
//  Created by Akshansh Thakur on 18/07/20.
//  Copyright © 2020 Akshansh Thakur. All rights reserved.
//

/*
 
 
 ---------------------------------    ---
 | Stories            Watch All  |     |   Height -> 25 %
 |-------------------------------|    ---
 |                               |     |
 |        CollectionView         |     |   Height -> 75 %
 |                               |     |
 ---------------------------------    ---
 
 
 
 */

import UIKit

class HomeCollectionHeaderView: UICollectionReusableView {
    
    static let identifier = "HomeCollectionHeaderView"
    
    var images: [(String, String)] = [
        ("adult-attractive-beautiful-beauty-415829", "Your Story"),
        ("face-facial-hair-fine-looking-guy-614810", "Ronaldo"),
        ("man-sitting-near-purple-wall-2232981", "maestroy"),
        ("photo-of-girl-wearing-brown-shirt-2104252", "banzema"),
        ("woman-wearing-orange-sweater-2613260", "athena")
    ]
    
    var storiesLabel: UILabel = {
        let label = UILabel()
        label.text = "Stories"
        label.textAlignment = .left
        label.textColor = UIColor(red: 41.0/255.0, green: 41.0/255.0, blue: 41.0/255.0, alpha: 1.0)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 17.0)
        return label
    }()
    
    var watchAllLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.text = "Watch All"
        label.textColor = UIColor(red: 41.0/255.0, green: 41.0/255.0, blue: 41.0/255.0, alpha: 1.0)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 17.0)
        return label
    }()
    
    var horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: horizontalLayout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    var horizontalLayout: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }
    
    var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    func setupViews() {
        
        horizontalStack.addArrangedSubview(storiesLabel)
        horizontalStack.addArrangedSubview(watchAllLabel)
        
        verticalStack.addArrangedSubview(horizontalStack)
        verticalStack.addArrangedSubview(collectionView)
        
        addSubview(verticalStack)
        
        leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: verticalStack.trailingAnchor).isActive = true
        
        topAnchor.constraint(equalTo: verticalStack.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: verticalStack.bottomAnchor).isActive = true
        
        horizontalStack.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25).isActive = true
        
        horizontalStack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0.0, leading: 16.0, bottom: 0.0, trailing: 16.0)
        horizontalStack.isLayoutMarginsRelativeArrangement = true
        
        collectionView.register(StoryCell.self, forCellWithReuseIdentifier: StoryCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
}

extension HomeCollectionHeaderView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCell.identifier, for: indexPath) as! StoryCell
        
        cell.imageView.image = UIImage(named: images[indexPath.row].0)
        cell.imageTitle.text = images[indexPath.row].1
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = collectionView.bounds.height - 12.0
        
        return CGSize(width: height * 0.7, height: height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 24.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 16.0, bottom: 12.0, right: 16.0)
    }
    
    
    
}

class StoryCell: UICollectionViewCell {
    
    static let identifier = "StoryCell"
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
       
        imageView.contentMode = .scaleAspectFill
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var imageTitle: UILabel = {
        let title = UILabel()
        title.text = "My Story"
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = UIColor(red: 83.0/255.0, green: 83.0/255.0, blue: 83.0/255.0, alpha: 1.0)
        title.font = UIFont(name: "HelveticaNeue-Medium", size: 15.0)
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let imageViewHeight = contentView.bounds.height * 0.65
        
        contentView.addSubview(imageView)
        contentView.addSubview(imageTitle)
        
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4.0).isActive = true
        
        imageView.heightAnchor.constraint(equalToConstant: imageViewHeight).isActive = true
        
        imageView.widthAnchor.constraint(equalToConstant: imageViewHeight).isActive = true
        
        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        imageTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8.0).isActive = true
        
        imageTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        imageTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        imageTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        imageView.layer.cornerRadius = imageViewHeight / 2.0
        imageView.layer.masksToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
