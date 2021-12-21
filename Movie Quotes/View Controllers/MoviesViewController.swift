//
//  MoviesViewController.swift
//  Movie Quotes
//
//  Created by admin on 21/12/2021.
//

import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var movieCollectionView: UICollectionView!
    let moviesArray = [Movies(movieName: "SpongBob", movieImg: UIImage(named: "SpongBob")!, movieQuestion: [MovieQuotes(answer: "Pineapple", qute: "What s SpongeBob's house?")]),
        Movies(movieName: "Friends", movieImg: UIImage(named: "Friends-logo")!, movieQuestion: [MovieQuotes(answer: "Pottery Barn", qute: "What store does Phebe hate?")]),
        Movies(movieName: "Harry Potter", movieImg: UIImage(named: "Harry-Potter-Logo")!, movieQuestion: [MovieQuotes(answer: "Harry Potter", qute: "It is impossible to manufacture or imitate love")]),
        Movies(movieName: "Tanglad", movieImg: UIImage(named: "tanglad")!, movieQuestion: [MovieQuotes(answer: "Hook Hand", qute: "Go. Live your dream")])
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender is IndexPath {
            let destination = segue.destination as! MoviesQuizeViewController
            destination.delgate = self
            let indexPath = sender as! NSIndexPath
            destination.questions = moviesArray[indexPath.row].movieQuestion
        }
    }

}

extension MoviesViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCollectionViewCell
        cell.lblMovieName.text = moviesArray[indexPath.row].movieName
        cell.imgMovie.image = moviesArray[indexPath.row].movieImg
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toQuestionVC", sender: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width * 0.3 , height: self.view.frame.width * 0.3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2, left: 3, bottom: 2, right: 3)
    }
    
}

extension MoviesViewController: MovieDelegate {
    
}
