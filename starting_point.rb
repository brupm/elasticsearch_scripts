require 'debugger'
require 'tire'

Tire.configure { logger STDERR }

klass = Tire.index 'search' do
  delete

  store first: 'Kimberly', last: "Smith", middle: "middle"
  store first: 'Barbara', last: "Venezuela", middle: "middle"
  store first: 'John', last: "Maria", middle: "middle"
  store first: 'Nancy', last: "Smith", middle: "middle"

  refresh
end


s = Tire.search 'search' do |q|
  # write your query here...
end

p s.results.to_a.collect { |x| "#{x.first} #{x.last}" }
