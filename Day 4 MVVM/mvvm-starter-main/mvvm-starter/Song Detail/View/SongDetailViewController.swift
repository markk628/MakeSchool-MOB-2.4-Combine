//
//  SongDetailViewController.swift
//  mvvm-starter
//
//  Created by Adriana González Martínez on 2/3/21.
//

import UIKit

class SongDetailViewController: UIViewController {

    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    private var viewModel = SongDetailVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO 1: Tell the VM that the view has laoded
        viewModel.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        
        //TODO 1.1: set the values in the storyboard
        self.artistNameLabel.text = viewModel.artist
        self.songImage.image = UIImage(named: viewModel.songImageName)
        self.releaseDateLabel.text = viewModel.releaseDate
        self.songNameLabel.text = viewModel.songName

        //TODO 1.2: Set the button's text
        setButtonText()
    }
    
    private func setButtonText(){
        //TODO 1.3: If the song is a fav the button should say "Remove from favorites", "Add to favorites" if not
        if viewModel.isFavorite {
            self.favoriteButton.setTitle("Remove from favorites", for: .normal)
        } else {
            self.favoriteButton.setTitle("Add to favorites", for: .normal)
        }
    }
    
    @IBAction func favoriteButtonPressed(_ sender: Any) {
        //TODO 4: handle the logic when pressed, inform the VM
        viewModel.markFavoriteButtonPressed()
        setButtonText()
    }
    
}
