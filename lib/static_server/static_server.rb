class StaticServer
  def self.configure(params = {})
    options = {:root => 'index.html', :base_dir => 'public'}
    options.merge!(params)
    config = StaticConfig.new

    yield config if block_given?

    return Proc.new{ |env|
        if config.redirects.keys.include? env["PATH_INFO"]
          [302, {"Location" => config.redirects[env["PATH_INFO"]], "Content-Type" => "text/html"}, []]
        else
          if config.forwards.keys.include? env["PATH_INFO"]
            env["PATH_INFO"] = config.forwards[env["PATH_INFO"]]
          end

          if env["PATH_INFO"] == '/'
            env["PATH_INFO"] = options[:root]
          end
          
          Rack::File.new("./#{options[:base_dir]}").call(env)
        end
      }
    
  end
end
