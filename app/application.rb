class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match /items/
      item_from_path = req.path.split(/items./).last
      if Item.all.include?(item_from_path)
        resp.write Item.all.detect {|item| item.name = item_from_path}.price
      else
        resp.write "No such item"
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
