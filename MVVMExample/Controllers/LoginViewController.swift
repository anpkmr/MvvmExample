//
//  LoginViewController.swift
//  MVVMExample
//
//  Created by anoop on 9/13/18.
//  Copyright © 2018 anoop. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var textFieldUserName:UITextField!
    @IBOutlet weak var textFieldPassword:UITextField!
    @IBOutlet weak var errorLabel:UILabel!
    @IBOutlet weak var loader:UIActivityIndicatorView!

    private lazy var userViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleLoader(isHidden: true)
        textFieldUserName.text = "swiftUser"
        textFieldPassword.text = "swiftPassword"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        textFieldPassword.text = nil
//        textFieldUserName.text = nil
    }
    @IBAction func buttonLoginTapped(_ sender:UIButton){
        signInUser()
    }
    
    //MARK:- Methods
    /// check for validation and validation is passed request server for credential validation
    func signInUser(){
        errorLabel.text = nil
        userViewModel.username = textFieldUserName.text!
        userViewModel.password = textFieldPassword.text!
        switch self.userViewModel.validate() {
        case .Valid:
            handleLoader(isHidden: false)
            userViewModel.loginRequest({ (response, error) in
                self.handleLoader(isHidden: true)
                guard error == nil else {
                    self.errorLabel.text = error?.localizedDescription
                    return
                }
                self.performSegue(withIdentifier: "listViewSegue", sender: nil)
            })
            break
        case .Invalid(let errmessage):
            self.errorLabel.text = errmessage
            break
        }
    }
    func handleLoader(isHidden:Bool){
        self.loader.isHidden = isHidden
        if isHidden == true {
            
        } else {
            self.loader.startAnimating()
        }
       
    }
}
