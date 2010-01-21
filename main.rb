require File.dirname(__FILE__) + '/vendor/gems/environment'

require 'sinatra'
require 'memcacheauth'

get '/' do
	'ok'
end

configure do
	CACHE = MemcacheAuth.new
end

put '/:key' do
	CACHE.set(params[:key], request.body.string)
end

get '/:key' do
	CACHE.get(params[:key])
end
