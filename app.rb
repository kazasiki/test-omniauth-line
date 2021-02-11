require "sinatra"
require "omniauth"
require "omniauth-line"
require "json"

class SinatraOmniAuth < Sinatra::Base
  configure do
    set :sessions, true
    set :inline_templates, true
    set :bind, '0.0.0.0'
  end

  use OmniAuth::Builder do
    provider :line, ENV['CHANNEL_ID'], ENV['CHANNEL_SECRET']
  end

  get "/" do
    erb <<-"EOS"
      <form method='post' action='/auth/line'>
        <input type="hidden" name="authenticity_token" value='#{request.env["rack.session"]["csrf"]}'>
        <button type='submit'>Login with Line</button>
      </form>
    EOS
  end

  get "/auth/:provider/callback" do
    @provider = params[:provider]
    @result = request.env["omniauth.auth"]
    erb <<-"EOS"
      <a href='/'>Top</a><br/>
      <h1><%= @provider %></h1>
      <pre><%= JSON.pretty_generate(@result) %></pre>
    EOS
  end
end

SinatraOmniAuth.run! if __FILE__ == $0
