# Mensagem de boas vindas
puts "-" * 20
puts "Welcome to Instacart"
puts "-" * 20
products = {
  kiwi: 1.25,
  banana: 0.5,
  mango: 4,
  aspargus: 9
}
itens = []
puts "In our store today:"
# Mostrar produtos e preços
products.each do |product, price|
  puts "#{product}: R$ #{sprintf('%.2f', price)}"
end
# Perguntar o que quer comprar (em loop)
loop do
  puts "Which item? (or 'quit' to checkout)"
  product = gets.chomp
  break if product == 'quit'
  if products.keys.include?(product.to_sym)
    puts "Quantity?"
    quantity = gets.chomp.to_i
    itens << {product.to_sym => quantity}
  else
    puts "Sorry, we don't have #{product} today.."
  end
end

sum = 0
puts "------BILL-----"
itens.each do |item|
  product = item.keys[0]
  price = products[product]
  quantity = item.values[0]
  subtotal = price * quantity
  puts "#{product}: #{quantity} X #{price} = #{subtotal}"
  sum += subtotal
end

# Ao terminar de comprar mostrar o total
puts "Total R$ #{sum}"
puts "-" * 20
