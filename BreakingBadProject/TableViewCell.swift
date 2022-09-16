//
//  TableViewCell.swift
//  BreakingBadProject
//
//  Created by Kevin Tarr on 9/16/22.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet var cellImage: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    
    @IBOutlet var name: UILabel!
    @IBOutlet var nickname: UILabel!
    
    var data : ModelData? {
        didSet {
            guard let data = data else {
                return
            }
            name.numberOfLines = 0
            nickname.numberOfLines = 0
            
            name.text = data.name
            nickname.text = data.nickname
            
            if let url = URL(string: data.img) {
                activityIndicator.startAnimating()
                cellImage.load(url:  url) {[weak self] in
                    
                    self?.activityIndicator.stopAnimating()
                }
                
            }
            
        }
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        name.text = ""
        nickname.text = ""
    }
    
    
    
}
