//
//  ViewController.swift
//  CatsTap
//
//  Created by Sasha on 9.12.24.
//

import UIKit

final class ViewController: UIViewController {

    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureButton()
    }

    override func viewDidLayoutSubviews() {
        button.layer.cornerRadius = button.frame.height / 2
    }


    func configureButton() {
        button.backgroundColor = .yellow
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)

        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)

        constrainButton()
    }

    func constrainButton() {
        NSLayoutConstraint.activate(
            [
                button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                button.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
                button.heightAnchor.constraint(equalToConstant: 100),
                button.widthAnchor.constraint(equalToConstant: 100)
            ]
        )

    }

    @objc func tapButton() {
        let maxX = Double(view.frame.maxX - (button.frame.width + 20))
        let minX = Double(view.frame.minX + (button.frame.width + 20))
        let maxY = Double(view.frame.maxY - (button.frame.height + 20))
        let minY = Double(view.frame.minY + (button.frame.height + 20))

        let randomX = Double.random(in: minX..<maxX)
        let randomY = Double.random(in: minY..<maxY)

        button.frame.origin = CGPoint(x: randomX, y: randomY)
        button.backgroundColor = UIColor(red: CGFloat.random(in: 20/255...300/255), green: CGFloat.random(in: 20/255...300/255), blue: CGFloat.random(in: 20/255...300/255), alpha: 1)
    }


}

#Preview {
    let perviewViewController = ViewController()
    perviewViewController
}

