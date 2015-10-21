# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# def assert(test)
#   raise "whoops" unless test
# end


class Model
  def initialize(file)
    @file = File.readlines(file)
  end

  def get_phrase
    @file.sample
  end

  def phrase_count
    @file.length
  end
end

# filename = "phrase_file.txt"
# assert Model.new(filename).is_a?(Model)

# m = Model.new filename
# assert m.get_phrase.is_a?(String)

# p m.get_phrase

class View
  class << self
    def welcome
      puts "welcome to my system"
      puts "-"*50
    end

    def render(content)
      if rand(1..5) > 3
        render_to_console(content)
      else
        render_to_sms(content)
      end
    end

    def render_to_console(content)
      puts content
    end

    def render_to_sms(content)
      # Get your Account Sid and Auth Token from twilio.com/user/account
      account_sid = 'GET_THIS_FROM_TWILIO'
      auth_token = 'GET_THIS_FROM_TWILIO_ALSO'
      @client = Twilio::REST::Client.new account_sid, auth_token

      message = @client.account.messages.create(:body => content,
        :to => "+17753797629",
        :from => "+12024704118")
      puts "text message sent."
    end

    def wrapup
      puts "all done"
      puts "-"*50
    end
  end
end

class Controller
  class << self
    def run!
      View.welcome

      input = get_input

      if input == ""
        connection = Model.new "phrase_file.txt"
        connection.phrase_count.times do
          View.render connection.get_phrase
        end
      else
        View.render input
      end
      View.wrapup
    end

    def get_input
      gets.chomp
    end
  end
end

#########################################################

Controller.run!
