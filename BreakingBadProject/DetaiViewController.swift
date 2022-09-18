//
//  DetaiViewController.swift
//  BreakingBadProject
//
//  Created by Kevin Tarr on 9/16/22.
//

import Foundation


import Foundation
import UIKit

class DetailViewController : UIViewController{
    
    @IBOutlet var detailImageView: UIImageView!
    
    var label = UILabel()
    var subView : UIView?
    
    override func viewDidLoad() {
        
        self.title = "Detail ViewController"
        
        //Check to see if image Data is valid if it's valid then load the image data if not then try again
        if let imageData = ViewController.imageData{
            Task{
              await  detailImageView.load(url: imageData) {}
            }
        }
            else{
                label.text = "Try Again"
                label.frame.size.width = 200
                label.frame.size.height = 200
                label.layer.position.y = self.view.frame.height / 2
                label.layer.position.x = self.view.frame.width / 2
                label.textAlignment = .center
                label.font = label.font.withSize(30)
                self.view.addSubview(label)
            }
        
    }
    
    
    
}
