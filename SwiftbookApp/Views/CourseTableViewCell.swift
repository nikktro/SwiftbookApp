//
//  CourseTableViewCell.swift
//  SwiftbookApp
//
//  Created by Nikolay Trofimov on 25.01.2023.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    func configure(with course: Course) {
        var content = defaultContentConfiguration()
        content.text = course.name
        ImageManager.shared.fetchImageData(from: course.imageUrl) { imageData in
            content.image = UIImage(data: imageData)
            self.contentConfiguration = content
        }
    }
}
