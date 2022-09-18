//
//  TableViewCell.swift
//  BreakingBadProject
//
//  Created by Kevin Tarr on 9/16/22.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    
    //Outlets for tableviewCell elements based off of JSON Data
    @IBOutlet var cellImage: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var name: UILabel!
    @IBOutlet var nickname: UILabel!
    
    
    //Check to see if Model Data is valid
    var data : ModelData? {
        didSet {
            //if ModelData is nil exit function at return line 25
            guard let data = data else {
                return
            }
            //Continue function if ModelData is not nil
            
            //if ModelData is not nil set labelText to be able to indent long names by having 0 number of lines
            name.numberOfLines = 0
            nickname.numberOfLines = 0
            
            //Set name and nickname text labels to be based off JSON data
            name.text = data.name
            nickname.text = data.nickname
            
            //Check to see if URL is valid before animating the activity indicator
            if let url = URL(string: data.img) {
                activityIndicator.startAnimating()
                Task{
                   await cellImage.load(url:  url) {[weak self] in
                        
                        self?.activityIndicator.stopAnimating()
                    }
                }
            }
        }
    }
    
    //Prepare cells for reuse after dequeing them
    override func prepareForReuse() {
        super.prepareForReuse()
        name.text = ""
        nickname.text = ""
        cellImage.image = nil
    }
}
