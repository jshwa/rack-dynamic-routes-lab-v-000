class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match /items/
      item_from_path = req.path.split(/items./).last
      if @@item.include?(item)
        resp.write @@item.detect {|item| item.name = item_from_path}.price
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
