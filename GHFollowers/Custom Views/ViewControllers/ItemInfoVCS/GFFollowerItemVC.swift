//
//  GFFollowerItemVC.swift
//  GHFollowers
//
//  Created by Edson Brandon on 05/12/24.
//

import Foundation
import UIKit

class GFFollowerItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.setItemInfoType(itemInfoType: .followers, with: user.followers)
        itemInfoViewTwo.setItemInfoType(itemInfoType: .following, with: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get followers")
    }
}
