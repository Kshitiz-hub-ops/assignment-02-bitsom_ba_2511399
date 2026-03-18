// OP1

db.products.insertMany([
  {
    product_id: "E001",
    name: "Samsung 55-inch Smart TV",
    category: "Electronics",
    price: 52000,
    brand: "Samsung",
    specifications: {
      screen_size: "55 inch",
      resolution: "4K",
      voltage: "220V"
    },
    warranty_years: 2,
    features: ["Smart TV", "HDR", "Dolby Audio"]
  },
  {
    product_id: "C001",
    name: "Men's Casual Shirt",
    category: "Clothing",
    price: 1200,
    brand: "Levis",
    size_options: ["S", "M", "L", "XL"],
    material: "Cotton",
    colors_available: ["Blue", "Black", "White"],
    ratings: {
      average: 4.3,
      reviews_count: 120
    }
  },
  {
    product_id: "G001",
    name: "Amul Milk 1L",
    category: "Groceries",
    price: 60,
    brand: "Amul",
    expiry_date: new Date("2024-12-30"),
    nutritional_info: {
      calories: 42,
      protein: "3.4g",
      fat: "1g"
    },
    storage_instructions: "Keep refrigerated",
    available_pack_sizes: ["500ml", "1L", "2L"]
  }
]);

// OP2

db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3

db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});

// OP4

db.products.updateOne(
  { product_id: "E001" },
  { $set: { discount_percent: 10 } }
);

// OP5

db.products.createIndex({ category: 1 });

// Explanation:
// Index on the "category" field improves query performance when filtering products
// by category (e.g., Electronics, Clothing, Groceries). Since category-based
// filtering is very common in e-commerce applications, this index helps reduce
// query execution time and improves efficiency.
