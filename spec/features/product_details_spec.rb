require 'rails_helper'

RSpec.feature "User navigates from the home page to the product detail page by clicking on a product", type: :feature, js: true do

  #SETUP
  before :each do
    @category = Category.create! name: "Apparel"

    10.times do |n|
    @category.products.create(
      name: Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
    end
  end

  scenario "they see all products" do
  #ACT
  visit root_path
  first(:link, "Details").click
  sleep(1)


  #DEBUG
  save_screenshot "test3.png"
  puts page.html

  #VERIFY
  expect(page).to have_text ('Description')

  end
end
