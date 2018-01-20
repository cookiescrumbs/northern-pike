lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'northern_pike/version'

Gem::Specification.new do |spec|
  spec.name          = 'northern_pike'
  spec.version       = NorthernPike::VERSION
  spec.authors       = ['Steven']
  spec.email         = ['stevenjamescook@gmail.com']

  spec.summary       = 'Chomps on some text containing OS Refs, titles and a descriptions for waters and spits out an array of waters containing a title, a descriptions and a lat,lng.'
  spec.description   = 'Chomps on some text containing OS Refs, titles and a descriptions for waters and spits out an array of waters containing a title, a descriptions and a lat,lng.'
  spec.homepage      = 'https://github.com/cookiescrumbs/northern-pike'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise 'RubyGems 2.0 or newer is required to protect against '' \
  #   'public gem pushes.'
  # end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'global_convert'
  spec.add_dependency 'os_map_ref'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'

end
