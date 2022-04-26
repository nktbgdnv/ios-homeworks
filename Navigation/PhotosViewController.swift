//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Никита Богданов on 21.04.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    var selectedCell: PhotosCollectionViewCell?
    var selectedCellImageViewSnapshot: UIView?
    
    private enum Constants {
        static let itemCount: CGFloat = 3
    }
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollectionViewCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCollectionCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    private var collectionDataSource : [CollectionViewModel] = [
        CollectionViewModel(image: "car-1.jpg"),
        CollectionViewModel(image: "lemons.jpg"),
        CollectionViewModel(image: "piter-1.jpg"),
        CollectionViewModel(image: "piter-2.jpg"),
        CollectionViewModel(image: "piter-3.jpg"),
        CollectionViewModel(image: "piter-4.jpg"),
        CollectionViewModel(image: "plane.jpg"),
        CollectionViewModel(image: "shells.jpg"),
        CollectionViewModel(image: "silifke-1.jpg"),
        CollectionViewModel(image: "simena-1.jpg"),
        CollectionViewModel(image: "strawberry.jpg"),
        CollectionViewModel(image: "tasucu-1.jpg"),
        CollectionViewModel(image: "tasucu-2.jpg"),
        CollectionViewModel(image: "tasucu-3.jpg"),
        CollectionViewModel(image: "tasucu-4.jpg"),
        CollectionViewModel(image: "tasucu-5.jpeg"),
        CollectionViewModel(image: "tasucu-6.jpg"),
        CollectionViewModel(image: "tasucu-7.jpg"),
        CollectionViewModel(image: "tasucu-8.jpg"),
        CollectionViewModel(image: "tasucu-9.jpg")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.title = "Галерея фото"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupView() {
        view.addSubview(self.collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func itemSize(for width: CGFloat, with spacing: CGFloat) -> CGSize {
        let neededWidth = width - 4 * spacing
        let itemWidth = floor(neededWidth / Constants.itemCount)
        return CGSize(width: itemWidth, height: itemWidth)
    }
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collectionDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as? PhotosCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCollectionCell", for: indexPath)
            cell.backgroundColor = .black
            return cell
        }
        cell.backgroundColor = .systemGray6
        let photos = collectionDataSource[indexPath.row]
        cell.photoGalleryImages.image = UIImage(named: photos.image)
        cell.photoGalleryImages.contentMode = .scaleAspectFill
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize {
        let spacing = ( collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing
        return self.itemSize(for: collectionView.frame.width, with: spacing ?? 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = DetailedPhotoViewController()
        viewController.selectedImage = collectionDataSource[indexPath.row].image
        navigationController?.pushViewController(viewController, animated: true)
    }
}

struct CollectionViewModel {
    var image:String = ""

    init(image: String){
        self.image = image
    }
}
