//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Никита Богданов on 27.02.2022.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    // create a tableView
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: String(describing: ProfileHeaderView.self))
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "ArticleCell")
        tableView.backgroundColor = .systemGray6
        tableView.layer.borderColor = UIColor.lightGray.cgColor
        tableView.layer.borderWidth = 0.5
        tableView.toAutoLayout()
        return tableView
    }()
    
    private var heightConstraint: NSLayoutConstraint?
    
    // an array of type Posts
    private var dataSource: [Posts] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupView()
        self.addDataSource()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Профиль"
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(self.tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func addDataSource() {
        self.dataSource.append(.init(author: "Минг-Чи Куо", description: "iPhone SE 2022 года станет «самым дешевым iPhone с 5G в истории»\nApple планирует выпустить следующий iPhone SE в первой половине 2022 года, сообщил аналитик Минг-Чи Куо. В своей записке инвесторам он рассказал, что дизайн нового смарфона будет «примерно таким же», как и у настоящего SE, созданного по образу iPhone 8.", image: "IphoneSE2022", likes: 15, views: 25))
        self.dataSource.append(.init(author: "Екатерина Савостина", description: "Леклер завоевал первый «Большой шлем» в карьере в «Формуле-1»\nПилот «Феррари» Шарль Леклер выиграл «Гран-при Австралии». Это его первый «Большой шлем» в карьере в «Формуле-1». За этот уик-энд гонщик выиграл квалификацию, получил дополнительное очко за лучший круг и лидировал в гонке от старта до финиша.", image: "lekler", likes: 25, views: 50))
        self.dataSource.append(.init(author: "Павел Нитки", description: "Добряк Тсонга уходит из тенниса\nЖо-Вильфред Тсонга начал профессиональную карьеру в 2004 году и за это время сумел:\n\u{25E6} выиграть 18 титулов (включая два «Мастерса») – это седьмой результат среди действующих теннисистов\n\u{25E6} сыграть в финале Australian Open, полуфинале «Ролан Гаррос» и «Уимблдона» и четвертьфинале US Open\nпобывать пятой ракеткой мира\n\u{25E6} заработать 22 миллиона долларов призовыми – это 18-й результат в истории\n", image: "tsonga", likes: 32, views: 56))
        self.dataSource.append(.init(author: "Александр Дорский", description: "Кажется, Агаларова уже не догнать – он лучший бомбардир РПЛ!\nТакого взлета результативности у нас не было и с гонкой бомбардиров в РПЛ все ясно. \nВ воскресенье Гамид Агаларов забил 16-й гол в сезоне (с пенальти в ворота «Сочи») и оторвался от Артема Дзюбы и Федора Смолова на шесть мячей.\nПреимущество в пять сохранилось над Дмитрием Полозом – нападающий «Ростова» тоже забил в прошедшем туре.", image: "agalarov", likes: 32, views: 65))
        self.dataSource.append(.init(author: "Никита Петухов", description: "Овечкин забил 775-ю шайбу в НХЛ! И повторил рекорд Буре по голам в пустые ворота.\nЗа 2 секунды до конца матча с «Бостоном» Александр Овечкин забил в пустые ворота. Вдвоем с Кузнецовым они вышли на одного защитника и с паса партнера Ови бросил вообще без помех.\nЭто 775-я шайба Александра – он остается третьим в списке лучших снайперов всех времен, до Горди Хоу – 26 голов.", image: "ovi", likes: 22, views: 65))
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
            
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? PostTableViewCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
                return cell
            }
            let article = self.dataSource[indexPath.row - 1]
            let viewModel = PostTableViewCell.ViewModel(author: article.author,
                                                                    image: article.image,
                                                                    description: article.description,
                                                                    likes: article.likes,
                                                                    views: article.views)
            cell.setup(with: viewModel)
            return cell
            }
    }
    
    func tableView(_ tableView: UITableView,
                       viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: ProfileHeaderView.self))
        }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return  250
    }
    
    func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if indexPath.row == 0 {
            self.navigationController?.pushViewController(PhotosViewController(), animated: true)
            } else { return }
        }
}


