//
//  NewspapersViewController.swift
//  DataPassUsingProtocolasChildToParentVc
//
//  Created by Akash Belekar on 28/03/23.
//

import UIKit
import ObjectMapper
import Alamofire
import SDWebImage

protocol updateDataDelegate{
    func newDataInsert(ObjData:UserResponse,index:Int)
}

class NewspapersViewController: UIViewController {
    @IBOutlet weak var newspaperTbl:UITableView!

    var newspaperModel:[UserResponse] = []
    var delegate:updateDataDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        newspaperTbl.register(UINib(nibName: "NewsPaperTVC", bundle: nil), forCellReuseIdentifier: "NewsPaperTVC")
        newspaperTbl.dataSource = self
        newspaperTbl.delegate = self
        getNewspaperApi()
    }
    private func getNewspaperApi(){
        let url = "https://dummyjson.com/users"
        Alamofire.request(url).responseJSON { response in
            print("response",response)
            
            switch response.result{
            case .success(_):
                if let result = response.result.value{
                    print("result",result)
                    
                    let JSON = result as! NSDictionary
                    print("JSON",JSON)
                    
                    let str = String(data: response.data!, encoding: String.Encoding.utf8)!
                    print("str",str)
                    
                    let objData = Mapper<NewsPaperDataResponse>().map(JSONString: str)
                    
                    print("objData",objData?.toJSON())
                    
                    self.newspaperModel = (objData?.user)!
                    DispatchQueue.main.async {
                        self.newspaperTbl.reloadData()
                    }
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
    
}
extension NewspapersViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newspaperModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsPaperTVC", for: indexPath) as! NewsPaperTVC
        cell.selectionStyle = .none
        cell.nameLbl.text = newspaperModel[indexPath.row].userName ?? ""
        cell.img.sd_setImage(with: URL(string: "\(newspaperModel[indexPath.row].image ?? "")"), placeholderImage: UIImage(systemName: "homekit"))
        if newspaperModel[indexPath.row].isSelected == true{
            cell.backgroundColor = .green
            
        }else{
            cell.backgroundColor = .white
            newspaperModel[indexPath.row].isSelected = false
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.newDataInsert(ObjData: newspaperModel[indexPath.row], index: indexPath.row)
    }
    
}
