Fabricator(:service) do
  service_code    UUID.new.generate
  service_name    Faker::Lorem.words(4).join(' ')
  description     Faker::Lorem.sentences(2).join(' ')
  metadata        false
  type            ''
  keywords        Faker::Lorem.words(6).join(', ')
  group           Faker::Lorem.words(1).first
  jurisdiction_id 1
  created_at      DateTime.now
  updated_at      DateTime.now
end
