//
//  NumberOfPhotoViewController.swift
//  FotoniciaAPP
//
//  Created by shadman Alam on 23/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

class NumberOfPhotoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

        var number = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20"]
    override func viewDidLoad() {
        super.viewDidLoad()
        let a = NumberOfPhotoViewController()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismiss(_ sender: Any) {
        
        
        self.dismiss(animated: true, completion: nil)
     
        
        
        
        
    }
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return number.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = self.number[indexPath.row]
        cell.textLabel?.textAlignment = .center
        
    
        return cell
    
    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
