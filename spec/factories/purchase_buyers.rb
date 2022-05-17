FactoryBot.define do
  factory :purchase_buyer do
    postalcode { '123-4567' }
    prefecture { 1 }
    city { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    price { 2000 }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
