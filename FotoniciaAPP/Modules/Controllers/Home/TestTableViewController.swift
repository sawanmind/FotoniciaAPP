//
//  TestTableViewController.swift
//  FotoniciaAPP
//
//  Created by shadman Alam on 24/06/17.
//  Copyright © 2017 Rajni. All rights reserved.
//

import UIKit

final class TestTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var tableviewRR: UITableView!
    
    static let tableCellID: String = "tableViewCellID_section_#"
    
    let numberOfSections: Int = 20
    let numberOfCollectionsForRow: Int = 1
    let numberOfCollectionItems: Int = 20
    
    var colorsDict: [Int: [UIColor]] = [:]
    
    /// Set true to enable UICollectionViews scroll pagination
    var paginationEnabled: Bool = true
    
    
    @IBAction func freePaid(_ sender: Any) {
        
        
        let alert  = UIAlertController(title: "PRICING", message: "", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Free", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Paid", style: UIAlertActionStyle.default, handler: nil))
        
        let cancelbut = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive, handler: nil)
        let applybut = UIAlertAction(title: "Apply", style: UIAlertActionStyle.default, handler: nil)
//        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))
//        alert.addAction(UIAlertAction(title: "Apply", style: UIAlertActionStyle.destructive, handler: nil))
        
        alert.addAction(applybut)
        alert.addAction(cancelbut)
        
        
        self.present(alert, animated: true, completion: nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableviewRR.delegate = self
        tableviewRR.dataSource = self
         self.navigationItem.title = "SELECT LAYOUT"
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.barTintColor = UIColor.gray
        let navBarImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        navigationController?.navigationBar.tintColor = UIColor.white
        self.showLeftBarButtonItemWithImage()
        
        
        for tableViewSection in 0..<numberOfSections {
            var colorsArray: [UIColor] = []
            
            for _ in 0..<numberOfCollectionItems {
                var randomRed: CGFloat = CGFloat(arc4random_uniform(256))
                let randomGreen: CGFloat = CGFloat(arc4random_uniform(256))
                let randomBlue: CGFloat = CGFloat(arc4random_uniform(256))
                
                if randomRed == 255.0 && randomGreen == 255.0 && randomBlue == 255.0 {
                    randomRed = CGFloat(arc4random_uniform(128))
                }
                
                colorsArray.append(UIColor(red: randomRed/255.0, green: randomGreen/255.0, blue: randomBlue/255.0, alpha: 1.0))
            }
            
            colorsDict[tableViewSection] = colorsArray
        }

    
    
    
    }
    
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfCollectionsForRow
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Instead of having a single cellIdentifier for each type of
        // UITableViewCells, like in a regular implementation, we have multiple
        // cellIDs, each related to a indexPath section. By Doing so the
        // UITableViewCells will still be recycled but only with
        // dequeueReusableCell of that section.
        //
        // For example the cellIdentifier for section 4 cells will be:
        //
        // "tableViewCellID_section_#3"
        //
        // dequeueReusableCell will only reuse previous UITableViewCells with
        // the same cellIdentifier instead of using any UITableViewCell as a
        // regular UITableView would do, this is necessary because every cell
        // will have a different UICollectionView with UICollectionViewCells in
        // it and UITableView reuse won't work as expected giving back wrong
        // cells.
        var cell: TestTableViewCell? = tableView.dequeueReusableCell(withIdentifier: TestTableViewController.tableCellID + indexPath.section.description) as? TestTableViewCell
        
        if cell == nil {
            cell = TestTableViewCell(style: .default, reuseIdentifier: TestTableViewController.tableCellID + indexPath.section.description)
            
            // Configure the cell...
            cell!.selectionStyle = .none
            cell!.collectionViewPaginatedScroll = paginationEnabled
        }
        
        return cell!
    }
    
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //return "Section: " + section.description
        return "Classic"
        
        
    }
    
    // MARK: <UITableView Delegate>
    
    
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 28
    }
    
     func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell: TestTableViewCell = cell as? TestTableViewCell else {
            return
        }
        
        cell.setCollectionView(dataSource: self, delegate: self, indexPath: indexPath)
    }
    
//     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return fixView
//    }
    
    // MARK: <UICollectionView Data Source>
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfCollectionItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: TestCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: TestCollectionViewCell.identifier, for: indexPath) as? TestCollectionViewCell else {
            fatalError("UICollectionViewCell must be of GLIndexedCollectionViewCell type")
        }
        
        guard let indexedCollectionView: TestCollectionView = collectionView as? TestCollectionView else {
            fatalError("UICollectionView must be of GLIndexedCollectionView type")
        }
        
        // Configure the cell...
        cell.backgroundColor = colorsDict[indexedCollectionView.indexPath.section]?[indexPath.row]
        // cell.backgroundColor = UIColor.gray
        
        return cell
    }
    
    
    // MARK: <UICollectionViewDelegate Flow Layout>
    
    let collectionTopInset: CGFloat = 0
    let collectionBottomInset: CGFloat = 0
    let collectionLeftInset: CGFloat = 10
    let collectionRightInset: CGFloat = 10
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: collectionTopInset, left: collectionLeftInset, bottom: collectionBottomInset, right: collectionRightInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let tableViewCellHeight: CGFloat = tableviewRR.rowHeight
        let collectionItemWidth: CGFloat = tableViewCellHeight - (collectionLeftInset + collectionRightInset)
        let collectionViewHeight: CGFloat = collectionItemWidth
        
        return CGSize(width: collectionItemWidth, height: collectionViewHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // MARK: <UICollectionView Delegate>
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let nextData = self.storyboard?.instantiateViewController(withIdentifier: "nextViewController") as!nextViewController
        
        
        nextData.str = ""
        // nextData.str =  (self.colorsDict[indexPath.indexPath.section]?[indexPath.row]as? [String : String])
        //nextData.str1 = (self.arrMyData[(indexPath as NSIndexPath).row] as? [String : String])?["name"] as NSString!
        //nextData.str2 = (self.arrMyData[(indexPath as NSIndexPath).row] as? [String : String])?["offline"] as NSString!
        
        
        self.navigationController?.pushViewController(nextData, animated: true)
        
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
