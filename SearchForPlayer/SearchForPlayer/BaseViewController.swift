//
//  BaseViewController.swift
//  SearchForPlayer
//
//  Created by Hoang Viet on 8/6/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var superTableView : UITableView?
    var superCollectionView : UICollectionView?
    
    override var prefersStatusBarHidden: Bool {
        return false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        setNeedsStatusBarAppearanceUpdate()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        checkInternet()
    }
    @IBAction func btn_Back(_ sender: Any) {
        print("btn_Back")
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btn_Exit(_ sender: Any) {
        print("btn_Exit")
        if AppDelegate.share().logout() {
            print("logout ok")
        }
    }
    
    func checkInternet(){
        guard Connectivity.isConnectedToInternet() else {
            self.showMessageWithTitle(title: "Kết Nối Internet",
                                      message: "Vui lòng kiểm tra kết nối Internet và thử lại",
                                      ok: "Đồng Ý") {
                                        print("Vui lòng kiểm tra kết nối Internet và thử lại")
            }
            return
        }
    }
    //MARK: Alert showing
    func showMessage(_ string: String, errorCode: Int) {
        if errorCode != noInternetConnectionCode{
            Utils.showAlertMessageTravelr(message: string) { (alert) in
                self.present(alert, animated: true, completion: {
                    
                })
            }
        }
        
    }
    func showMessage(_ string: String) {
        Utils.showAlertMessageTravelr(message: string) { (alert) in
            self.present(alert, animated: true, completion: {
                
            })
        }
    }
    func showMessage(title: String, message : String, ok : String, cancel: String , onDismiss: (() -> Void)?){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: ok, style: .default) {
            (action: UIAlertAction) in
            onDismiss?()
        }
        let cancelButton = UIAlertAction(title: cancel, style: .cancel) {
            (action: UIAlertAction) in
        }
        alertController.addAction(okButton)
        alertController.addAction(cancelButton)
        self.present(alertController, animated: true, completion: nil)
    }
    func showMessageWithTitleOkCancel(title: String, message : String, ok : String, cancel: String , onDismiss: (() -> Void)?){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: cancel, style: .default) {
            (action: UIAlertAction) in
        }
        alertController.addAction(cancelButton)
        let okButton = UIAlertAction(title: ok, style: .default) {
            (action: UIAlertAction) in
            onDismiss?()
        }
        alertController.addAction(okButton)
        self.present(alertController, animated: true, completion: nil)
    }
    func showMessageWithTitle(title: String, message : String, ok : String , onDismiss: (() -> Void)?){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: ok, style: .default) {
            (action: UIAlertAction) in
            onDismiss?()
        }
        alertController.addAction(okButton)
        self.present(alertController, animated: true, completion: nil)
    }

}
