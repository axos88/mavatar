Mavatar::Engine.routes.draw do
  match "/avatar/:hash", controller: "image", action: "show", via: [:get]
end
