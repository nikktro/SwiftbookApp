//
//  CourseTableViewCell.swift
//  SwiftbookApp
//
//  Created by Nikolay Trofimov on 25.01.2023.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    var viewModel: CourseCellViewModelProtocol! {
        didSet {
            var content = defaultContentConfiguration()
            content.text = viewModel.courseName
            guard let imageData = viewModel.imageData else { return }
            content.image = UIImage(data: imageData)
            contentConfiguration = content
        }
    }
}
