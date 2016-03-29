require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print today's date
date = Time.now
puts "Today's Date: #{date.strftime("%x")}"


puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "


# For each product in the data set:
products_hash["items"].each do |toy|  
  # Print the name of the toy
  puts toy["title"]


  puts "*****************"

  # Print the retail price of the toy
  ret_price = toy["full-price"].to_f

  #ret_price = eval ("ret_price_s")
  puts "Retail Price: $#{ret_price}"
  # Calculate and print the total number of purchases
  total_purch = toy["purchases"].length
  puts "Number Purchases: #{total_purch}"
  # Calculate and print the total amount of sales
    total_sales = 0.0
  toy["purchases"].each do |purchase|
      total_sales += purchase["price"]
    end
  puts "Total Sales: $#{total_sales}"
  # Calculate and print the average price the toy sold for
  avg_price = 0.00
  avg_price = total_sales / total_purch
  puts "Average Price: $#{avg_price.round(2)}"
  # Calculate and print the average discount (% or $) based off the average sales price
  avg_disc = 0.00
  avg_disc = ret_price.to_f - avg_price.to_f
  puts "Average Discout: $#{avg_disc.round(2)}"

  disc_perc = 0.00
  disc_perc = (avg_disc.to_f / ret_price.to_f) * 100
  puts "Average Discount Percentage: #{disc_perc.round(2)}%"
  puts "\n"
  end

	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts

# For each brand in the data set:
unique_brands = products_hash["items"].map { |item| item["brand"]}.uniq
  unique_brands.each_with_index do |brand,index|

brands_toys = products_hash["items"].select { |item| item["brand"]==brand}
  # Print the name of the brand
  puts brand
  puts "*****************" 
  # Count and print the number of the brand's toys we stock
  brand_stock = 0
  brands_toys.each do |item|
    brand_stock += item["stock"]
  end
  puts "Number of Products: #{brand_stock}"
  # Calculate and print the average price of the brand's toys
  brand_full_price = 0.00
  brands_toys.each do |item|
    brand_full_price += item["full-price"].to_f
  end
  brand_av_price = brand_full_price / brands_toys.length
  puts "Average Product Price: $#{brand_av_price.round(2)}"
  # Calculate and print the total revenue of all the brand's toy sales combined
  brand_sales = 0
    brands_toys.each do |item|
      item["purchases"].each do |bt|
        brand_sales += bt["price"].to_f
    end
  end
  puts "Total Sales: $#{brand_sales.round(2)}"
  puts "\n"
   end

 