//
//  ProductInfoVM.swift
//  Meat Me Sample Application
//
//  Created by Yogesh Rao on 11/03/23.
//

import UIKit

class ProductInfoVM: NSObject, ObservableVM {
    var error: Observable<String?> = Observable(nil)
    var result: Observable<ProductModel?> = Observable(nil)
    
    func fetchData() {
        self.result.value = ProductModel(productDetails: nil,
                                         productImages: nil,
                                         recipeImagesWithText: [
                                            RecipesImagesAndText(image: UIImage.foodDecorated?.pngData() ?? Data(), text: "SORPRENDE A PAPÁ EN SU DÍA CON ESTAS RICAS RECETAS"),
                                            RecipesImagesAndText(image: UIImage.foodDecorated?.pngData() ?? Data(), text: "SORPRENDE A PAPÁ EN SU DÍA CON ESTAS RICAS RECETAS"),
                                            RecipesImagesAndText(image: UIImage.foodDecorated?.pngData() ?? Data(), text: "SORPRENDE A PAPÁ EN SU DÍA CON ESTAS RICAS RECETAS")
                                         ],
                                         
                                         productDescription: ProductDescriptionModel(title: "DETALLE DEL PRODUCTO",
                                        descriptionBody: "Ws diferente al pollo que normalmente ves en el super porque al ser natural es blanco y no amarillo. Tiene",
                                                                                     
                                        infoLabels: [
                                            InfoWithWeight(infoLabel: "Lugar de origen", weightLabel: "MX"),
                                            InfoWithWeight(infoLabel: "Calorías por cada 100g", weightLabel: "263"),
                                            InfoWithWeight(infoLabel: "Tipo de empaque", weightLabel: "BOLSA IQF")
                                        ]),
                                         reviews: [ReviewsModel(avatarImage: UIImage.avatar?.pngData(),
                                                               userName: "VICTOR T",
                                                               userVerified: "USUARIO VERIFICADO",
                                                                rating: "Rating (4.2)",
                                                                topic: "SANTI OSMOS",
                                                                reviewInBrief: "Ws diferente al pollo que normalmente ves en el super porque al ser natural es blanco y no amarillo. Tiene",
                                                                dateOfReview: DateFormatter().date(from: "02/23/2022") ?? Date.distantFuture,
                                                                numberOfLikes: 999, numberOfDislikes: 999),
                                                   
                                                   ReviewsModel(avatarImage: UIImage.avatar?.pngData(),
                                                                         userName: "VICTOR T",
                                                                         userVerified: "USUARIO VERIFICADO",
                                                                          rating: "Rating (4.2)",
                                                                          topic: "SANTI OSMOS",
                                                                          reviewInBrief: "Ws diferente al pollo que normalmente ves en el super porque al ser natural es blanco y no amarillo. Tiene",
                                                                          dateOfReview: DateFormatter().date(from: "02/23/2022") ?? Date.distantFuture,
                                                                          numberOfLikes: 999, numberOfDislikes: 999),
                                                   
                                                   ReviewsModel(avatarImage: UIImage.avatar?.pngData(),
                                                                         userName: "VICTOR T",
                                                                         userVerified: "USUARIO VERIFICADO",
                                                                          rating: "Rating (4.2)",
                                                                          topic: "SANTI OSMOS",
                                                                          reviewInBrief: "Ws diferente al pollo que normalmente ves en el super porque al ser natural es blanco y no amarillo. Tiene",
                                                                          dateOfReview: DateFormatter().date(from: "02/23/2022") ?? Date.distantFuture,
                                                                          numberOfLikes: 999, numberOfDislikes: 999)
                                                   ])
    }

}
