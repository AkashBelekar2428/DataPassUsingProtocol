//
//  NewsPaperTVC.swift
//  DataPassUsingProtocolasChildToParentVc
//
//  Created by Akash Belekar on 28/03/23.
//

import UIKit

class NewsPaperTVC: UITableViewCell {
 
    @IBOutlet weak var nameLbl:UILabel!
    @IBOutlet weak var img:UIImageView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
