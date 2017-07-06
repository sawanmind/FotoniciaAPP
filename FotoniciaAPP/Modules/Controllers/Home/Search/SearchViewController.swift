//
//  SearchViewController.swift
//  Photonicia
//
//  Created by Asheesh Verma on 21/05/17.
//  Copyright © 2017 Asheesh Verma. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var btnBack: UIBarButtonItem!
    @IBOutlet weak var countryTable: UITableView!
    var searchArray = [String]() {
        didSet {
            NotificationCenter.default.post(name: NSNotification.Name.init("searchResultsUpdated"), object: searchArray)
            self.countryTable.reloadData()
        }
    }
    lazy var countrySearchController: UISearchController = ({
        /* Display search results in a separate view controller */

//        let controller = UISearchController(searchResultsController: alternateController)
        let controller = UISearchController(searchResultsController: nil)
        controller.hidesNavigationBarDuringPresentation = false
        controller.dimsBackgroundDuringPresentation = false
        controller.searchBar.searchBarStyle = .minimal
        controller.searchBar.showsCancelButton = false
        controller.searchBar.returnKeyType = .search
        controller.searchBar.sizeToFit()
        controller.searchBar.isTranslucent = true
        return controller
    })()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true

        self.definesPresentationContext = true
        // Configure countryTable
//        self.navigationItem.titleView = countrySearchController.searchBar
        self.countryTable.tableHeaderView = self.countrySearchController.searchBar
        self.countrySearchController.hidesNavigationBarDuringPresentation = true
        self.countrySearchController.searchResultsUpdater = self
        self.countrySearchController.delegate = self
        self.countrySearchController.searchBar.delegate = self
        self.countrySearchController.definesPresentationContext = true
        self.countrySearchController.dimsBackgroundDuringPresentation = false
        
        self.countryTable.tableFooterView = UIView()
        
        self.countryTable.register(UINib(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchTableViewCell")
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
}


extension SearchViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        switch countrySearchController.isActive {
        case true:
            return searchArray.count
        case false:
            return Countries.list.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = countryTable.dequeueReusableCell(withIdentifier: "SearchTableViewCell") as! SearchTableViewCell
        cell.textLabel?.text = ""
        cell.textLabel?.attributedText = NSAttributedString(string: "")
        
        switch countrySearchController.isActive {
        case true:
            cell.configureCellWith(searchTerm:countrySearchController.searchBar.text!, cellText: searchArray[indexPath.row])
            return cell
        case false:
            cell.textLabel?.text! = Countries.list[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerText = UILabel()
        headerText.backgroundColor = UIColor.white
        headerText.textColor = UIColor(red: 74/255, green: 75/255, blue: 71/255, alpha: 1)
        headerText.adjustsFontSizeToFitWidth = true
        headerText.textAlignment = .center
        headerText.text = "Hot Searches"
        
        return headerText
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch countrySearchController.isActive {
        case true: return 0.0
        case false: return 100.0
        }
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


extension SearchViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        self.countrySearchController.searchBar.setShowsCancelButton(false, animated: true)
        return true
    }
}

extension SearchViewController: UISearchResultsUpdating
{
    func updateSearchResults(for searchController: UISearchController) {
        searchArray.removeAll(keepingCapacity: false)
        
        let range = searchController.searchBar.text!.characters.startIndex ..< searchController.searchBar.text!.characters.endIndex
        var searchString = String()
        
        searchController.searchBar.text?.enumerateSubstrings(in: range, options: .byComposedCharacterSequences, { (substring, substringRange, enclosingRange, success) in
            searchString.append(substring!)
            searchString.append("*")
        })
        
        let searchPredicate = NSPredicate(format: "SELF LIKE[cd] %@", searchString)
        let array = (Countries.list as NSArray).filtered(using: searchPredicate)
        self.searchArray = array as! [String]
        self.countryTable.reloadData()
        
    }
}

extension SearchViewController: UISearchControllerDelegate {
    func didPresentSearchController(_ searchController: UISearchController) {
//        self.countrySearchController.searchBar.setShowsCancelButton(false, animated: true)
    }

    func willPresentSearchController(_ searchController: UISearchController) {
//        searchController.searchBar.showsCancelButton = false
        
        self.countrySearchController.searchBar.becomeFirstResponder()

    }

}

public enum Countries
{
    static let list = ["Frame", "Photo Prints", "Photo Books", "Canvas Prints", "Hand Made Art", "Photographer", "Wall Artist", "Mug Prints"]
    
    //static let list = ["Afghanistan", "Akrotiri", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Ashmore and Cartier Islands", "Australia", "Austria", "Azerbaijan", "The Bahamas", "Bahrain", "Bangladesh", "Barbados", "Bassas da India", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegovina", "Botswana", "Bouvet Island", "Brazil", "British Indian Ocean Territory", "British Virgin Islands", "Brunei", "Bulgaria", "Burkina Faso", "Burma", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Clipperton Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Democratic Republic of the Congo", "Republic of the Congo", "Cook Islands", "Coral Sea Islands", "Costa Rica", "Cote d'Ivoire", "Croatia", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Dhekelia", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Europa Island", "Falkland Islands (Islas Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "French Guiana", "French Polynesia", "French Southern and Antarctic Lands", "Gabon", "The Gambia", "Gaza Strip", "Georgia", "Germany", "Ghana", "Gibraltar", "Glorioso Islands", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guernsey", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard Island and McDonald Islands", "Holy See (Vatican City)", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Isle of Man", "Israel", "Italy", "Jamaica", "Jan Mayen", "Japan", "Jersey", "Jordan", "Juan de Nova Island", "Kazakhstan", "Kenya", "Kiribati", "North Korea", "South Korea", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Federated States of Micronesia", "Moldova", "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Namibia", "Nauru", "Navassa Island", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paracel Islands", "Paraguay", "Peru", "Philippines", "Pitcairn Islands", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romania", "Russia", "Rwanda", "Saint Helena", "Saint Kitts and Nevis", "Saint Lucia", "Saint Pierre and Miquelon", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Serbia", "Montenegro", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and the South Sandwich Islands", "Spain", "Spratly Islands", "Sri Lanka", "Sudan", "Suriname", "Svalbard", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Tibet", "Timor-Leste", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tromelin Island", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Virgin Islands", "Wake Island", "Wallis and Futuna", "West Bank", "Western Sahara", "Yemen", "Zambia", "Zimbabwe"]
}
