//
//  CuriesViewController.swift
//  DataPassUsingProtocolasChildToParentVc
//
//  Created by Akash Belekar on 28/03/23.
//

import UIKit
import Alamofire
import ObjectMapper

protocol updateCuriesDataDelegate{
    func dataUpdated(objData:CurriesResponse,index:Int)
}

class CuriesViewController: UIViewController {
    
    @IBOutlet weak var curiesTbl:UITableView!
    
    var curiesModel:LinkResponse?
    var delegate:updateCuriesDataDelegate?
    var curiesVC = CuriesDetailsViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        curiesVC = CuriesDetailsViewController.init()
        
        curiesTbl.register(UINib(nibName: "CuriesTVC", bundle: nil), forCellReuseIdentifier: "CuriesTVC")
        curiesTbl.dataSource = self
        curiesTbl.delegate = self
        curiesGetApi()

    }
    private func curiesGetApi(){
        let url = "https://api.teleport.org/api/urban_areas/teleport%3A9q8yy/scores/"
        Alamofire.request(url).responseJSON { response in
            print("respnse",response)
            
            switch response.result{
            case .success(_):
                if let result = response.result.value{
                    print("result",result)
                    
                    let JSON = result as! NSDictionary
                    print("JSON",JSON)
                    
                    let str = String(data: response.data!, encoding: String.Encoding.utf8)!
                    print("str",str)
                    
                    let objData = Mapper<CuriesDataResponse>().map(JSONString: str)
                    print("objData",objData?.toJSON())
                    
                    self.curiesModel = objData?.link
                    
                    DispatchQueue.main.async {
                        self.curiesTbl.reloadData()
                    }
                }
            case .failure(let error):
                print( error.localizedDescription)
            }
        }
    }
}
extension CuriesViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return curiesModel?.curies?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CuriesTVC", for: indexPath) as! CuriesTVC
        cell.selectionStyle = .none
        cell.herlLbl.textColor = .blue
        cell.herlLbl.text = curiesModel?.curies![indexPath.row].hrel ?? ""
        cell.nameLbl.text = curiesModel?.curies![indexPath.row].name ?? ""
        if curiesModel?.curies![indexPath.row].isSelected == true{
            cell.backgroundColor = .green
            
        }else{
            cell.backgroundColor = .white
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.dataUpdated(objData: (curiesModel?.curies![indexPath.row])!, index: indexPath.row)
        
    }
  
}
