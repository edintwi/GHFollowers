//
//  GFRepoItemVC.swift
//  GHFollowers
//
//  Created by Edson Brandon on 05/12/24.
//

import Foundation
import UIKit

class GFRepoItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.setItemInfoType(itemInfoType: .repos, with: user.publicRepos)
        itemInfoViewTwo.setItemInfoType(itemInfoType: .gists, with: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "Github Profile")
    }
    
    override func actionButtonTappeed() {
        delegate?.didTapGithubProfile(for: user)
    }
}
