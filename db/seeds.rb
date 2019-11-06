require 'faker'

User.create(username: "admin test", email: "admin@example.com", password: "admin@123",role: "admin")

User.create(username:"user test", email: "user@example.com", password: "user@123",role: "member")

16.times do |n|
    User.create!([
	    {
    		email: "user#{n+1}@example.com",
    		username: Faker::Name.unique.name,
    		password: "user@123",
    		role: "member"
    	}
    ])
end

16.times do |n|
    Provider.create!([
	    {
    		email: "provider#{n+1}@provider.com",
    		name: Faker::Company.name,
    		description: "",
    		address:  Faker::Address.street_address,
    		phone_number: Faker::PhoneNumber.cell_phone,
    	}
    ])
end

Category.create!([
	{id:1,
		name: "Hotel",
		description: "Hotel",
	},
	
	{id:2,
		name: "Restaurant",
		description: "Restaurant",
	},
	
	{id:3,
		name: "Supermarket",
		description: "Supermarket",
	},
	
	{id:4,
		name: "Movie Theater",
		description: "Movie Theater",
	},
])

providers = Provider.order(:id).take(5)
categories = Category.order(:id)
providers.each do |provider|
	categories.each do |category|
		case category.id
			when 1
				service = Service.create!(description: Faker::Restaurant.description, option:"",provider_id: provider.id,category_id: category.id);
				(1..8).to_a.shuffle.take(3).each do |i|
        			ServiceImage.create! link: "https://res.cloudinary.com/hedspi/image/upload/v1564448966/travel-discovery/hotels/#{i}.jpg",
                       service_id: service.id
                end
			when 2
				service = Service.create!(description: Faker::Restaurant.description, option:"",provider_id:provider.id,category_id:category.id);
				(1..11).to_a.shuffle.take(2).each do |i|
		        	ServiceImage.create! link: "https://res.cloudinary.com/hedspi/image/upload/v1564448966/travel-discovery/food/#{i}.jpg",
		                       service_id: service.id
                end
			when 3
			when 4
		end
	end
end

users = User.order(:id).take(5)
services = Service.order(:id).take(5)
users.each do |user|
	schedule = Schedule.create!(description:  Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4), user_id: user.id)
	services.each do |service|
		ServiceBooking.create!(user_id: user.id, schedule_id: schedule.id)
	end	
end


Place.create!([
	    {
    		name: "Hà Nội",
    		description: "Hà Nội nghìn năm văn vở"
    	},
    	{
    		name: "Nam Định",
    		description: "Quê của Vũ Tuấn Anh"
    	},
    	{
    		name: "Sa Pa",
    		description: "lạnh buốt"
    	},
    	{
    		name: "Hồ Chí Minh",
    		description: "abc"
    	},
    	{
    		name: "Đà Nẵng",
    		description: "Đà Nẵng nghìn năm văn vở"
    	},
    ])