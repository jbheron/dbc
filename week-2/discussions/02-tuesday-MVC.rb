require 'twilio-ruby'

class FileAdapter # model

  def self.load(file)
    @lines = File.readlines(file)
    self
  end

  def self.get_message
    @lines.sample
  end

  def self.save
    # not implemented
  end

end

class UI # view

  def self.pre
    puts "welcome to my cool messegenatorizer!"
    print "here's my message: "
  end

  def self.post
    puts "didja see it?"
    puts "-"*50
  end

  def send_console(text)
    pre
    puts text
    post
  end

  def self.render(text, mode = :console)
    case mode
    when :console
      send_console(text)
    when :sms
      send_sms(text)
    end
  end

  def self.send_sms(text)
    number = '+13522839257'
    puts "sending sms to #{number}"

    # Get your Account Sid and Auth Token from twilio.com/user/account
    account_sid = 'GET YOUR OWN ACCOUNT!'
    auth_token = 'GET YOUR OWN ACCOUNT!'
    @client = Twilio::REST::Client.new account_sid, auth_token

    message = @client.account.messages.create(:body => text,
        :to => number,
        :from => "GET YOUR OWN NUMBER")
  end
end


class Messenger

  def self.run(file)
    message = FileAdapter.load(file).get_message
    UI.render(message, [:console, :sms].sample)
  end

end

# ---

Messenger.run('data.txt')

