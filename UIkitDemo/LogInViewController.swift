//
//  LogInViewController.swift
//  UIkitDemo
//
//  Created by Willy Hsu on 2025/1/2.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logInBtn(_ sender: Any) {
        let username = usernameTF.text
        let password = passwordTF.text
        if username == "willy" {
            if password == "123456" {
                print("ok")
                goNextPage()
            } else {
                print("error")
                showAlert(title: "錯誤", message: "密碼錯誤")
            }
        } else {
            showAlert(title: "錯誤", message: "用戶名不存在")
        }
    }
    
    func goNextPage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(identifier: "ViewController")
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "確認", style: .default, handler: nil))
        self.present(alert, animated: true)
        
    }
 
}
