require 'sinatra/base'

module LingvaLatina
  class Web < Sinatra::Base
    get '/' do
      'Lingva latina non penis canina est.'
    end
  end
end