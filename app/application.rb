class Application
  def call
    resp = Rack::Response.new
    req = Rack::Request.new

    if req.path.match /item/
      item = req.path.split(/item/).last
      resp.write item.price
    else
      resp.write "Page not Found"
      resp.status 404

    resp finish
  end
end
