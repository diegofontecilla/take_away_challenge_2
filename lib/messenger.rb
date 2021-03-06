require 'rubygems'
require 'twilio-ruby'

class Messenger

  def initialize(client = Twilio::REST::Client.new("ACcfaf4b488a9c4f1b1dcc213de0e0e393", "5e64970ac93af7cb2047be1bbb494716"))
    @client = client
  end

  def send_message
    message = @client.messages.create(
    body: "Thank you! Your order was placed and will be delivered before #{get_time}",
    to: "+447456252627",
    from: "+447479271338")
  end

private

  def get_time(format = "%H:%M")
    time = Time.now + 3600
    time.strftime(format)
  end
end
