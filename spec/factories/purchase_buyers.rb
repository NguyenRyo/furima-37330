FactoryBot.define do
  factory :purchase_buyer do
    postalcode { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    token {"tok_abcdefghijk00000000000000000"}
    tel { '0000000000' }
  end
end
