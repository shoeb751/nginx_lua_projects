function readAll(file)
        local f = io.open(file, "rb")
        local content = f:read("*all")
        f:close()
        return content
end
ngx.header["Content-Type"] = "application/x-www-form-urlencoded"

if ngx.var.http_accept_esi == "1.0" then
        ngx.header["Edge-Control"] = "dca-enable-debugging-tag"
        local con = readAll("/tmp/lua/code.esi")
        ngx.say(con)
else

        local heads=ngx.req.get_headers()
        local req=ngx.var.request
        ngx.header["Set-Cookie"] = "hello=100"
        ngx.header["Random"] = "From include request"
        ngx.say("Request:\n---")
        ngx.say(req)
        ngx.say("---")
        ngx.say("\nHeaders:")
        ngx.say("---")
        for k, v in pairs(heads) do
                ngx.say(k,": ",v)
        end
        ngx.say("---")

        if req:find("POST") then
                ngx.req.read_body()
                local body =  ngx.req.get_body_data()
                ngx.say("\nRequest Body:\n---")
                ngx.say(body)
                ngx.say("---")
        else
                ngx.say("\nNo body for non POST request")
        end
end

