//
//  AppDelegate.swift
//  SearchForPlayer
//
//  Created by Hoang Viet on 7/8/19.
//  Copyright © 2019 Hoang Viet. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import GooglePlacePicker
import CoreLocation
import IQKeyboardManager
import Firebase
import UserNotifications
import FBSDKCoreKit
import FBSDKLoginKit
import FacebookCore
import SloppySwiper
import Kingfisher

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var locationManager:CLLocationManager!
    var myCoordinate:CLLocationCoordinate2D!
    var is_LaunchApp:Bool = true
    
    static func share()->AppDelegate{
        return UIApplication.shared.delegate as! AppDelegate
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        let isProductionMode: Bool = APP_PRODUCTION_MODE
        if isProductionMode {
            let filePath = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist")
            let options = FirebaseOptions.init(contentsOfFile: filePath!)
            FirebaseApp.configure(options: options!)
        }
        else {
            let filePath = Bundle.main.path(forResource: "dev-GoogleService-Info", ofType: "plist")
            let options = FirebaseOptions.init(contentsOfFile: filePath!)
            FirebaseApp.configure(options: options!)
        }
        
        if checkUser() {
            self.setHomePage()
            print("checkUser ok with email: \(Auth.auth().currentUser?.email ?? "")")
        } else {
            self.setWelcomePage()
        }
        setupLocation()
        
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}
extension AppDelegate {
    
    func checkUser() -> Bool {
        if let userInfo = self.getUser() as? UserInfo, let uid = userInfo.uid, uid.count > 0 {
            print("checkUser: \(userInfo)")
            if Auth.auth().currentUser != nil {
                // User is signed in.
                if Auth.auth().currentUser?.isEmailVerified == false {
                    print("sendEmailVerification")
                    self.sendEmailVerification()
                }
                return true
            } else {
                // No user is signed in.
                self.removeUser()
                return false
            }
        }
        return false
    }
    
    func logout() -> Bool {
        do {
            try Auth.auth().signOut()
            self.removeUser()
            setWelcome()
            print("signOut: ok")
            return true
        }
        catch {
            print("signOut: false")
            return false
        }
    }
    
    func setupHomeTabBar() {
        if let vc = Utils.viewController(storyboardId: TabBarController.className, storyboardName: "Main") as? TabBarController{
            let mainNavigation = UINavigationController.init(rootViewController: vc)
            mainNavigation.isNavigationBarHidden = true
            window?.rootViewController = mainNavigation
            //window?.rootViewController = vc
        }
    }
    func setWelcome() {
        if let vc = Utils.viewController(storyboardId: WelcomeViewController.className, storyboardName: "Main") as? WelcomeViewController {
            let mainNavigation = UINavigationController.init(rootViewController: vc)
            mainNavigation.isNavigationBarHidden = true
            window?.rootViewController = mainNavigation
            //window?.rootViewController = vc
        }
    }
    
    func updatePassword(_ password:String,_ complete: @escaping(Bool) -> Void) {
        Auth.auth().currentUser?.updatePassword(to: password) { (error) in
            if error != nil {
                complete(false)
            }
            complete(true)
        }
    }
    
    func sendPasswordReset(_ email: String, _ completion: @escaping(String)->Void) {
        if let email = email as? String, email.count > 0, email.contains("@") {
            Auth.auth().sendPasswordReset(withEmail: email) { error in
                if let error = error {
                    completion(error.localizedDescription)
                }
                completion("")
            }
        }
    }
    
    func sendEmailVerification() {
        if let currentUser = Auth.auth().currentUser, let email = currentUser.email, currentUser.isEmailVerified == false {
            Auth.auth().currentUser?.sendEmailVerification { (error) in
                //Update UserInfo
                guard var userInfo = self.getUser() as? UserInfo else {return}
                userInfo.is_verify_email = true
                self.cacheUser(userInfo)
            }
        }
    }
    
