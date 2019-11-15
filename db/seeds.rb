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


54.times do
  random_number =  rand(1..10)
  Place.create(
    name: Faker::Address.city,
	description:  Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4),
	image_url: "https://res.cloudinary.com/hedspi/image/upload/v1564448966/travel-discovery/play_places/#{random_number}.jpg"
	)
end

def time_rand from = 0.0, to = Time.now
  Time.at(from + rand * (to.to_f - from.to_f))
end

def price_rand (min = 0.0, max)
    a = rand * (max-min) + min
    a.round(2)
end

providers = Provider.order(:id).take(5)
categories = Category.order(:id)
places = Place.order(:id).take(5)
providers.each do |provider|
	categories.each do |category|
		case category.id
			when 1
				places.each do |place|
					st = time_rand(Time.local(2019, 1, 1), Time.local(2019, 2, 1)).to_date
					et = time_rand(Time.local(2019, 3, 1), Time.local(2019, 4, 1)).to_date
					service = Service.create!(name: Faker::Educator.course_name, description: Faker::Restaurant.description, option:"",provider_id: provider.id,category_id: category.id,place_id: place.id,start_time: st,end_time: et, price: price_rand(100,1000)  );
					(1..8).to_a.shuffle.take(3).each do |i|
	        			ServiceImage.create! link: "https://res.cloudinary.com/hedspi/image/upload/v1564448966/travel-discovery/hotels/#{i}.jpg",
	                       service_id: service.id
	                end
                end
			when 2
				places.each do |place|
					service = Service.create!(name: Faker::Educator.course_name, description: Faker::Restaurant.description, option:"",provider_id:provider.id,category_id:category.id, place_id: place.id,price: price_rand(100,1000));
					(1..11).to_a.shuffle.take(2).each do |i|
			        	ServiceImage.create! link: "https://res.cloudinary.com/hedspi/image/upload/v1564448966/travel-discovery/food/#{i}.jpg",
			                       service_id: service.id
	                end
	            end
			when 3
			when 4
		end
	end
end

users = User.order(:id).take(5)
services = Service.order(:id).take(5)
users.each do |user|
	schedule = Schedule.create!(name: Faker::Restaurant.name, description:  Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4), user_id: user.id)
	services.each do |service|
		ServiceBooking.create!(user_id: user.id, schedule_id: schedule.id)
	end	
end

users = User.order(:id).take(5)
users.each do |user|
	5.times do
		Schedule.create!(name: Faker::Restaurant.name, description:  Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4), user_id: user.id)
	end
end

