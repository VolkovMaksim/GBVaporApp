import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    //MARK: ЗАПРОС ТОВАРА ПО ТИПУ
    // запрос товара по типу
    app.get("shorts") { req -> String in
        return "Наименование: \(Shorts().name)\nРазмер: \(Shorts().size)\nКоличество: \(Shorts().quantity)\nЦена: \(Shorts().price)"
    }
    
    // запрос товара по типу
    app.get("polo") { req -> String in
        return "Наименование: \(Polo().name)\nРазмер: \(Polo().size)\nКоличество: \(Polo().quantity)\nЦена: \(Polo().price)"
    }
    
    //MARK: ЗАПРОС СПИСКА ТОВАРОВ
        // при запросе на url "getMerchList" будет использован класс MerchListController - метод getMerchList
    app.get("getMerchList") { req -> String in
        var list = ""
        for merch in Merch().merchList {
            list = list + "Наименование: \(merch.name)\nРазмер: \(merch.size)\nКоличество: \(merch.quantity)\nЦена: \(merch.price)\n------\n"
        }
        return list
    }
    
    //MARK: ЗАПРОС, ДОБАВЛЕНИЕ, УДАЛЕНИЕ ОТЗЫВОВ
    let controllerFeedback = FeedbackController()
    // запрос отзывов товар
    app.get("shortsFeedback") { req -> String in
        var feedbacks = ""
        for feedback in controllerFeedback.shorts.feedback! {
            feedbacks = feedbacks + "\(feedback)\n------\n"
        }
        return feedbacks
    }
    
    //MARK: ДОБАВЛЕНИЕ ОТЗЫВОВ
    // при запросе на url "postFeedback" будет использован класс FeedbackController - метод postFeedback
    app.post("postFeedback", use: controllerFeedback.postFeedback)
    
    //MARK: УДАЛЕНИЕ ОТЗЫВОВ
    // при запросе на url "shortsFeedbackDelete" будет использован класс FeedbackController - метод postFeedback
    app.post("shortsFeedbackDelete", use: controllerFeedback.shortsFeedbackDelete)
    
    //MARK: РЕГИСТРАЦИЯ
    let controllerAuth = AuthController()
    // при запросе на url "register" будет использован класс AuthController - метод register
    app.post("register", use: controllerAuth.register)
    
    //MARK: ПРОДАЖА
    let controllerSale = SaleController()
    // при запросе на url "sale" будет использован класс SaleController - метод sale
    app.post("sale", use: controllerSale.sale)

    try app.register(collection: TodoController())
}
