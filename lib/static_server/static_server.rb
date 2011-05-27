class StaticServer
  def self.start(base_dir = nil)
    config = StaticConfig.new(base_dir)

    yield config if block_given?

    return Proc.new{ |env|
        if config.redirects.keys.include? env["PATH_INFO"]
          [302, {"Location" => config.redirects[env["PATH_INFO"]], "Content-Type" => "text/html"}, []]
        else
          if config.forwards.keys.include? env["PATH_INFO"]
            env["PATH_INFO"] = config.forwards[env["PATH_INFO"]]
          end

          if env["PATH_INFO"] == '/'
            env["PATH_INFO"] = config.root
          end

          Rack::File.new("./#{config.base_dir}").call(env)
        end
      }

  end
end
