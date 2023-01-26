//
//  CourseDetailsViewController.swift
//  SwiftbookApp
//
//  Created by Nikolay Trofimov on 25.01.2023.
//

import UIKit

class CourseDetailsViewController: UIViewController {
    
    @IBOutlet private weak var courseNameLabel: UILabel!
    @IBOutlet private weak var numberOfLessonsLabel: UILabel!
    @IBOutlet private weak var numberOfTestsLabel: UILabel!
    @IBOutlet private weak var courseImage: UIImageView!
    @IBOutlet private weak var favoriteButton: UIButton!
    
    var viewModel: CourseDetailsViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func toggleFavorite(_ sender: UIButton) {
        viewModel.favoriteButtonPressed()
    }
    
    private func setupUI() {        
        setStatusForFavoriteButton()
        
        viewModel.viewModelDidChange = { [weak self] viewModel in
            self?.setStatusForFavoriteButton()
        }
        courseNameLabel.text = viewModel.courseName
        numberOfLessonsLabel.text = viewModel.numberOfLessons
        numberOfTestsLabel.text = viewModel.numberOfTests
        guard let imageData = viewModel.imageData else { return }
        courseImage.image = UIImage(data: imageData)
    }
    
    private func setStatusForFavoriteButton() {
        favoriteButton.tintColor = viewModel.isFavorite ? .red : .gray
    }

}
