class Stock < ApplicationRecord

  def self.new_lookup(ticker_symbol)

    secret_token = Rails.application.credentials.iex_client[:secret_token]
    publishable_token = Rails.application.credentials.iex_client[:publishable_token]

    client = IEX::Api::Client.new(
      publishable_token: publishable_token,
      secret_token: secret_token,
      endpoint: 'https://cloud.iexapis.com/v1'
    )
    
    client.price(ticker_symbol)

  end
end
