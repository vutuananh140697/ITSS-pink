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
