import 'package:ecommerce/helper/constants.dart';

class ClothesModel {
  final String id;
  final String title;
  final double price;
  final String image;
  final String desc;
  final double rating;
  final bool isFeatured;
  final DateTime releaseDate;
  bool isInCart;
  bool isFavorite;
  int quantity;

  bool isSelled;

  ClothesModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.desc,
    required this.rating,
    required this.releaseDate,
    required this.isFeatured,
    this.isInCart = false,
    this.isFavorite = false,
    this.isSelled=false,
    this.quantity = 1,
  });

  void incrementQuantity() {
    quantity++;
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }

  static List<ClothesModel> getRealClothesData() {
    final List<ClothesModel> clothes = [];

    final List<Map<String, dynamic>> clothingItems = [
      // T-Shirts
      {
        "title": "Premium Cotton T-Shirt",
        "desc":
            "Soft, breathable cotton t-shirt perfect for casual wear. Available in multiple colors with excellent durability.",
        "image": Constants.tshirtImage,
        "rating": 4.5,
        "price": 25.99,
      },
      {
        "title": "Vintage Graphic Tee",
        "desc":
            "Retro-inspired graphic t-shirt with unique designs. Made from high-quality cotton blend for comfort.",
        "image": Constants.tshirtImage,
        "rating": 4.3,
        "price": 29.99,
      },
      {
        "title": "Basic Crew Neck Tee",
        "desc":
            "Essential wardrobe staple with classic fit. Perfect for layering or wearing alone.",
        "image": Constants.tshirtImage,
        "rating": 4.2,
        "price": 19.99,
      },
      {
        "title": "Oversized Street Tee",
        "desc":
            "Trendy oversized t-shirt with urban streetwear design. Perfect for casual everyday looks.",
        "image": Constants.tshirtImage,
        "rating": 4.4,
        "price": 32.99,
      },

      // Shirts
      {
        "title": "Classic White Dress Shirt",
        "desc":
            "Professional dress shirt perfect for office or formal occasions. Wrinkle-resistant fabric.",
        "image": Constants.shirtImage,
        "rating": 4.7,
        "price": 49.99,
      },
      {
        "title": "Casual Flannel Shirt",
        "desc":
            "Comfortable flannel shirt with classic plaid pattern. Perfect for autumn and winter wear.",
        "image": Constants.shirtImage,
        "rating": 4.4,
        "price": 39.99,
      },
      {
        "title": "Oxford Button-Down",
        "desc":
            "Timeless oxford shirt with button-down collar. Versatile piece for both casual and semi-formal wear.",
        "image": Constants.shirtImage,
        "rating": 4.6,
        "price": 44.99,
      },
      {
        "title": "Linen Summer Shirt",
        "desc":
            "Lightweight linen shirt perfect for hot weather. Breathable fabric with relaxed fit.",
        "image": Constants.shirtImage,
        "rating": 4.3,
        "price": 42.99,
      },

      // Trousers
      {
        "title": "Slim Fit Chinos",
        "desc":
            "Modern slim-fit chinos made from premium cotton twill. Perfect for smart-casual occasions.",
        "image": Constants.trossiresImage,
        "rating": 4.5,
        "price": 59.99,
      },
      {
        "title": "Classic Dress Pants",
        "desc":
            "Elegant dress pants with tailored fit. Ideal for business and formal events.",
        "image": Constants.trossiresImage,
        "rating": 4.8,
        "price": 79.99,
      },
      {
        "title": "Casual Joggers",
        "desc":
            "Comfortable joggers with elastic waistband. Perfect for workouts or lounging.",
        "image": Constants.trossiresImage,
        "rating": 4.1,
        "price": 34.99,
      },
      {
        "title": "Cargo Pants",
        "desc":
            "Utility cargo pants with multiple pockets. Durable construction for outdoor activities.",
        "image": Constants.trossiresImage,
        "rating": 4.2,
        "price": 54.99,
      },

      // Shoes
      {
        "title": "Running Sneakers",
        "desc":
            "High-performance running shoes with advanced cushioning technology. Perfect for daily runs.",
        "image": Constants.shoesImage,
        "rating": 4.6,
        "price": 129.99,
      },
      {
        "title": "Casual Canvas Shoes",
        "desc":
            "Classic canvas sneakers perfect for everyday wear. Comfortable and stylish design.",
        "image": Constants.shoesImage,
        "rating": 4.3,
        "price": 49.99,
      },
      {
        "title": "Leather Dress Shoes",
        "desc":
            "Elegant leather dress shoes crafted from genuine leather. Perfect for formal occasions.",
        "image": Constants.shoesImage,
        "rating": 4.7,
        "price": 159.99,
      },
      {
        "title": "Basketball Sneakers",
        "desc":
            "High-top basketball shoes with excellent ankle support. Perfect for sports and street style.",
        "image": Constants.shoesImage,
        "rating": 4.5,
        "price": 119.99,
      },

      // Boots
      {
        "title": "Hiking Boots",
        "desc":
            "Durable hiking boots with waterproof construction. Perfect for outdoor adventures.",
        "image": Constants.bootImage,
        "rating": 4.8,
        "price": 189.99,
      },
      {
        "title": "Chelsea Boots",
        "desc":
            "Stylish chelsea boots with elastic side panels. Versatile footwear for various occasions.",
        "image": Constants.bootImage,
        "rating": 4.5,
        "price": 149.99,
      },
      {
        "title": "Work Boots",
        "desc":
            "Heavy-duty work boots with steel toe protection. Built for safety and durability.",
        "image": Constants.bootImage,
        "rating": 4.4,
        "price": 199.99,
      },
      {
        "title": "Combat Boots",
        "desc":
            "Military-style combat boots with lace-up design. Perfect for edgy fashion statements.",
        "image": Constants.bootImage,
        "rating": 4.3,
        "price": 139.99,
      },

      // Bags
      {
        "title": "Leather Messenger Bag",
        "desc":
            "Professional messenger bag made from genuine leather. Perfect for work and travel.",
        "image": Constants.bagImage,
        "rating": 4.6,
        "price": 89.99,
      },
      {
        "title": "Canvas Backpack",
        "desc":
            "Durable canvas backpack with multiple compartments. Ideal for students and travelers.",
        "image": Constants.bagImage,
        "rating": 4.4,
        "price": 59.99,
      },
      {
        "title": "Travel Duffel Bag",
        "desc":
            "Spacious duffel bag perfect for weekend trips and gym sessions. Water-resistant material.",
        "image": Constants.bagImage,
        "rating": 4.3,
        "price": 74.99,
      },
      {
        "title": "Laptop Backpack",
        "desc":
            "Tech-friendly backpack with padded laptop compartment. Perfect for professionals and students.",
        "image": Constants.bagImage,
        "rating": 4.7,
        "price": 79.99,
      },
    ];

    // Create variations for each item
    for (int i = 0; i < clothingItems.length; i++) {
      final item = clothingItems[i];

      final variations = [
        {"suffix": "", "ratingAdjust": 0.0},
        {"suffix": " - Black Edition", "ratingAdjust": 0.1},
        {"suffix": " - Navy Blue", "ratingAdjust": 0.05},
        {"suffix": " - Premium", "ratingAdjust": 0.2},
      ];

      for (int j = 0; j < variations.length; j++) {
        final variation = variations[j];
        final adjustedRating =
            (item['rating'] as double) + (variation['ratingAdjust'] as double);
        final basePrice = item['price'] as double;
        final adjustedPrice =
            basePrice + (j * 5.0); // Add $5 for each variation

        // Create realistic release dates
        final releaseDate = DateTime(
          2024 - (i % 2), // 2023 or 2024
          1 + ((i + j) % 12), // Month 1-12
          1 + ((i * j + 5) % 28), // Day 1-28
        );

        // Generate unique ID for each item
        final uniqueId = 'item_${i}_${j}_${DateTime.now().millisecondsSinceEpoch % 10000}';

        clothes.add(
          ClothesModel(
            id: uniqueId, // Added the missing ID
            title: "${item['title']}${variation['suffix']}",
            desc: item['desc'] as String,
            rating: double.parse(
              adjustedRating.toStringAsFixed(1),
            ), // Keep one decimal
            releaseDate: releaseDate,
            image: item['image'] as String,
            isInCart: false, // Default value
            isFavorite: false, // Default value
            isSelled: false,
            isFeatured: (i + j) % 7 == 0, // Every 7th item is featured
            price: double.parse(
              adjustedPrice.toStringAsFixed(2),
            ), // Price with 2 decimals
          ),
        );
      }
    }

    // Shuffle the list to make it more random
    clothes.shuffle();

    return clothes.take(50).toList(); // Return 50 items
  }
}