# -*- encoding: utf-8 -*-
require File.expand_path('../lib/text_weaver/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors = ['Wybo Wiersma']
  gem.email = ['mail@wybowiersma.net']
  gem.description = 'Weaves html tags (or really anything) into a text at given opening or closing positions. Inserted tags need to be aligned (that is non-overlapping) in order to be inserted. Opening and closing tags are inserted and kept in order. Inspired by Ted Nelsons project Xanadu.'
  gem.summary = 'Weaves tags into a text at given positions'
  gem.homepage = 'http://github.com/wybo/textweaver'

  gem.files = `git ls-files`.split($\)
  gem.test_files = gem.files.grep(%r{^test/test_.*})
  gem.name = 'textweaver'
  gem.require_paths = ['lib']
  gem.version = TextWeaver::VERSION

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'test-unit'
  gem.add_development_dependency 'require_relative'
end
