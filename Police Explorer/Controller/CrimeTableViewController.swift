//
//  CrimeTableViewController.swift
//  Police Explorer
//
//  Created by Aaron McTavish on 04/04/2018.
//

import UIKit


final class CrimeTableViewController: UITableViewController {


    // MARK: - Properties

    var crimes: [StreetCrime] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    static let reuseIdentifier = "CrimeCell"


    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CrimeTableViewController.reuseIdentifier)
    }


    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crimes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CrimeTableViewController.reuseIdentifier, for: indexPath)
        let crime = crimes[indexPath.row]

        cell.textLabel?.text = crime.description
        cell.accessibilityIdentifier = "\(Accessibility.CrimeTableCellPrefix)\(crime.id)"
        cell.accessoryType = .disclosureIndicator

        return cell
    }


    // MARK: - UITableViewDelegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let crime = crimes[indexPath.row]

        let crimeDetailController = CrimeDetailViewController(crime: crime)

        show(crimeDetailController, sender: nil)
    }
    
}
