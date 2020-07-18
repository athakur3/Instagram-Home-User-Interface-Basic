//
//  ViewController.swift
//  Instagram Clone
//
//  Created by Akshansh Thakur on 16/07/20.
//  Copyright © 2020 Akshansh Thakur. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var layout: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.sectionHeadersPinToVisibleBounds = true
        return layout
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationController()
        
        collectionView.collectionViewLayout = layout
        
        collectionView.register(HomeCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeCollectionHeaderView.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    @objc func shareIconClicked() {
        print("share clicked")
    }
    
    func setupNavigationController() {
        
        let image: UIImage = UIImage(named: "insta")!.getResizedImageWith(130.0, 40.0)
        let imageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 130.0, height: 40.0))
        imageView.image = image
        self.navigationItem.titleView = imageView
        
        setupTabBarItems()
        
        
    }
    
    func setupTabBarItems() {
        let shareBarButton = UIBarButtonItem()
        
        let shareButton = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 30.0, height: 30.0))
        shareButton.setImage(UIImage(named: "shareIcon")?.getResizedImageWith(26.0, 22.0), for: .normal)
        
        shareButton.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 4.0, bottom: 0.0, right: -4.0)
        shareButton.contentEdgeInsets = UIEdgeInsets(top: 0.0, left: 4.0, bottom: 0.0, right: -4.0)
        
        shareButton.tintColor = .black
        shareBarButton.customView = shareButton
        
        shareButton.addTarget(self, action: #selector(shareIconClicked), for: .touchUpInside)
        
        let igtvBarButton = UIBarButtonItem()
        
        let igtvButton = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 44.0, height: 44.0))
        igtvButton.setImage(UIImage(named: "igtv")?.getResizedImageWith(30.0, 30.0), for: .normal)
        
        igtvButton.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: -8.0)
        igtvButton.contentEdgeInsets = UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: -8.0)
        
        igtvButton.tintColor = .black
        igtvBarButton.customView = igtvButton
        
        navigationItem.rightBarButtonItems = [shareBarButton, igtvBarButton]
        
        let cameraBarButton = UIBarButtonItem()
        
        let cameraButton = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 44.0, height: 44.0))
        cameraButton.setImage(UIImage(named: "cameraIcon")?.getResizedImageWith(30.0, 30.0), for: .normal)
        
        cameraButton.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        cameraButton.contentEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        
        cameraButton.tintColor = .black
        cameraBarButton.customView = cameraButton
        
        navigationItem.leftBarButtonItems = [cameraBarButton]

    }


}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        
        cell.backgroundColor = .lightGray
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.bounds.width, height: 176)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeCollectionHeaderView.identifier, for: indexPath)
        
        reusableView.backgroundColor = UIColor(red: 249.0/255.0, green: 249.0/255.0, blue: 249.0/255.0, alpha: 1.0)
                
        return reusableView
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard let size =  UIImage(named: "vladimir-yelizarov-RlDOPY6rBa0-unsplash")?.size else {return .zero}
        
        let ratio = size.height / size.width
        
        return CGSize(width: view.bounds.width, height: view.bounds.width * ratio + 76.0)
        
    }
    
}

extension UIImage {
    func getResizedImageWith(_ width: CGFloat, _ height: CGFloat) -> UIImage {
        let newSize = CGSize(width: width, height: height)
        let renderer = UIGraphicsImageRenderer(size: newSize)
        let image = renderer.image { _ in
            self.draw(in: CGRect.init(origin: CGPoint.zero, size: newSize))
        }
        return image
    }
}
