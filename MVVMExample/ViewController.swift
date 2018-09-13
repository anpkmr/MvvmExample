//
//  ViewController.swift
//  MVVMExample
//
//  Created by anoop on 9/13/18.
//  Copyright © 2018 anoop. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    @IBOutlet weak var todoTableView:UITableView!
    @IBOutlet weak var textFieldItem:UITextField!
    
    var companyNameArry = [CompanyViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //creating an array of CompnayViewModel
       companyNameArry = [CompanyViewModel(company:Company(name:"Apple")),CompanyViewModel(company:Company(name:"Microsoft")),CompanyViewModel(company:Company(name:"Google")),CompanyViewModel(company:Company(name:"Amazon")),CompanyViewModel(company:Company(name:"Netflix")),CompanyViewModel(company:Company(name:"Tesla")),CompanyViewModel(company:Company(name:"Samsung")), CompanyViewModel(company:Company(name:"YouTube")),CompanyViewModel(company:Company(name:"Stripe")),CompanyViewModel(company:Company(name:"Uber"))]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOutTapped(_ sender:UIButton){
      dismiss(animated: true, completion: nil)
    }

    
    //MARK:- Data_Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companyNameArry.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CompanyCell
        cell.companyVM = companyNameArry[indexPath.row]
        return cell
        
    }
}

