require 'awesome_print'

module LingvaLatina
  module Commands
    class Ave < SlackRubyBot::Commands::Base
      @@greetings = []

      File.open("lingva-latina/data/greetings.txt", "r") do |f|
        f.each_line do |line|
          @@greetings << line
        end
      end

      match /^[Aa]ve/ do |client, data, match|
          user = client.web_client.users_info(user: data.user)["user"]
          unless user['is_bot']
            send_message client, data.channel,
              "Ave, #{user['real_name']}! "+@@greetings.sample
          end
      end
    end

    class Dolor < SlackRubyBot::Commands::Base
      @@quotes = []

      File.open("lingva-latina/data/quotes.txt", "r") do |f|
        f.each_line do |line|
          @@quotes << line
        end
      end

      match /^[Dd]olor/ do |client, data, match|
          user = client.web_client.users_info(user: data.user)["user"]
          unless user['is_bot']
            send_message client, data.channel, @@quotes.sample
          end
      end
    end
  end
end