    func createEmailUserByFirebase(email: String, password: String, _ completion: @escaping (_ status: Bool, _ authResult: AuthDataResult?, _ error: Error?) -> Void ) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let currentUser = authResult?.user, error == nil {
                print("\(currentUser.email!) created")
                let userInfo = self.mapUserInfo(firUser: currentUser)
                self.cacheUser(userInfo)
                self.sendEmailVerification()
                completion(true, authResult!, nil)
            } else {
                print("createUser false with error: \(error!.localizedDescription)")
                completion(false, nil, error)
            }
        }
    }
    func loginEmailUserByFirebase(email: String, password: String, _ completion: @escaping (_ status: Bool, _ authResult: AuthDataResult?, _ error: Error?) -> Void ) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let currentUser = authResult?.user, error == nil {
                print("\(currentUser.email!) created")
                let userInfo = self.mapUserInfo(firUser: currentUser)
                self.cacheUser(userInfo)
                if Auth.auth().currentUser?.isEmailVerified == false {
                    self.sendEmailVerification()
                }
                completion(true, authResult!, nil)
            } else {
                print("createUser false with error: \(error!.localizedDescription)")
                completion(false, nil, error)
            }
        }
    }
    func cacheUser(_ user: UserInfo) {
        print("cacheUser: \(user)")
        if let userData = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(userData, forKey: "CurrentUser")
        }
    }
    func getUser() -> (UserInfo) {
        if let userData = UserDefaults.standard.object(forKey: "CurrentUser") as? Data {
            if let user = try? JSONDecoder().decode(UserInfo.self, from: userData) {
                print("getUser: \(user)")
                return user
            }
        }
        return UserInfo()
    }
    
    
    
    func removeUser() {
        print("removeUser")
        UserDefaults.standard.set(nil, forKey: "CurrentUser")
    }
    
    func mapUserInfo(firUser: User) -> (UserInfo) {
        let currentUser = firUser
        var userInfo = UserInfo()
        if let value = currentUser.displayName as? String {
            userInfo.name = value
        }
        if let value = currentUser.uid as? String {
            userInfo.uid = value
        }
        if let value = currentUser.email as? String {
            userInfo.email = value
        }
        if let value = currentUser.isEmailVerified as? Bool {
            userInfo.is_verify_email = value
        }
        return userInfo
    }
    
    func Userprodile() {
        let user = Auth.auth().currentUser
        if let user = user {
            let name = Auth.auth().currentUser?.displayName
            let uid = user.uid
            let email = user.email
            let photoURL = user.photoURL
            print("display name is \(name)")
            print(uid)
            print("Userid is: \(email)")
            print("photourl is: \(photoURL)")
        }
    }
    
    func sendPasswordReset( email: String,  completion: @escaping(String)->Void) {
        if let email = email as? String, email.count > 0, email.contains("@") {
            Auth.auth().sendPasswordReset(withEmail: email) { error in
                if let error = error {
                    completion(error.localizedDescription)
                }
                completion("")
            }
        }
    }
    
    
    func sendEmailVerification() {
        if let currentUser = Auth.auth().currentUser, let email = currentUser.email, currentUser.isEmailVerified == false {
            Auth.auth().currentUser?.sendEmailVerification { (error) in
                //Update UserInfo
                guard var userInfo = self.getUser() as? UserInfo else {return}
                userInfo.is_verify_email = true
                self.cacheUser(userInfo)
            }
        }
    }
    
    
}

extension String {
    var addingPercentEncodingUrl: String {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
    }
}

extension AppDelegate: CLLocationManagerDelegate {
    func setupLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        //locationManager.requestAlwaysAuthorization()
        //locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false
        if CLLocationManager.locationServicesEnabled(){
            self.startUpdatingLocation()
        }
    }
    func startUpdatingLocation() {
        if CLLocationManager.locationServicesEnabled(){
            self.locationManager.startUpdatingLocation()
        }
    }
    func stopUpdatingLocation() {
        self.locationManager.stopUpdatingLocation()
    }
    func startMonitoringSignificantLocationChanges() {
        if CLLocationManager.locationServicesEnabled(){
            self.locationManager.startMonitoringSignificantLocationChanges()
        }
    }
    func stopMonitoringSignificantLocationChanges() {
        self.locationManager.stopMonitoringSignificantLocationChanges()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("locationManager didUpdateLocations")
        let userLocation :CLLocation = locations[0] as CLLocation
        if myCoordinate != nil {
            guard self.myCoordinate.latitude != userLocation.coordinate.latitude
                && self.myCoordinate.longitude != userLocation.coordinate.longitude
                else {return}
        }
        if self.myCoordinate != nil {
            let cgL = CLLocation(latitude: self.myCoordinate.latitude, longitude: self.myCoordinate.longitude)
            guard userLocation.distance(from: cgL) > 50 else { return }
        }
        self.myCoordinate = userLocation.coordinate
        Utils.cacheCurrentLocation(coordinate: userLocation.coordinate)
        print("locationManager didUpdateLocations cacheCurrentLocation: \(userLocation.coordinate.latitude),\(userLocation.coordinate.longitude)")
        if is_LaunchApp {
            print("locationManager stopUpdatingLocation for first launch")
            self.stopUpdatingLocation()
            is_LaunchApp = false
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }
}

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    class var className: String {
        return String(describing: self)
    }
}
