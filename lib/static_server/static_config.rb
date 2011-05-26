module Config
  class StaticConfig
    def initialize
      @redirect = {}
      @forward = {}
    end
  
    def redirect(opt)
      validate_params(opt)
      @redirect.merge! opt 
    end
    def forward(opt)
      validate_params(opt)
      @forward.merge! opt 
    end
  
    def forwards
      @forward
    end
  
    def redirects
      @redirect
    end
  private
    def validate_params(opt)
      raise "Invalid param" if opt.size != 1
    end
  end
end
