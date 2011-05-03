## irbcp.gemspec
#

Gem::Specification::new do |spec|
  spec.name = "irbcp"
  spec.version = "0.0.2"
  spec.platform = Gem::Platform::RUBY
  spec.summary = "irbcp"
  spec.description = "description: irbcp kicks the ass"

  spec.files =
["README", "Rakefile", "irbcp.gemspec", "irbcp.rb", "lib", "lib/irbcp.rb"]

  spec.executables = []
  
  spec.require_path = "lib"

  spec.test_files = nil

### spec.add_dependency 'lib', '>= version'
#### spec.add_dependency 'map'

  spec.extensions.push(*[])

  spec.rubyforge_project = "codeforpeople"
  spec.author = "Ara T. Howard"
  spec.email = "ara.t.howard@gmail.com"
  spec.homepage = "https://github.com/ahoward/irbcp"
end
