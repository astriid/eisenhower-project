//
//  ProfilePictureViewCell.swift
//  Eisenhower
//
//  Created by Serge Heitzler on 02/04/2018.
//  Copyright © 2018 Serge Heitzler. All rights reserved.
//

import UIKit
import Kingfisher

class ProfilePictureViewCell: UICollectionViewCell {

    @IBOutlet weak var profilePicture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with user: User) {
        
//        self.profilePicture.kf.setImage(with: )
        
    }
    
}
