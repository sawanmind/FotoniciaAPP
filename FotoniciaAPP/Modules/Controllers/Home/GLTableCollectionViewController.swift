//
//  GLTableCollectionViewController.swift
//  GLTableCollectionView
//

import UIKit

final class GLTableCollectionViewController: UITableViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	// This static string constant will be the cellIdentifier for the
	// UITableViewCells holding the UICollectionView, it's important to append
	// "_section#" to it so we can understand which cell is the one we are
	// looking for in the debugger. Look in UITableView's data source
	// cellForRowAt method for more explanations about the UITableViewCell reuse
	// handling.
	static let tableCellID: String = "tableViewCellID_section_#"

	let numberOfSections: Int = 20
	let numberOfCollectionsForRow: Int = 1
	let numberOfCollectionItems: Int = 20

	var colorsDict: [Int: [UIColor]] = [:]

	/// Set true to enable UICollectionViews scroll pagination
	var paginationEnabled: Bool = true

	override func viewDidLoad() {
		super.viewDidLoad()
        self.navigationItem.title = "SELECT LAYOUT"
        
        //self.view.addSubview(view)
//        self.tableView.tableFooterView = UIView()
//        
//        self.tableView.register(UINib(nibName: "BtnActionTableViewCell", bundle: nil), forCellReuseIdentifier: "BtnActionTableViewCell")
//        
//        self.tableView.estimatedRowHeight = 110.0
//        
//        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        customView.backgroundColor = UIColor.red
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        button.setTitle("Submit", for: .normal)

        //button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        customView.addSubview(button)
        
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.barTintColor = UIColor.gray
        let navBarImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        navigationController?.navigationBar.tintColor = UIColor.white
        self.showLeftBarButtonItemWithImage()


		// Uncomment the following line to preserve selection between
		// presentations
		// self.clearsSelectionOnViewWillAppear = false

		// Uncomment the following line to display an Edit button in the
		// navigation bar for this view controller.
		// self.navigationItem.rightBarButtonItem = self.editButtonItem()

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

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// MARK: <UITableView Data Source>

	override func numberOfSections(in tableView: UITableView) -> Int {
		return numberOfSections
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return numberOfCollectionsForRow
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
		var cell: GLCollectionTableViewCell? = tableView.dequeueReusableCell(withIdentifier: GLTableCollectionViewController.tableCellID + indexPath.section.description) as? GLCollectionTableViewCell

		if cell == nil {
			cell = GLCollectionTableViewCell(style: .default, reuseIdentifier: GLTableCollectionViewController.tableCellID + indexPath.section.description)

			// Configure the cell...
			cell!.selectionStyle = .none
			cell!.collectionViewPaginatedScroll = paginationEnabled
		}

		return cell!
	}

	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		//return "Section: " + section.description
        return "Classic"
    

	}

	// MARK: <UITableView Delegate>

    
    
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 88
	}

	override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 28
	}

	override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 0.0001
	}

	override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		guard let cell: GLCollectionTableViewCell = cell as? GLCollectionTableViewCell else {
			return
		}

		cell.setCollectionView(dataSource: self, delegate: self, indexPath: indexPath)
	}

	// MARK: <UICollectionView Data Source>

	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return numberOfCollectionItems
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell: GLIndexedCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: GLIndexedCollectionViewCell.identifier, for: indexPath) as? GLIndexedCollectionViewCell else {
			fatalError("UICollectionViewCell must be of GLIndexedCollectionViewCell type")
		}

		guard let indexedCollectionView: GLIndexedCollectionView = collectionView as? GLIndexedCollectionView else {
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
		let tableViewCellHeight: CGFloat = tableView.rowHeight
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
	// MARK: <Navigation>

	// In a storyboard-based application, you will often want to do a little
	// preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		// Get the new view controller using segue.destinationViewController.
		// Pass the selected object to the new view controller.
	}
	*/
}
