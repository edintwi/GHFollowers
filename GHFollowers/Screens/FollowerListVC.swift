//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by Edson Brandon on 28/11/24.
//

import UIKit

class FollowerListVC: UIViewController {

    var username: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true

    }

}
