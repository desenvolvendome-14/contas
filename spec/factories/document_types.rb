FactoryBot.define do
  factory :document_type do
    description { ["Pix", "Dinheiro", "Cartão de credito", "Cheque"].sample }
  end
end
