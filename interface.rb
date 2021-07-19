# Mensagem de boas vindas
puts "-" * 20
puts "Welcome to Instacart"
puts "-" * 20

products = {
  kiwi: { price: 1.25, stock: 5 },
  banana: { price: 0.5, stock: 4 },
  mango: { price: 4, stock: 1 },
  aspargus: { price: 9, stock: 10 }
}

itens = []

# Perguntar o que quer comprar (em loop)
loop do

  puts "In our store today:"
  # Mostrar produtos e preços
  products.each do |product, info|
    puts "#{product}: R$ #{sprintf('%.2f', info[:price])} (#{info[:stock]} available)"
  end


  puts "Which item? (or 'quit' to checkout)"
  product = gets.chomp.to_sym

  break if product.to_s == 'quit'

  if products.keys.include?(product) # Verifica se existe o item pedido
    puts "Quantity?"
    quantity = gets.chomp.to_i

    # Exemplo de products[product] => {price: 1.25, stock: 5}
    stock = products[product][:stock]

    if quantity <= stock # Possui produtos suficientes
      itens << { product => quantity }
      products[product][:stock] -= quantity
    else # Não existe o item pedido
      puts "Sorry, only #{stock} available"
    end
  else
    puts "Sorry, we don't have #{product} today.."
  end
end

sum = 0

puts "------BILL-----"

# Exemplo de itens (array de hash)
# itens = [{kiwi: 2}, {banana: 5}, {mango: 20}]

itens.each do |item|
  # Exemplo de item: {kiwi: 2}

  product = item.keys[0] # => :kiwi

  price = products[product][:price] # products[:kiwi] => 1.25

  quantity = item.values[0] # => 2

  subtotal = price * quantity

  # Exibe o subtotal de cada item
  puts "#{product}: #{quantity} X #{price} = #{subtotal}"

  sum += subtotal # incrementa o subtotal ao sum
end

# Ao terminar de comprar mostrar o total
puts "Total R$ #{sum}"
puts "-" * 20
