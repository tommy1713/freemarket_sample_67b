CSV.foreach('db/product.csv') do |row|
  Product.find_or_create_by(product: [row])
end
