//
//  AboutUsTableViewController.swift
//  Photonicia
//
//  Created by Asheesh Verma on 21/05/17.
//  Copyright © 2017 Asheesh Verma. All rights reserved.
//

import UIKit

var name = [String]()
class AboutUsTableViewController: UITableViewController {

//    var arrMyData : NSMutableArray = []
//    var data1:Foundation.Data!
//    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //var name = ["ghguhtjvykuilo;piuytrewqsdsfgthgyjhukijlok;ploiuytrewertyuihojpkloiuhygtfrertyuiojojuytre"]
//
//        let urlpath = "http://www.zataksoftech.info/fotonicia/mobileapi/page/getPage"
//        // print(urlpath)
//        let myurl=URL(string:urlpath)
//        //print(myurl)
//        data1 = try? Foundation.Data(contentsOf: myurl!)
//        do
//        {
//            let dict = try JSONSerialization.jsonObject(with: data1, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
//            //print(dict)
//            arrMyData = (dict["data"]as? NSMutableArray)!
//            print(arrMyData)
//            
//        }
//        catch
//        {}
//
//        
    
        
        about()
        
        
        
        self.navigationItem.title = "ABOUT US"
        
        
        
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.barTintColor = UIColor.cyan
        let navBarImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        //You can change the text color
        navigationController?.navigationBar.tintColor = UIColor.black
       
        
        self.showLeftBarButtonItemWithImage()
    
        
//       
//        navBarImageView.contentMode = .scaleAspectFit
//        let navBarImage = UIImage(named: "myNavBarLogo.png")
//        navBarImageView.image = navBarImage
//        navigationItem.titleView = navBarImageView
//        
//        //You can change the font
//        if let font = UIFont(name: "AppleSDGothicNeo-Thin", size: 34) {
//            UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: font]
//        }
        
        
//        neraida.navigation.background.color.hexColor("54ad00", isTranslucent: false, viewController: self)
//        
//        //Change navigation title, backbutton colour
//        
//        neraida.navigation.foreground.color.uiColor(UIColor.white, viewController: self)
//        
//        //Change navigation back button title programmatically
//        
//        neraida.navigation.foreground.backButtonTitle("Custom Title", ViewController: self)
//        
//        //Apply Background Image to the UINavigationBar
//        
//        neraida.navigation.background.image("background", edge: (0,0,0,0), barMetrics: .default, isTranslucent: false, viewController: self)
//        
        
         //navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.orange]
         //tabBarController?.tabBar.barTintColor = UIColor.cyan
        // navigationController?.navigationBar.barTintColor = UIColor.cyan

      
        
        // Configure countryTable
        self.tableView.tableFooterView = UIView()
        
        self.tableView.register(UINib(nibName: "AboutUsTableViewCell", bundle: nil), forCellReuseIdentifier: "AboutUsTableViewCell")
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 216.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnBackAction(_ sender: UIBarButtonItem) {
        
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutUsTableViewCell") as! AboutUsTableViewCell
        
        cell.lblDetails.text = name[indexPath.row] 
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerText = UILabel()
//        headerText.backgroundColor = UIColor.white
//        headerText.textColor = UIColor(red: 74/255, green: 75/255, blue: 71/255, alpha: 1)
//        headerText.adjustsFontSizeToFitWidth = true
//        headerText.textAlignment = .center
//        headerText.text = "Hot Searches"
//        
//        return headerText
//    }
//    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 216.0
    }
}

func about() {
    
    let dicParams:[String : Any] = ["identifier" : "about-magento-demo-store"]
    
    print("Dic parameters: \(dicParams)")
    name.append(" About Magento Store\n\n\nLorem ipsum dolor sit amet, consectetuer adipiscing elit.\nMorbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec,\ntempus vitae, iaculis semper, pede.\nLorem ipsum dolor sit amet, consectetuer adipiscing elit.\nMorbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis,\nporta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta.\n\nLorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus.\nDuis lobortis. Nulla nec velit.\nVivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper.\nPhasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada\nfames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac,\ntempus nec, tempor nec, justo. \nMaecenas ullamcorper, odio vel tempus egestas, dui orci faucibus orci, sit amet aliquet lectus dolor et quam.\nPellentesque consequat luctus purus. Nunc et risus. Etiam a nibh. Phasellus dignissim metus eget nisi.\nVestibulum sapien dolor, aliquet nec, porta ac, malesuada a, libero. Praesent feugiat purus eget est.\nNulla facilisi. Vestibulum tincidunt sapien eu velit. Mauris purus. Maecenas eget mauris eu orci accumsan feugiat.\nPellentesque eget velit. Nunc tincidunt.\n\nLorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit.\nMauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede.\nCras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in,\nfaucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper \nMaecenas ullamcorper, odio vel tempus egestas, dui orci faucibus orci,\nsit amet aliquet lectus dolor et quam. Pellentesque consequat luctus purus.\nNunc et risus. Etiam a nibh. Phasellus dignissim metus eget nisi. ")

    
    RequestManager().getPage(parameters: dicParams, loader: true) { (status, responseModel, error) in
        
        print(responseModel as Any)
        if status {
            
            
               }
    }
}
extension AboutUsTableViewController : SlideMenuControllerDelegate {
    
    func leftWillOpen() {
        print("SlideMenuControllerDelegate: leftWillOpen")
    }
    
    func leftDidOpen() {
        print("SlideMenuControllerDelegate: leftDidOpen")
    }
    
    func leftWillClose() {
        print("SlideMenuControllerDelegate: leftWillClose")
    }
    
    func leftDidClose() {
        print("SlideMenuControllerDelegate: leftDidClose")
    }
    
    func rightWillOpen() {
        print("SlideMenuControllerDelegate: rightWillOpen")
    }
    
    func rightDidOpen() {
        print("SlideMenuControllerDelegate: rightDidOpen")
    }
    
    func rightWillClose() {
        print("SlideMenuControllerDelegate: rightWillClose")
    }
    
    func rightDidClose() {
        print("SlideMenuControllerDelegate: rightDidClose")
    }
}
