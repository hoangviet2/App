//
//  ViewController.swift
//  AppRunWeb
//
//  Created by Hoang Viet on 6/6/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    var History:Array<String> = Array<String>()
    var index:Int = 0
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnReload: UIButton!
    @IBOutlet weak var btnFind: UIButton!
    
    @IBOutlet weak var txtHttp: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btn_Find(_ sender: Any) {
        print("btnFind")
        if let url = URL(string: txtHttp.text!){
            if var link = txtHttp.text{
                if link.hasPrefix("http://WWW.") || link.hasPrefix("https://WWW.") || link.hasSuffix(".com"){
                    let req = URLRequest(url: url)
                    History.append(link)
                    print(url)
                    webView.load(req)
                }
                else{
                    link = "https://\(link).com"
                    if let url2 = URL(string: link){
                        History.append(link)
                        print(url2)
                        let req = URLRequest(url: url2)
                        webView.load(req)
                        index = History.count - 1
                    }
                    
                }
            }

        }
        else{
            if let alert:UIAlertController = UIAlertController(title: "Erro", message: "Wrong link", preferredStyle: .alert){
                let btnOK:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(btnOK)
                present(alert, animated: true,completion: nil)
            }
        }
    }
    
    @IBAction func btn_Back(_ sender: Any) {
        if History.count > 0{
            index = index - 1
            if index < 0{
                index = 0
            }
            if let urlH:URL = URL(string: History[index]){
                if var req:URLRequest = URLRequest(url: urlH){
                    webView.load(req)
                }
            }
        }
    }

    @IBAction func btn_Next(_ sender: Any) {
        if History.count > 0{
            index = index + 1
            if index > History.count - 1{
                index = History.count - 1
            }
            if let urlN:URL = URL(string: History[index]){
                if var req:URLRequest = URLRequest(url: urlN){
                    webView.load(req)
                }
            }
        }
    }
    
    @IBAction func btn_Reload(_ sender: Any) {
        webView.reload()
    }
}
    

