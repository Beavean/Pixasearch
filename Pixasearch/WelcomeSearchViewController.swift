//
//  WelcomeSearchViewController.swift
//  Pixasearch
//
//  Created by Beavean on 01.03.2023.
//

import UIKit
import SnapKit
import DropDown

class WelcomeSearchViewController: UIViewController {
    // MARK: - UIElements

    let backgroundImageView = UIImageView()
    let searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search images, vectors and more"
        textField.layer.cornerRadius = 5
        textField.backgroundColor = UIColor(named: Constants.Colors.backgroundColor)
        return textField
    }()
    var searchButton: UIButton = {
        let button = UIButton()
        button.tintColor = UIColor(named: Constants.Colors.lightTextTintColor)
        button.backgroundColor = UIColor(named: Constants.Colors.buttonFillColor)
        button.setTitle("Search", for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()
    let imagesButton = UIButton()
    let imagesDropdown = DropDown()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImageView.image = UIImage(named: Constants.Images.welcomeBackground)
        view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        let overlayView = UIView()
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.addSubview(overlayView)
        overlayView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        imagesButton.setTitle("Images", for: .normal)
        imagesButton.setTitleColor(.black, for: .normal)
        imagesButton.backgroundColor = .white
        imagesButton.layer.cornerRadius = 10

        let searchStackView = UIStackView(arrangedSubviews: [searchTextField, imagesButton])
        searchStackView.axis = .horizontal
        searchStackView.alignment = .center
        searchStackView.distribution = .fill
        view.addSubview(searchStackView)
        searchStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
            make.width.equalToSuperview().offset(-40)
            make.height.equalTo(52)
        }

        view.addSubview(searchButton)
        searchButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(searchStackView.snp.bottom).offset(20)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }

        imagesDropdown.anchorView = imagesButton
        imagesDropdown.dataSource = ["Option 1", "Option 2", "Option 3"]
        imagesDropdown.selectionAction = { [weak self] index, title in
        }

        imagesButton.addTarget(self, action: #selector(showImagesDropdown), for: .touchUpInside)
    }

    @objc func showImagesDropdown() {
        imagesDropdown.show()
    }
}
