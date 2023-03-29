//
//  NewsPaperDetailsViewController.swift
//  DataPassUsingProtocolasChildToParentVc
//
//  Created by Akash Belekar on 28/03/23.
//

import UIKit
protocol changeBackgroundcolorDelegate{
    func backgroundChange()
}

class NewsPaperDetailsViewController: UIViewController {
    @IBOutlet weak var imgView:UIImageView!
    @IBOutlet weak var nameLbl:UILabel!
    
    var obj = UserResponse.init()
    var delegte:changeBackgroundcolorDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.sd_setImage(with: URL(string: obj.image ?? ""), placeholderImage: UIImage(systemName: "homekit"))
        nameLbl.text = obj.userName

    }
    @IBAction func back(){
        dismiss(animated: true)
    }
    
    @IBAction func marksBtnClicked(){
        delegte?.backgroundChange()
        dismiss(animated: true)
    }

}
