//
//  CourseListViewController.swift
//  SwiftbookApp
//
//  Created by Nikolay Trofimov on 25.01.2023.
//

import UIKit

class CourseListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: CourseListViewModelProtocol!{
        didSet {
            viewModel.fetchCourses {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = CourseListViewModel()
        tableView.rowHeight = 100
        setupNavigationBar()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! CourseDetailsViewController
        detailVC.viewModel = sender as? CourseDetailsViewModelProtocol
    }
    
    private func setupNavigationBar() {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationBar.topItem?.title = "Courses"
            navigationController?.navigationBar.tintColor = .white
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    }
    
}
// MARK: - Table view data source
extension CourseListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCell", for: indexPath) as! CourseTableViewCell
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        return cell
    }
}

// MARK: - Table view delegate
extension CourseListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailsViewModel = viewModel.detailsViewModel(at: indexPath)
        performSegue(withIdentifier: "ShowDetails", sender: detailsViewModel)
    }
}
