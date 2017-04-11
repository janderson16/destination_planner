Fabricator(:destination) do
  name {Faker::Name.name}
  zip {Faker::Address.zip}
  description {Faker::Hipster.words}
end
