FactoryBot.define do
    factory :client, class: Client do
        name { Faker::Name.name }
        birthdate { Faker::Date.birthday(min_age: 18, max_age: 65) }
        project { Faker::Company.bs }
        country { Faker::Address.country }
        role { Faker::Company.profession }
    end

    factory :employee, class: Employee do
        name { Faker::Name.name }
        birthdate { Faker::Date.birthday(min_age: 18, max_age: 65) }
        project { Faker::Company.bs }
        country { Faker::Address.country }
        role { Faker::Company.profession }
    end
end