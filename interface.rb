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
    itens << product
  else
    puts "Sorry, we don't have #{product} today.."
  end
end
sum = 0
itens.each do |item|
  sum += products[item.to_sym]
end

# Ao terminar de comprar mostrar o total
puts "------BILL-----"
puts "Total R$ #{sum}"
puts "-" * 20
