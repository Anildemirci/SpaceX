//
//  ViewController.swift
//  SpaceX
//
//  Created by Anıl Demirci on 5.07.2022.
//

import UIKit
import Kingfisher

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    private var dataListModel : DataListViewModel!
    private var selectedName=""
    private var selectedYear=""
    private var selectedImage=""
    private var button = UIButton()
    private var filters = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource=self
        tableView.delegate=self
        
        navigationItem.title="Space X"
        
        
         button.setImage(UIImage(systemName: "line.3.horizontal.decrease.circle"), for: .normal)
         button.addTarget(self, action: #selector(self.filterButton), for: .touchUpInside)
         button.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
         let barButton = UIBarButtonItem(customView: button)
         self.navigationItem.rightBarButtonItem = barButton
         
        
        getData()
    }
    
    @objc func filterButton(){
        print("asdasdasd")
        
        let optionClosure={(action : UIAction) in
            self.filters="0"
            self.getData()
        }
        let optionClosure2={(action : UIAction) in
            self.filters="1"
            self.getData()
        }
        button.menu=UIMenu(children: [
            UIAction(title: "Artan", image: UIImage(systemName: "arrow.up"), handler: optionClosure),
            UIAction(title: "Azalan", image: UIImage(systemName: "arrow.down"), handler: optionClosure2),
        ])
        button.showsMenuAsPrimaryAction=true
        //button.changesSelectionAsPrimaryAction=true
    }

    func getData(){
        
        let url = URL(string: "https://api.spacexdata.com/v2/launches")!
        WebService().downloadCurrencies(filter:filters, url: url) { (datas) in
            if let datas=datas {
                self.dataListModel=DataListViewModel(dataList: datas)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataListModel == nil ? 0 : self.dataListModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "launchCell", for: indexPath) as! LaunchTableViewCell
        let dataViewModel=self.dataListModel.dataAtIndex(indexPath.row)
        cell.missionPatchImage.kf.setImage(with: URL(string: dataViewModel.image))
        cell.missionName.text=dataViewModel.missionName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let dataViewModel=self.dataListModel.dataAtIndex(indexPath.row)
        selectedName=dataViewModel.missionName
        selectedYear=dataViewModel.launchYear
        selectedImage=dataViewModel.image
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="toDetailsVC" {
            let destinationVC=segue.destination as! DetailsViewController
            destinationVC.chosenName=selectedName
            destinationVC.chosenYear=selectedYear
            destinationVC.chosenImage=selectedImage
        }
    }
   
}

