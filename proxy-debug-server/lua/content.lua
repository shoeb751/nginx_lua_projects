-- Get the request line
local req=ngx.var.request
-- Use the following line to set custom headers in the response (Repeat as required)
-- ngx.header["Random"] = "Random response header"
ngx.say("Request:\n---")
ngx.say(req)
ngx.say("---")
-- Get Request Headers
ngx.say("\nHeaders:\n---")
local heads=ngx.req.get_headers()
for k, v in pairs(heads) do
        ngx.say(k,": ",v)
end
ngx.say("---")
-- Get Query Parameters
ngx.say("\nQuery Parameters:\n---")
local args = ngx.req.get_uri_args()
for k, v in pairs(args) do
        ngx.say(k,": ",v)
end
ngx.say("---")
-- Get body data only if request is POST
if req:find("POST") then
        ngx.req.read_body()
        local body =  ngx.req.get_body_data()
        ngx.say("\nRequest Body:\n---")
        ngx.say(body)
        ngx.say("---")
else
        ngx.say("\nNo body for non POST request")
end