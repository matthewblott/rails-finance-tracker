class Stock < ApplicationRecord

  def self.new_lookup(ticker_symbol)

    secret_token = Rails.application.credentials.iex_client[:secret_token]
    publishable_token = Rails.application.credentials.iex_client[:publishable_token]

    client = IEX::Api::Client.new(
      publishable_token: publishable_token,
      secret_token: secret_token,
      endpoint: 'https://cloud.iexapis.com/v1'
    )
    
    begin
      new(ticker: ticker_symbol, 
        name: client.company(ticker_symbol).company_name, 
        last_price: client.price(ticker_symbol))
    rescue StandardError => exception
      return nil      
    end
    
  end
end
