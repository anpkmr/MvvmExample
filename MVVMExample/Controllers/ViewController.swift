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
    
    var movieFetchViewModel = MovieDataFetchViewModel()
    
    var companyNameArry = [MovieViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //creating an array of CompnayViewModel
//       companyNameArry = [MovieViewModel(company:Movie(name:"Apple")),MovieViewModel(company:Company(name:"Microsoft")),MovieViewModel(company:Company(name:"Google")),MovieViewModel(company:Company(name:"Amazon")),MovieViewModel(company:Company(name:"Netflix")),MovieViewModel(company:Company(name:"Tesla")),MovieViewModel(company:Company(name:"Samsung")), MovieViewModel(company:Company(name:"YouTube")),MovieViewModel(company:Company(name:"Stripe")),MovieViewModel(company:Company(name:"Uber"))]
        movieFetchViewModel.fetchMovies { (moviesArray) in
            self.companyNameArry = moviesArray.map({ return MovieViewModel(company: $0)})
            self.todoTableView.reloadData()
        }
        
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

