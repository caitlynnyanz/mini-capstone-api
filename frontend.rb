require "http"

system "clear"

response = HTTP.get("http://localhost:3000/all_products")

pp JSON.parse(response.body)
