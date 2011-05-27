class StaticConfig
  attr_reader :base_dir, :forwards, :redirects
  def initialize(base_dir = nil)
    @base_dir = base_dir
    @base_dir ||= 'public'

    @redirects = {}
    @forwards = {}
    @root = 'index.html'
  end

  def redirect(opt)
    validate_params(opt)
    @redirects.merge! opt
  end

  def forward(opt)
    validate_params(opt)
    @forwards.merge! opt
  end

  def root(path = nil)
    @root = path if path
    @root
  end

 private
  def validate_params(opt)
    raise "Invalid param" if opt.size != 1
  end
end
