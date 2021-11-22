FactoryBot.define do
  factory :registered_couple do
    first_name "John"
    surname "Smith"
    address "50 The Drive, Tawa, Wellington 5028"
    email "john.smith@gmail.com"
    age 25
    phone_number 0273443555
    religion "CATHOLIC"
    parish "STS PETER AND PAUL CHURCH, LOWER HUTT"
    fiance_first_name "Rachel"
    fiance_surname "Jones"
    fiance_address "50 The Drive, Tawa, Wellington 5028"
    fiance_email "rachel.jones@gmail.com"
    fiance_age 22
    fiance_phone_number 0218194422
    fiance_religion "NO RELIGION"
    wedding_date "18-01-2017"
    post_wedding_address "4 Cashmere Ave, Khandallah, Wellington"
  end

end
