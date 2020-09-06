//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var storyBrain = StoryBrain()
    
    
    private let storyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 19, weight: .regular)
        label.textColor = .white
        label.numberOfLines = 0
        
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let choice1Button: UIButton = {
        let button = UIButton()
        button.setTitle("Choice 1", for: .normal)
        button.setBackgroundImage(UIImage(named: "choice1Background"), for: .normal)
        return button
    }()
    private let choice2Button: UIButton = {
        let button = UIButton()
        button.setTitle("Choice 2", for: .normal)
        button.setBackgroundImage(UIImage(named: "choice2Background"), for: .normal)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        choice1Button.addTarget(self, action: #selector(choiceMade), for: .touchUpInside)
        choice2Button.addTarget(self, action: #selector(choiceMade), for: .touchUpInside)
        view.addSubview(imageView)
        view.addSubview(storyLabel)
        view.addSubview(choice1Button)
        view.addSubview(choice2Button)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = view.bounds
        storyLabel.frame = CGRect(x: 16,
                                  y: view.frame.midY - 150,
                                  width: view.width - 32,
                                  height: 190)
        choice1Button.frame = CGRect(x: 16,
                                     y: view.height - 150,
                                     width: (view.frame.width - 32),
                                     height: 60)
        choice2Button.frame = CGRect(x: 16 ,
                                     y: choice1Button.bottom + 10,
                                     width: (view.width - 32),
                                     height: 60)
    }
    
    @objc private func choiceMade(_ sender: UIButton) {
        guard let button = sender.titleLabel?.text else {
            return
        }
        storyBrain.nextStory(userChoice: button)
        updateUI()
        
        
    }
    
    
    private func updateUI(){
        let index = storyBrain.currentStory
        let story = storyBrain.stories[index]
        storyLabel.text = story.title
        choice1Button.setTitle(story.choice1, for: .normal)
        choice2Button.setTitle(story.choice2, for: .normal)
    }
    
}

