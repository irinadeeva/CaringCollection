//
//  ViewController.swift
//  CaringCollection
//
//  Created by Irina Deeva on 27/11/24.
//

import UIKit

class ViewController: UIViewController {
  private let itemWidth: CGFloat = UIScreen.main.bounds.width * 0.8
  private let lineSpacing: CGFloat = 10
  let colors: [UIColor] = [
      .systemRed, .systemBlue, .systemGreen, .systemYellow, .systemOrange,
      .systemPurple, .systemTeal, .systemPink, .systemIndigo, .systemBrown
  ]

  let emojis: [String] = ["😀", "😅", "😂", "🥰", "😎", "🤩", "😇", "😜", "🤔", "🙃"]


  private lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: itemWidth, height: 400)
    layout.minimumLineSpacing = lineSpacing
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.register(MyCell.self, forCellWithReuseIdentifier: "cell")
    collectionView.backgroundColor = .systemBackground
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.showsHorizontalScrollIndicator = false
    return collectionView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .systemBackground
    title = "Collection"
    navigationController?.navigationBar.prefersLargeTitles = true

    view.addSubview(collectionView)

    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    ])
  }
}

extension ViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    10
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MyCell else {
      return UICollectionViewCell()
    }
    cell.contentView.backgroundColor = colors[indexPath.row]
    cell.contentView.layer.cornerRadius = 10
    cell.label.text = emojis[indexPath.row]
    return cell
  }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    .init(top: 0, left: 10, bottom: 0, right: 10)
  }

  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    var currentIndex = Int(targetContentOffset.pointee.x / (itemWidth + lineSpacing))
    currentIndex = (currentIndex != 0) ? (currentIndex + 1) : currentIndex
    let offsetX = CGFloat(currentIndex) * (itemWidth + lineSpacing) - CGFloat(lineSpacing + 10)
    targetContentOffset.pointee = CGPoint(x: offsetX, y: targetContentOffset.pointee.y)
  }
}

class MyCell: UICollectionViewCell {
  let label: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.font = .systemFont(ofSize: 40)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.addSubview(label)

    NSLayoutConstraint.activate([
      label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
    ])
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
