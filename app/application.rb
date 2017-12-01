class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match /item/
      item = req.path.split(/item/).last
      resp.write item.price
    else
      resp.write "Page not Found"
      resp.status 404
    end

    resp finish
  end
end
