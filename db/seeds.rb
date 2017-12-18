# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

raise if User.count > 0 || Category.count > 0 || Product.count > 0
u1 = User.create(:user_name => "Manik", :salt_password => "secret")
u2 = User.create(:user_name => "Ronaldo", :salt_password => "cr7")
u3 = User.create(:user_name => "Messi", :salt_password => "lm10")
u4 = User.create(:user_name => "Virat", :salt_password => "kolhi")
u5 = User.create(:user_name => "Ruby", :salt_password => "rails")
u6 = User.create(:user_name => "Test", :salt_password => "pass")

c1 = Category.create(:name => "Sports")
c2 = Category.create(:name => "News")
c3 = Category.create(:name => "Headlines")
c4 = Category.create(:name => "City")
c5 = Category.create(:name => "Metro")
c6 = Category.create(:name => "Fashion")
c7 = Category.create(:name => "Crime")
c8 = Category.create(:name => "Public Interest")

Product.create(:user_id => u1.id, :category_id => c1.id, :name => "Project 1")
Product.create(:user_id => u3.id, :category_id => c3.id, :name => "Project 2")
Product.create(:user_id => u2.id, :category_id => c1.id, :name => "Project 3")
Product.create(:user_id => u3.id, :category_id => c7.id, :name => "Project 4")
Product.create(:user_id => u4.id, :category_id => c7.id, :name => "Project 5")
Product.create(:user_id => u5.id, :category_id => c5.id, :name => "Tester")
Product.create(:user_id => u6.id, :category_id => c4.id, :name => "Defender")
Product.create(:user_id => u2.id, :category_id => c2.id, :name => "Google")
Product.create(:user_id => u4.id, :category_id => c7.id, :name => "Ajax")
Product.create(:user_id => u5.id, :category_id => c1.id, :name => "Real Madrid")
Product.create(:user_id => u6.id, :category_id => c3.id, :name => "My Project")
Product.create(:user_id => u1.id, :category_id => c2.id, :name => "News")
Product.create(:user_id => u2.id, :category_id => c6.id, :name => "ASP")
Product.create(:user_id => u4.id, :category_id => c5.id, :name => "News")
Product.create(:user_id => u5.id, :category_id => c7.id, :name => "Apple")
Product.create(:user_id => u5.id, :category_id => c2.id, :name => "Banana")
Product.create(:user_id => u6.id, :category_id => c1.id, :name => "Minion")