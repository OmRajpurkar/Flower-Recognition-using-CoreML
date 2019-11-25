//
//  Flower.swift
//  WhatFlower
//
//  Created by OM Rajpurkar on 23/09/19.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import Foundation
import RealmSwift

class Flower:Object{
    @objc dynamic var region : String?
    @objc dynamic var name : String?
    @objc dynamic var info : String?
    @objc dynamic var image : String?
}

extension Flower {
    static func createFlower() -> [Flower] {
        
        let realm = try! Realm()
                
        print(Realm.Configuration.defaultConfiguration.fileURL!)
                
        
        let forestFlower1 = Flower()
        forestFlower1.region = "Forest"
        forestFlower1.image = "African Daisy"
        forestFlower1.name = "African Daisy"
        forestFlower1.info = "Osteospermum, or African daisies, have flowers that look very familiar, yet totally foreign. You may even think they've been dyed or painted. African daisies look a lot like common daisies, with petals radiating around a center disk."

        try! realm.write {
            realm.add(forestFlower1)
        }

        let forestFlower2 = Flower()
        forestFlower2.region = "Forest"
        forestFlower2.image = "Bird Cherry"
        forestFlower2.name = "Bird Cherry"
        forestFlower2.info = "The individual flower-spikes of Bird cherry are very attractive; and these wild flowers have a strong almondy scent during their prime season."

        try! realm.write {
            realm.add(forestFlower2)
        }

        let forestFlower3 = Flower()
        forestFlower3.region = "Forest"
        forestFlower3.image = "Celandine"
        forestFlower3.name = "Celandine"
        forestFlower3.info = "The Celandine flowers have eight glossy, butter-yellow petals, arranged in a rosette form and are seen singly on delicate stalks."

        try! realm.write {
            realm.add(forestFlower3)
        }

        let forestFlower4 = Flower()
        forestFlower4.region = "Forest"
        forestFlower4.image = "Clasping Cone"
        forestFlower4.name = "Clasping Cone"
        forestFlower4.info = "The Clasping cone flower identifiable black, cone-shaped heads are surrounded by bright yellow, drooping reflexed ray flowers."

        try! realm.write {
            realm.add(forestFlower4)
        }

        let forestFlower5 = Flower()
        forestFlower5.region = "Forest"
        forestFlower5.image = "Corn Flower"
        forestFlower5.name = "Corn Flower"
        forestFlower5.info = "The Cornflower is an annual, native of Europe. The original flower color is blue, but it is now available in white, pink and red."

        try! realm.write {
            realm.add(forestFlower5)
        }

        let forestFlower6 = Flower()
        forestFlower6.region = "Forest"
        forestFlower6.image = "Coltsfoot"
        forestFlower6.name = "Coltsfoot"
        forestFlower6.info = "Coltsfoot is a plant. The leaf is used to make medicine.Despite serious safety concerns, people take coltsfoot for lung problems such as bronchitis, asthma, and whooping cough. They also take it for upper respiratory tract complaints including sore mouth and throat, cough, and hoarseness."

        try! realm.write {
            realm.add(forestFlower6)
        }

        let forestFlower7 = Flower()
        forestFlower7.region = "Forest"
        forestFlower7.image = "Dog Violet"
        forestFlower7.name = "Dog Violet"
        forestFlower7.info = "The purple flowers of the Common Dog-violet resemble those of pansies. It has heart-shaped leaves and, unlike some other types of violet, has no scent."

        try! realm.write {
            realm.add(forestFlower7)
        }

        let forestFlower8 = Flower()
        forestFlower8.region = "Forest"
        forestFlower8.image = "Drummond Phlox"
        forestFlower8.name = "Drummond Phlox"
        forestFlower8.info = "Drummond Phlox flowers are concentrated in clusters on top of sturdy, erect stems. The exquisite deep red flowers bloom continually if watered frequently"

        try! realm.write {
            realm.add(forestFlower8)
        }

        let grasslandFlower1 = Flower()
        grasslandFlower1.region = "Grassland"
        grasslandFlower1.image = "Sunflower"
        grasslandFlower1.name = "Sunflower"
        grasslandFlower1.info = "The Sunflower forms in dense groups in grasslands and typically spreads very quickly. Sunflower leaves are mainly at the bottom of the plant. The blossoms have yellow petals and brown centers"

        try! realm.write {
            realm.add(grasslandFlower1)
        }

        let grasslandFlower2 = Flower()
        grasslandFlower2.region = "Grassland"
        grasslandFlower2.image = "Blazing Stars"
        grasslandFlower2.name = "Blazing Stars"
        grasslandFlower2.info = "Blazing Stars are a tall, hardy plants that grows from a tuber. The top part of the Blazing Star contains spikes of rose-purple, thistle-like flowers. The flowers usually bloom in late summer and autumn."

        try! realm.write {
            realm.add(grasslandFlower2)
        }

        let grasslandFlower3 = Flower()
        grasslandFlower3.region = "Grassland"
        grasslandFlower3.image = "Wild Indigo"
        grasslandFlower3.name = "Wild Indigo"
        grasslandFlower3.info = "Wild indigo plants are a perennial flower that usually blooms in warm weather. The plant stems are stout and can grow up to about 5 feet tall and 3 feet wide. The flower blooms range in color from a light blue to a dark purple."

        try! realm.write {
            realm.add(grasslandFlower3)
        }

        let grasslandFlower4 = Flower()
        grasslandFlower4.region = "Grassland"
        grasslandFlower4.image = "Aster"
        grasslandFlower4.name = "Aster"
        grasslandFlower4.info = "Asters are perennial plants that grow from 2 to 6 feet tall. The leaves of the flower can be up to 4 inches long and 1 inch wide. The blooms are typically a bright purple color and have a central yellow disk."

        try! realm.write {
            realm.add(grasslandFlower4)
        }

        let grasslandFlower5 = Flower()
        grasslandFlower5.region = "Grassland"
        grasslandFlower5.image = "Goldenrods"
        grasslandFlower5.name = "Goldenrods"
        grasslandFlower5.info = "Goldenrods are flowers that offer bright yellow flowers and have a flat-topped cluster of flowers. The plant can grow to be a little over 3 feet tall. The flower normally blooms in autumn."

        try! realm.write {
            realm.add(grasslandFlower5)
        }

        let desertFlower1 = Flower()
        desertFlower1.region = "Desert"
        desertFlower1.image = "Apache Plume"
        desertFlower1.name = "Apache Plume"
        desertFlower1.info = "The Apache plume, a dense shrub with a silvery white flower head that blooms from May to October. Some of the largest specimens are more than seven feet tall, but the average plant is far shorter, especially at higher elevations."

        try! realm.write {
            realm.add(desertFlower1)
        }

        let desertFlower2 = Flower()
        desertFlower2.region = "Desert"
        desertFlower2.image = "California Poppy"
        desertFlower2.name = "California Poppy"
        desertFlower2.info = "Abundant and beautiful, this poppy well deserves its place as California's state flower. The life cycle of the California poppy, a so-called 'drought escaper,' is ideally suited to the low rainfall of the Mojave Desert."

        try! realm.write {
            realm.add(desertFlower2)
        }

        let desertFlower3 = Flower()
        desertFlower3.region = "Desert"
        desertFlower3.image = "Chuparosa"
        desertFlower3.name = "Chuparosa"
        desertFlower3.info = "Chuparosa, which means 'rose-sucker' in Spanish, refers not to this delicate bell-shaped flower, but to the hummingbirds that it so readily attracts. Mexico and Central America abound with some 60 species of this beautiful plant."

        try! realm.write {
            realm.add(desertFlower3)
        }

        let desertFlower4 = Flower()
        desertFlower4.region = "Desert"
        desertFlower4.image = "Golden Suncup"
        desertFlower4.name = "Golden Suncup"
        desertFlower4.info = "An especially wet late fall and early winter will assure a good crop of these brilliantly colored, reddish-orange or yellow flowers, which favor sandy desert flats."

        try! realm.write {
            realm.add(desertFlower4)
        }

        let desertFlower5 = Flower()
        desertFlower5.region = "Desert"
        desertFlower5.image = "Desert Marigold"
        desertFlower5.name = "Desert Marigold"
        desertFlower5.info = "The plant grows as a perennial or biennial and reaches a height of 12 to 18 inches. Both the petals and the central disk are yellow, and the flowers bloom from March through November."

        try! realm.write {
            realm.add(desertFlower5)
        }

        let desertFlower6 = Flower()
        desertFlower6.region = "Desert"
        desertFlower6.image = "Desert Sand Verbena"
        desertFlower6.name = "Desert Sand Verbena"
        desertFlower6.info = "Desert sand verbena makes its appearance only after the typical winter rains of the desert. The plant produces stems and 1-inch-long, oval-shaped leaves covered in short, sticky hairs. Bright pink-lavender, trumpet-shaped flowers grow in umbrella-shaped clusters at the tips of stems 1 to 3 inches long."

        try! realm.write {
            realm.add(desertFlower6)
        }

        let tundraFlower1 = Flower()
        tundraFlower1.region = "Tundra"
        tundraFlower1.image = "Labrador Tea"
        tundraFlower1.name = "Labrador Tea"
        tundraFlower1.info = "Labrador Tea is a low, slow-growing shrub with evergreen leaves that are used to make tea for treating colds. This attractive, sweet-scented shrub needs only moist acid soil to show its full brilliance. Along with other advantages, the plant is used in closets to protect against moths."

        try! realm.write {
            realm.add(tundraFlower1)
        }

        let tundraFlower2 = Flower()
        tundraFlower2.region = "Tundra"
        tundraFlower2.image = "Purple Saxifrage"
        tundraFlower2.name = "Purple Saxifrage"
        tundraFlower2.info = "Purple Saxifrage is another rock-breaker, as its Latin name suggests, grows in barren, rocky landscapes in all kinds of cold temperatures. It is an evergreen cushion-forming perennial, which forms alluring magenta to pale pink or white cup flowers."

        try! realm.write {
            realm.add(tundraFlower2)
        }

        let tundraFlower3 = Flower()
        tundraFlower3.region = "Tundra"
        tundraFlower3.image = "Tundra Rose"
        tundraFlower3.name = "Tundra Rose"
        tundraFlower3.info = "Tundra Rose is an appealing shrub in the wild and has variable cultivars, with flowers from white to yellow, orange, and pink. All the cultivars are hardy and produce small but abundant flowers, fascinating through their vividness."

        try! realm.write {
            realm.add(tundraFlower3)
        }

        let tundraFlower4 = Flower()
        tundraFlower4.region = "Tundra"
        tundraFlower4.image = "Pasque"
        tundraFlower4.name = "Pasque"
        tundraFlower4.info = "Pasque Flower is a member of the Ranunculaceae family and can grow 6-8 inches off the ground. On each stem, it has one flower with 5-8 petals. The color of flower range from lavender to almost white."

        try! realm.write {
            realm.add(tundraFlower4)
        }

        let tundraFlower5 = Flower()
        tundraFlower5.region = "Tundra"
        tundraFlower5.image = "Tufted Saxifrage"
        tundraFlower5.name = "Tufted Saxifrage"
        tundraFlower5.info = "Tufted Saxifrage grows on thick stems and has several straight flower stems that can go as high as 3-15 cm. Each stem has around 2-8 flowers and each flower has five white petals. Tufted Saxifrage also has a small fruit that holds many small seeds."

        try! realm.write {
            realm.add(tundraFlower5)
        }
        
        
        
        var result = realm.objects(Flower.self)

        return Array(result)
    }
}
