//
//  ViewController.swift
//  FotoniciaAPP
//
//  Created by Rajni on 24/05/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    var status:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let status = self.status {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)

            if status == "1" {
                if let navLogin = storyboard.instantiateViewController(withIdentifier: "LoginNavigationViewController") as? UINavigationController {
                    self.present(navLogin, animated: true, completion: {
                    })
                    self.status = nil
                }
            }else if status == "2" {
                if let navLogin = storyboard.instantiateViewController(withIdentifier: "SignupNavigationViewController") as? UINavigationController {
                    self.present(navLogin, animated: true, completion: {
                    })
                    self.status = nil
                }
            }
            else if status == "3" {
                if let navAddress = storyboard.instantiateViewController(withIdentifier: "SignupNavigationViewController") as? UINavigationController {
                    self.present(navAddress, animated: true, completion: {
                    })
                    self.status = nil
                }
            }

        }
    }

//    func changeLoginLogOutNotification(notification: NSNotification){
//        //Take Action on Notification
//        if self.btnLogin.title(for: .normal) == "Login"{
//            self.btnLogin.setTitle("Logout", for: .normal)
//        }else{
//            self.btnLogin.setTitle("Login", for: .normal)
//        }
//        
//    }
//    
//    func checkForFirstTimeUser() {
//        var isRegularUser:Bool = UserDefaults.standard.bool(forKey: "isRegularUser")
//        
//        if isRegularUser != false {
//            isRegularUser = true
//            UserDefaults.standard.set(true, forKey: "isRegularUser")
//            self.perform(#selector(ViewController.presentHomeView), with: nil, afterDelay: 0.5)
//        }
//        else {
//            //self.performSelector(#selector(SplashViewController.presentHomeView), withObject: nil, afterDelay: 0.5)
//        }
//    }

    
//    func presentAppWalkthrough() {
//        let appWalkThroughStoryBoard = UIStoryboard.init(name: "Login&Signup", bundle: nil)
//        let appWalkThroughNavController = appWalkThroughStoryBoard.instantiateViewControllerWithIdentifier("LoginAndSignupNavigationController") as! LoginAndSignupNavigationController
//        self.presentViewController(appWalkThroughNavController, animated: true, completion: nil)
//    }
    
//    func presentHomeView() {
//        let homeStoryBoard = UIStoryboard.init(name: "HomeView", bundle: nil)
//        let homeViewNavigationController = homeStoryBoard.instantiateViewController(withIdentifier: "HomeViewNavigationController") as! HomeViewNavigationController
//        self.present(homeViewNavigationController, animated: true, completion: nil)
//    }
//    
//
//    @IBAction func btnLoginAction(_ sender: Any)
//    {
//        
//        
//        
//        if self.btnLogin.title(for: .normal) == "Login"{
//            self.presentSigninSignupView()
//        }else{
//            self.alert("Logged out succesfully", title: "")
//            self.btnLogin.setTitle("Login", for: .normal)
//        }
//
//        
//        
//        func presentSigninSignupView() {
//            
//            let storyboard = UIStoryboard(name: Constants.StoryboardsName.HomeStoryboardName, bundle: nil)
//            let homeViewController = storyboard.instantiateViewController(withIdentifier: Constants.ViewControllerIdentifiers.HomeViewControllerIdentifier) as? HomeViewController
//            self.sideMenuController()?.setContentViewController(homeViewController!)
//            NotificationCenter.defaultCenter.postNotificationName(NSNotification.Name(rawValue: "SideMenuNotificationIdentifier"), object: nil)
    //    }

        
////        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "Conversation_VC") as! Conversation_VC
////        self.navigationController?.pushViewController(secondViewController, animated: true)
////        
//        let signUpVC = UIStoryboard(name: "Login&Signup", bundle: nil).instantiateViewController(withIdentifier: "login")
//         self.present(signUpVC, animated: false, completion: nil)
//        self.navigationController?.pushViewController(signUpVC, animated: true)
//        
////        let storyBoard : UIStoryboard = UIStoryboard(name: "Login&Signup", bundle:nil)
////        
////        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "login") as! LoginViewController
////        self.present(nextViewController, animated:true, completion:nil)
   // }

    @IBAction func btnSignupAction(_ sender: Any)
    {
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Login&Signup", bundle:nil)
//        
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "signup") as! SignupViewController
//        self.present(nextViewController, animated:true, completion:nil)

    }
    @IBAction func btnSkipAction(_ sender: Any) {
       self.setRootMenuView()
   }
}
