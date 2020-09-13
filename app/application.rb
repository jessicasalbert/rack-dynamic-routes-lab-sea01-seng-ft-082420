class Application

  
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
  
        if req.path.match(/items/)
            search = req.path.split("/items/").last
            item = @@items.filter { |item| item.name == search }
            if item.length > 0
                resp.write item[0].price
            else
                resp.write "Item not found"
                resp.status = 400
            end
        else
        resp.write "Route not found"
        resp.status = 404
      end
  
      resp.finish
    end
  end