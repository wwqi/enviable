# -*- encoding: utf-8 -*-
require File.expand_path('../lib/enviable/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Joe Fredette"]
  gem.email         = ["jfredett@gmail.com"]
  gem.description   = %q{Provides higher-level access to Configuration stored in the Environment}
  gem.summary       = %q{Provides higher-level access to Configuration stored in the Environment}
  gem.homepage      = "http://github.com/jfredett/enviable"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "enviable"
  gem.require_paths = ["lib"]
  gem.version       = Enviable::VERSION
end
