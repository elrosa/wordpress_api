require 'helper'

describe Wordpress::Api do
  before do
    client.stub(:consumer).and_return(consumer)
    client.authorize_from_access('atoken', 'asecret')
  end

  let(:client){Wordpress::Client.new('token', 'secret')}
  let(:consumer){OAuth::Consumer.new('token', 'secret', {:site => 'https://public-api.wordpress.com'})}

  it "should be able to view the account profile" do
    stub_request(:get, "https://public-api.wordpress.com/rest/v1/me").to_return(:body => "{}")
    client.profile.should be_an_instance_of(Wordpress::Mash)
  end

end
