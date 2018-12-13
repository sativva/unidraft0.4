# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

da = Spree::Designer.new(lastname: "Goldschmidt", givenname: "Julie", school: "ESMOD Paris", linkedin: "https://www.linkedin.com/in/julie-goldschmidt-791a26115/", instagram: "https://www.instagram.com/j_goldschmidt/")
da1 = Spree::Designer.new(lastname: "Gasquet", givenname: "Théodore", school: nil, linkedin: "https://www.linkedin.com/in/th%25C3%25A9odore-gasquet-a5346651/", instagram: "https://www.instagram.com/theodoregasquet/", facebook: "https://www.facebook.com/theodoregasquetparis/", website: nil)
da2 = Spree::Designer.new( lastname: "Guignier", givenname: "Manon", school: "ESMOD Lyon", linkedin: "https://www.linkedin.com/in/manon-guignier-17835011a/", instagram: "https://www.instagram.com/platyne/", facebook: nil, website: "https://www.vingt-quatre-carats.com/")

da.save
da1.save
da2.save

u1 = Spree::Product.new(name: 'combi-short',description:"combi-short en coton simili jean, façon chemise à l'envers, avec dos nu",available_on: Date.today - 1, date_of_sale: Date.today,date_end_sale: Date.today + 15,min_sales_for_prod: 15 ,series_count: 150 ,designer_id: 1,level: 'croquis', publish:true)
u2 = Spree::Product.new(name: 'robe manche frou',description:"Robe rouge en coton et satin avec manche chauve souris",available_on: Date.today - 1, date_of_sale: Date.today,date_end_sale: Date.today + 15,min_sales_for_prod: 15 ,series_count: 150 ,designer_id: 2,level: 'precommande', publish:true)
u3 = Spree::Product.new(name: 'Prefecto',description:"Perfecto en simili cuir coton et tafta",available_on: Date.today - 1, date_of_sale: Date.today,date_end_sale: Date.today + 15,min_sales_for_prod: 15 ,series_count: 150 ,designer_id: 3,level: 'en vente', publish:true)
u1.master.price = 120
u2.master.price = 120
u3.master.price = 120
u1.shipping_category = Spree::ShippingCategory.first
u2.shipping_category = Spree::ShippingCategory.first
u3.shipping_category = Spree::ShippingCategory.first

u1.save
u2.save
u3.save




# Spree::Core::Engine.load_seed if defined?(Spree::Core)
# Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

