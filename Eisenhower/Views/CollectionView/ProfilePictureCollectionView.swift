//
//  ProfilePictureCollectionView.swift
//  Eisenhower
//
//  Created by Serge Heitzler on 02/04/2018.
//  Copyright © 2018 Serge Heitzler. All rights reserved.
//

import UIKit

class ProfilePictureCollectionView: UICollectionView {

    var users = [User]() {
        didSet {
            self.reloadData()
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension ProfilePictureCollectionView: UICollectionViewDelegate {}

extension ProfilePictureCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: profilePictureCellReuseIdentifier, for: indexPath) as! ProfilePictureViewCell
        
        cell.configure(with: users[indexPath.row])
        
        return cell
        
    }
}
